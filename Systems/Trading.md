---
type: system
id: SYS-TRADING
title: System Specification — Trading at spawn
created: 2026-10-15
last_updated: 2026-10-15
status: IMPLEMENTED — offline-tested; never run between two real players
dependencies:
  - "[[Systems/Cat Collection]]"
  - "[[Systems/Player Data]]"
tags:
  - system
  - trading
  - multiplayer
---

# Trading at spawn

## Source
Idea 002 A in [[Chat Ideas]] ("Trading at spawn"), built during the [[Early Morning Session]]. The proposal was followed closely; differences are listed below.

## How it works for players
1. **Request:** at the spawn oasis, walk up to another trainer and hold **T** on the "Request Trade" prompt over them. The prompt shows their display name and @username. It only exists while you are at spawn.
2. **Their choice:** they get a popup ("Mock Trader (@MockTrader) wants to trade cats with you!") with **ACCEPT** or **DECLINE**. It expires after 30 seconds.
3. **The trade window:**
   - **YOUR OFFER** and **THEIR OFFER**, up to **4 cats each**. Each card shows the portrait, name, level and power, and each side shows its total power.
   - **YOUR CATS** below: tap a cat to add it, or tap an offered cat to take it back.
   - Cats that cannot be traded are greyed out and say why when tapped: *Turn off Keep first*, *Stop it following you first*, *Take it off its workstation first*, or *That cat is in a battle*.
4. **READY:** both press READY. Any change to either offer clears both READY marks.
5. **Review:** once both are ready, a plain summary appears: "You give: … / You receive: …". If you receive nothing, it says so in red: **You receive no cats**. **CONFIRM TRADE** stays locked for **5 seconds** ("CONFIRM IN 3").
6. **Confirm:** both press CONFIRM TRADE. The exchange happens at once on the server, then **TRADE COMPLETE!** lists what you received.
7. **Cancelling:** CANCEL TRADE or the window's X cancels for both.
8. **When a trade ends by itself (nothing changes hands):**
   - either player leaves spawn or the server;
   - an offered cat becomes unavailable mid-trade. This instead sends both back to READY.

**Settings → Trade requests: ON / FRIENDS ONLY / OFF.** This is saved in the profile. FRIENDS ONLY uses Roblox's friends check.

## Server rules
- **Authority:** `TradeService` owns every step through the `TradeRequest` RemoteFunction:

  | Action | Payload |
  |---|---|
  | Status | none |
  | SetMode | `{mode}` |
  | Request | `{targetUserId}` |
  | Respond | `{id, accept}` |
  | Offer | `{uuids}` |
  | Ready | `{ready}` |
  | Confirm | none |
  | Cancel | `{id?}` |

  Updates go out on the `TradeUpdate` RemoteEvent: request, requestClosed, trade, closed, complete.
- **Spacing:** one Request every 3 seconds per player; other actions are spaced too.
- **Who can trade:**
  - both players must be in this server, loaded, at spawn, not already trading and not in a battle;
  - the receiver's setting must allow the request;
  - one request per pair at a time.
- **Two-profile transaction:** the exchange is `PlayerDataService:UpdatePair(a, b, mutator)`.
  - Both profiles are copied and changed together; both must pass the same checks before either is stored. If either fails, neither changes.
  - Every offered cat is checked again inside the transaction.
  - Each cat keeps its id, level and owner-grant marking. Keep and workstation marks are cleared, and it is removed from the giver's Explore team.
- **Receipts:** each profile keeps its last 20 trades in `tradeHistory` (id, partner id and name, species given and received, time).
- **Saving:** after a trade, both profiles ask for an immediate save (`PlayerDataService:SaveNow`) instead of waiting up to 120 seconds for the autosave. The trade journal (below) covers a crash before those saves.

## Differences from the proposal
- **Ready → review → confirm:** follows the proposal, with a 5-second review.
- **Favourite-locked cats:** the proposal's "favorite-locked" cats are the existing **Keep** marker.
- **IVY and Melman & Julian** do not exist yet, so the extra named-cat warning is not built.
- **No proximity limit beyond "at spawn":** the prompt itself needs you within 12 studs. A trade started that way can carry on while both walk around spawn.
- **Power** uses the same number as everywhere else (health + 4 × attack). As the proposal says, it is information, not a value judgement.

## Crash safety — trade journal (added later the same morning)
**The original risk:** the two profiles are saved by separate DataStore calls. A crash between them could duplicate or lose cats. This is now handled by `src/server/Modules/TradeJournal.luau`:
1. **Lock:** after both confirmations, the offered cats are locked (the battle-reservation lock, so they cannot be merged, upgraded or used in a fight).
2. **Commit:** the whole trade (both sides' cats) is written to the DataStore `CatEmpire_Trades_v1` and listed under both players. **That write is the commit point.** If it fails, nothing changes hands and the cats are unlocked.
3. **Apply:** both loaded profiles then apply the trade in one transaction and keep its receipt.
4. **Recovery:** every profile load checks that player's listings. A committed trade the saved profile is missing (the server stopped before saving) is applied then. A listing whose receipt is already saved is removed.
5. **No double-apply:** applying is keyed on the receipt, so a trade is never applied twice.

**What is left (small, stated plainly):**
- A player who leaves during the journal write and loads into another server within that same second could play briefly with their pre-trade cats. The trade applies on their following load, but if they merged a given cat in between, its partner keeps a copy.
- Each trade costs three DataStore writes, and each join costs one read (more if the player has listings).
- Not tested against a real DataStore or a real crash: offline mocks only.

## Verification
- **Offline (`tools/core_fixture.luau`, 51 assertions):**
  - requests: self, absent player, away from spawn, setting Off or Friends-only (stranger refused, friend allowed), duplicates, decline, expiry, someone mid-battle, someone already trading;
  - offers: duplicates, cats you do not own, more than four, kept or following cats, a valid offer, the view of both sides;
  - agreement: Ready with two empty offers, Confirm before both ready, Confirm during the review, an offer change clearing Ready;
  - a missing cat stopping the swap with nothing moved;
  - a full swap: levels kept, coins unchanged, the giver's team cleaned, discoveries, receipts on both sides, both told;
  - a one-way gift; leaving spawn; leaving the server;
  - `UpdatePair`: one player, an error, no `true`, one bad profile; the save format;
  - **trade journal (9):** written for both players; crash recovery applying one side on the next load (cat moved, Keep/following/team cleared, receipt added, still a valid save); no double-apply, and the listing dropped; an already-applied side untouched; a failed journal write moving nothing and unlocking the cats; a trade succeeding once the journal works again.
- **Studio Play, solo, 2026-10-15:**
  - a self-request was refused;
  - the Settings row cycled ON → FRIENDS ONLY → OFF → ON and saved;
  - **render checks only:** the request popup, the window (offers, summary, the CONFIRM countdown from 3 to unlocked) and the receipt were drawn from **mock data sent by the server to the one client**. No second player existed, so **no real trade has ever been run.**
- **Not verified:**
  - any real two-player trade;
  - the Request Trade prompt over another character;
  - the Friends-only check against real friends;
  - phones;
  - a live-server save.

## Previews

![[Assets/Previews/TRADING/2026-10-15-r1-settings-trade-requests.png|480]]

Real Studio capture: the Settings row.

![[Assets/Previews/TRADING/2026-10-15-r1-request-popup-MOCK.png|480]]
![[Assets/Previews/TRADING/2026-10-15-r1-window-offers-MOCK.png|480]]
![[Assets/Previews/TRADING/2026-10-15-r1-window-review-MOCK.png|480]]
![[Assets/Previews/TRADING/2026-10-15-r1-complete-MOCK.png|480]]

**MOCK:** real renders of the window, but filled with made-up trade data ("Mock Trader"), because only one player was available. The card level/power text was made easier to read after these captures, and that change has not been re-captured.

## Files
- `src/shared/TradeDefinitions.luau`
- `src/server/Services/TradeService.luau`
- `src/client/Controllers/TradeController.luau`
- `PlayerDataService` (`UpdatePair`, `SaveNow`)
- `Types` (`tradeRequests`, `tradeHistory`)
- `SettingsController` (the row)
