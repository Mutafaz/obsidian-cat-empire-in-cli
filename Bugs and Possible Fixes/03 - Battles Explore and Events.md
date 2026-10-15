---
type: bug-audit
created: 2026-10-15
status: OPEN - NO FIXES APPLIED
---

# Battles Explore and Events

The current game has several distinct paths: the eight-node Starter Trail, world rival teams, one-cat practice, friendly PvP, Explore parties, and a real-time spawn boss. The earlier eight-fight chapter is still present; Battle now opens PvP, and Explore opens PvE. No combat-style redesign was performed in this audit.

## QA-012 - Boss combat bypasses the shared encounter lock

**P2 · SOURCE CONFIRMED; POLICY NEEDS DECISION.** `BossEventService.luau:458` and `:473` do not check or acquire `BattleReservations`. Its `teamAttack` at line 78 reads current inventory/team/training every attack. PvP, arena, practice and Fight Map do reserve teams; TrainingService and CatService rely on these reservations.

**Trigger:** join the boss while already in a PvP/practice/Trail fight, or change a boss team's cats/upgrades mid-event. The server permits overlapping participation and recalculates boss damage from the changed profile. This conflicts with the reservation module's stated one-encounter policy, although the intended boss exception has not been decided.

**Possible fix:** decide whether the boss is an exception. For exclusive combat, snapshot and reserve the selected team when joining and release on results, departure, expiry and failed starts. For an intentional exception, specify permitted overlaps and mid-fight upgrades explicitly; do not let each service infer a different rule.

**Acceptance:** join during every other encounter, start each encounter during a boss fight, change presets, merge, trade and train selected cats. Rejoin, knockout and timeout must release/recover state according to the chosen policy.

## QA-013 - Failed boss payout has no recovery path

**P1 · SOURCE CONFIRMED; INJECTED FAILURE TEST PENDING.** `BossEventService.luau:323` changes the event to results before paying everyone. `UpdateData` at line 354 can return false for reasons other than an existing slot receipt: not-ready/closing profile, lost lease or an aborted transaction. Line 375 labels every refusal “This fight's prize was already given to you.” No retry queue or pending claim is created.

**Impact:** an eligible trainer can lose an award and receive a misleading duplicate-payment explanation. This is distinct from a successful in-memory award not yet reaching autosave; UpdateData itself is not a durable save acknowledgement.

**Possible fix:** return a meaningful payout reason; retain an idempotent pending award when the transaction cannot commit; retry within a defined lifecycle or allow claim after recovery. Preserve the slot receipt and reward in one transaction. Distinguish already-paid from temporarily-unavailable.

**Acceptance:** temporarily refuse one eligible player's transaction while another succeeds; recover and retry; disconnect at payout; repeat claim/status. The first player gets one correct award, the second gets no duplicate, and messages match the actual result. Use disposable profiles for live failure testing.

## Encounter checks that still need Studio

| Feature | Source review outcome | Required acceptance |
|---|---|---|
| Starter Trail | Eight ordered nodes, fixed tuning, first-clear/replay payouts and server team validation exist; 80 offline assertions pass | Scroll all eight nodes, verify locks, select 1–3 cats, finish a battle, replay, progress to Captain Bramble and return |
| World rivals | Realm eligibility and recovery cooldown checked at start; selected/fallback team snapshots used | Fight each rival through its own world, compare recommendation to actual team, test forfeit/retry and expired session |
| Turn engine | Server decides damage, PP, turn/revision and results; shared deterministic tests exist | Long fights, all PP exhausted, simultaneous fainting/recoil, switches, guard/heal and all elemental pairings |
| Practice | One owned cat, no payout, shared reservation | Launch from Pets, finish/forfeit, return to the same cat and verify no currency/trophy change |
| PvP | Consent, rebuilt owned teams, revisions, timed default actions and no friendly farming payout exist | Two real clients: challenge/decline/accept, simultaneous invitations, both perspectives, 30-second turn timeout, switch, forfeit/disconnect, rematch |
| Parties | Up to four; leader world choice and member readiness; eligible members travel individually | Locked world member, dead/loading character, leader departure, ready reset, GO ANYWAY and partial travel messages |
| Caches | Realm and per-world cooldown checked server-side; world prompt checks proximity | All five caches, blocked duplicate open, travel away during a request, rejoin and actual refill |
| Explore rewards | Milestone markers and awards mutate together | Multiple due awards, repeated clicks and save/rejoin; badges clear only after server confirmation |
| Spawn boss | Server sets damage, rate, arena checks and slot record; event membership is transient | Several trainers, late entry, health scaling, three marked attacks, openings, knockouts, eligibility/ranks, timeout and server hopping within a slot |
| Cat Parade | Server multiplier and countdown broadcasts exist | Late join before/after client initialization, owner start/end, countdown and actual income return to baseline |

## Risks and gameplay suggestions

- **Party failures need specific explanations.** Teleport's skipped-member summary says “Not unlocked yet” even when a dead/missing character or transaction refusal caused failure (`PartyService`, Teleport handler). Report each member's reason and who actually travelled; do not imply a shared atomic teleport.
- **Parties are not shared combat.** Members currently travel together and start their own encounters. Label that clearly until shared turn order, party scaling and personal loot are implemented. These are planned features, not broken existing features.
- **Saved teams can become partial.** Arena and boss selectors accept surviving UUIDs from the saved team and only fall back when none survive. After a merge/trade, show missing slots and let the player repair the team; do not silently promise “strongest three.” Consider canonicalizing saved teams and presets on inventory mutations.
- **Travel during an encounter needs a rule.** WorldService can move a player without checking combat reservations; rival eligibility is checked when starting. Decide whether existing battles should remain resumable from another world, end on travel, or block travel. Test prestige/respawn with active sessions as well.
- **Show the next useful action after results.** Keep the existing replay/next/back controls; include yarn in rival victory summaries, which currently format coins and trophies only (`CombatController.luau:127`). Distinguish cooldown from server failure.
- **Put strategy ahead of decoration.** Display selected team, elemental advantage, enemy recommendation, actual HP/PP and boost effect before the fight. The older boost-picker preview leaves most of its large window empty; a compact choice panel could show the selected cat team and enemy beside the choices.
- **Boss tell clarity:** use shape, label and countdown as well as red floor color. Show knockout time, re-entry action, contribution eligibility and prize conditions before the finish. Test ground markers on phone camera angles.
- **Disconnect reward policy is undecided.** Boss departure intentionally removes eligibility; do not describe this as a confirmed bug. Decide whether reconnect grace is desired and then test persistent participation safely.

Related: [[Systems/Combat]], [[Systems/Explore and Battle]], [[Systems/Boss Event]], [[Ideas/Cooperative Battle Worlds]], [[Assets/Fight Map Chapter One]].
