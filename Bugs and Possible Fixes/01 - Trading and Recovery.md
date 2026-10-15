---
type: bug-audit
created: 2026-10-15
status: OPEN - NO FIXES APPLIED
---

# Trading and Recovery

Current path: request → accept → offer up to four cats → both ready → five-second review → both confirm → journal → apply profiles → request saves. See [[Systems/Trading]] for intended behavior. Its historical statement that the journal covers crashes is too broad given the faults reproduced below.

## QA-001 - A failed commit can still recover only one side

**P0 · OFFLINE REPRODUCED.** `src/server/Modules/TradeJournal.luau:59` writes `trade_<id>`, then `user_A`, then `user_B` within one `pcall`. Separate writes do not roll back when a later one fails. `TradeService.luau:313` interprets false as no trade and unlocks the cats.

**Reproduction:** inject a failure on the third write. `commit` returns false, but A's listing and the trade record exist. On recovery A gives its outgoing cat and receives B's cat; B has no listing and keeps its original cat. The probe shows the same UUID in both profiles.

**Possible fix:** design an explicit durable transaction protocol with a pending/committed state, participant indexes and recovery of partially indexed records. Recovery must only apply a committed transaction, and a transaction must never become permanently undiscoverable by either participant. A pcall, retries alone, or moving these same three writes into a different order cannot establish this invariant. Resolve uncertain write outcomes by reading transaction identity/state rather than announcing that nothing happened.

**Acceptance:** fail before and after each individual durable write, include an ambiguous timeout after a write succeeded, then recover both users in either order. Each UUID has exactly one owner and both clients receive the same final outcome. Test this with an injectable store first and disposable live records later.

## QA-002 - Recovery fails open

**P0 · OFFLINE REPRODUCED + SOURCE CONFIRMED LOAD PATH.** `TradeJournal.luau:120` returns the unchanged profile and zero applied trades when a user-list read fails. Individual trade-record read failures are also silently skipped. `PlayerDataService.luau:278` has no recovery-success result to check and continues loading the session.

**Trigger:** a valid save opens while the trade journal is unavailable, even though that player owes a committed trade. They can operate on their old inventory while their partner has already received the trade. A later recovery can encounter cats that have since been merged or traded.

**Possible fix:** return explicit success/error/pending status for recovery; retry with bounds and backoff; keep unresolved profiles unavailable for economy/inventory activity. Distinguish a successful read of no transactions from a failed read. Preserve the acquired profile lease correctly while waiting or refusing the join.

**Acceptance:** inject errors reading the user index and each referenced record. No unresolved inventory is exposed. After recovery succeeds, each transaction applies once; unrelated valid progress remains intact.

## QA-003 - Old trades can apply again after twenty newer trades

**P0 · OFFLINE REPRODUCED THROUGH `settle`.** `TradeJournal.luau:75` uses `tradeHistory` as the only applied-transaction marker; line 113 trims it to 20. Pending user listings remain until a later load observes a saved receipt. A session with more than 20 trades can therefore evict a receipt before its listing is removed.

**Reproduction:** commit/apply a trade, consume its received cat in a later merge, and complete 20 unrelated incoming gifts. Recover from the resulting profile with its original journal listings still present. The old trade is applied again and restores the consumed UUID. This was reproduced with the real journal module, not just a mathematical example.

**Possible fix:** separate durable idempotency state from the short display history. Use a per-player acknowledged transaction sequence/checkpoint or another bounded scheme that only retires markers once durable acknowledgement makes replay impossible. A larger display-history cap only postpones the defect. Coordinate garbage collection of records, indexes and acknowledgements.

**Acceptance:** 21, 50 and hundreds of trades without rejoining; received cats subsequently merged or transferred; crashes before/after acknowledgement cleanup; repeat recovery. No resurrected cats, duplicate application or indefinitely growing unacknowledged state.

## QA-004 - Recovery does not validate outgoing ownership

**P1 · OFFLINE REPRODUCED PRIMITIVE; CROSS-SERVER TIMING PENDING.** `TradeJournal.luau:84` removes outgoing UUIDs only if present, then grants incoming cats regardless. Calling apply on a profile lacking its outgoing cat still awards the other side.

**Impact:** this is unsafe when combined with QA-002, expired locks, or the already documented disconnect/rejoin window. A player can keep the result of consuming/transferring an outgoing cat and also receive the incoming trade. Missing outgoing inventory cannot simply be treated as proof that a transaction already happened.

**Possible fix:** make recovery transaction-aware: reserve/debit outgoing assets durably, retain trustworthy per-player apply markers and fence sessions while a transaction is unresolved. Quarantine conflicting ownership for repair rather than silently completing just the credit. Do not merely reject after one partner has already received assets; that would create an asymmetric loss.

**Acceptance:** disconnect/rejoin on another server while the journal yields, merge/trade attempts during recovery, outgoing UUID missing, already-applied transaction, and partially saved pair. Assert conservation of assets across both profiles, including any merge descendants.

## QA-010 - Leaving during commit gives a false cancellation message

**P1 · SOURCE CONFIRMED; TIMING TEST PENDING.** `TradeService.luau:426` unconditionally closes a departing player's trade with “cancelled” and “Nothing changed hands.” It does not respect `trade.executing`. The yielding `execute` path at lines 312–339 can still commit, apply to the remaining player and recover the departing player's side later.

**Possible fix:** once committing, disconnect must transition to a pending/recovery outcome, not ordinary cancellation. Keep transaction state until its durable decision is known. The remaining player should see a consistent status and be able to recover it by transaction ID.

**Acceptance:** disconnect before the first write, between every write and after commit but before profile save. Cancellation is only displayed if the system can prove cancellation; a committed trade is eventually shown as completed to both sides.

## QA-011 - A slow commit can outlive its inventory locks

**P1 · RISK / NEEDS REPRO.** `TradeService.luau:297` acquires 60-second reservations. `BattleReservations.luau:6` drops expired locks on access. No renewal accompanies the yielding journal write; `trade.executing` is checked by trade handlers but not by merge/training/battle handlers.

**Potential trigger:** throttle journal writes for longer than 60 seconds, then attempt to merge or upgrade an offered cat. After the lock expires another system can use that UUID while the journal still contains the earlier snapshot.

**Possible fix:** an inventory transaction lock whose lifetime follows transaction resolution, with safe renewal, session fencing and a bounded failure/recovery policy. A longer arbitrary timeout alone is insufficient. Revalidate invariants against durable transaction state before applying.

**Acceptance:** slow writes longer than the reservation, repeated delays, player departure, lease expiry and concurrent inventory operations. No offered cat becomes mutable while ownership is unresolved.

## Additional trading suggestions

- Include training steps, Keep/following/work status and owner-grant provenance in the review, so two otherwise identical level/species cards are distinguishable.
- Provide a clearly marked one-way gift confirmation; the current summary already warns about receiving no cats, so retain it.
- Preserve the five-second review and agreement reset on offer changes.
- Use a shared request queue or inbox so a second request does not replace the only visible request popup.
- Treat `SaveNow` as an early save request, not proof that two profiles are durably saved. The current method can skip while busy and returns no durable acknowledgement.
- Current server “at spawn” means `currentWorld == CozyMeadow`, not proximity to the plaza. The nearby prompt is client-created. This broad scope is documented in the existing design; decide whether to retain it before adding a distance gate.

Run [[Bugs and Possible Fixes/07 - Evidence and Handoff]]'s probe command to reproduce QA-001 through QA-004. These are synthetic-store results, not experiments on player saves.
