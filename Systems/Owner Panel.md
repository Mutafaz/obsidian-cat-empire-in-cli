---
type: system
id: SYS-OWNER-PANEL
title: System Specification — Owner Panel
created: 2026-10-13
last_updated: 2026-10-13
status: IMPLEMENTED (first version)
dependencies:
  - "[[Systems/Player Data]]"
  - "[[Systems/Cat Collection]]"
  - "[[Technical/Security]]"
tags:
  - system
  - admin
  - security
---

# Owner Panel

First implementation of section J of [[Chat Ideas]] (idea 001), requested by the user on 2026-10-13: "can you implement idea J from Chat Idea".

## Who is an owner
Decided on the server in `AdminService:IsOwner`, from `src/server/Modules/AdminConfig.luau`:
- any UserId listed in `OWNER_USER_IDS` (empty today);
- the account that owns the place (`TRUST_PLACE_CREATOR`; only for user-owned places);
- anyone play-testing in Roblox Studio (`TRUST_STUDIO_TESTERS`; they already have edit access).

The idea note left "the exact admin account" open; the place owner is the default taken here. For a group-owned place, add the UserId to `OWNER_USER_IDS`.

## How it works
- One RemoteFunction, `AdminRequest(action, payload)`, and one RemoteEvent, `AdminAnnouncement`.
- Every request: owner check by UserId, known action, 0.4 s spacing per action, payload validation, then the action. Non-owners get "Not available." and nothing else.
- Every privileged request, allowed or refused, goes to an activity log (last 100 in server memory, last 30 shown in the panel) and to the server output. Refused attempts by non-owners are logged at most once per five seconds.
- The client (`AdminController`) asks for `Status` once at start; only an owner gets the OWNER button and window. That is presentation only.

| Action | Rule |
|---|---|
| GrantCurrency | player in this server; Fish Coins 1 to 1,000,000 or Golden Yarn 1 to 100 per grant; whole numbers only |
| GrantCat | player in this server; a species from `CatDefinitions`; level 1 to 50 |
| StartParade / EndParade | this server; 10 to 600 seconds; refuses to start over a running parade |
| Announce | this server; 1 to 120 characters; sent only after Roblox's text filter returns a result |
| Kick | another player who is not an owner; one of four fixed reasons |
| Ban | as Kick, 1 to 168 hours, all servers of the game, alternate accounts not included (`Players:BanAsync`) |
| Unban | by numeric UserId (`Players:UnbanAsync`) |

Announce, Kick, Ban and Unban need a second press in the panel after a review line naming the target and values.

`ParadeService` gained an optional duration on `TriggerParade` and a new `EndParade`; the scheduled parades behave as before.

## Not built (from the idea's table)
Carriers, IVY and the pair, sanctuary previews, login-reward cycle, training preview, dummy battle, time fast-forward: those systems do not exist yet. Also not built: roles other than Owner, the "all servers" scope for grants and announcements, editing an existing cat's level, resetting the starter guide, reversal of grants, and a log that survives the server closing.

## Verification
- Offline (`tools/core_fixture.luau`, 52 assertions): unlisted account refused for every action; owner rule and Studio rule; exact grants; bad amounts (0, negative, fraction, NaN, infinity, text, over the limit) refused with balances unchanged; unknown currency, absent player, malformed payload; cat species and level bounds; parade bounds, double start, end; unfiltered announcement never sent; no kicking or banning oneself or another owner; ban length bounds and the exact ban request; failed ban reported as failed; duplicate submission paid once; newest action first in the log.
- Studio Play, solo, 2026-10-13: OWNER button present; granted a level 5 Orange Tabby; granted 600 coins (HUD 100 -> 700); 99,999,999 refused; parade start refused while the opening parade ran, then ended it; announcement needed two presses and appeared as a banner; Kick with only oneself selected was stopped; six log lines in the right order; no script errors.
- Not verified: anything with a second player (granting to others, kick, ban, unban), a non-owner client in a live server, announcements on other players' screens, the real text filter (Studio does not filter), phones.

![[Assets/Previews/OWNER-PANEL/r1-cats-studio.png|640]]
![[Assets/Previews/OWNER-PANEL/r1-events-announcement-studio.png|640]]
![[Assets/Previews/OWNER-PANEL/r1-rewards-studio.png|480]]
![[Assets/Previews/OWNER-PANEL/r1-moderation-studio.png|480]]
Actual Studio Play captures, 2026-10-13. The last two have a black 3D view (capture limitation noted in [[Assets/UI Overhaul 2026-10-13]] revision 9).


## 2026-10-13 — temporary testing actions
Two owner-only actions were added on the Rewards tab for testing [[Systems/Login Rewards]]: `SkipGuide` and `ReadyLoginReward`, both for a player in this server and both logged like every other action. They are marked in the code for removal later, as the user asked.


## 2026-10-13 (later) — skip-guide action removed
`SkipGuide` was removed at the user's request; an owner sending it now gets "Unknown action." `ReadyLoginReward` remains as the one temporary testing action. Untested items for the panel are listed in [[Testing/Not Yet Tested]].


## 2026-10-14 — small revamp (late night session)
Taken from the owner revamp idea in [[Owner Admin Revamp and Security Review]]; see [[Late Night Session]].
- **Environment badge:** the header shows **TEST SERVER** in Studio and **LIVE SERVER** elsewhere, so it is clear where a grant lands.
- **Cat search:** the Cats tab has a search box (name or rarity). The catalogue is now 15 species.
- **Two-press grants:** GrantCat and GrantCurrency first show **REVIEW GRANT**. The second press confirms, so a mis-tap does not hand out cats or currency.
- **Verified offline:** the server rules are unchanged, and the existing owner tests pass.
- **Not verified on screen:** the panel opened in Studio on 2026-10-15, but a NEW CAT reveal covered it in the capture. Listed in [[Testing/Not Yet Tested]].

## 2026-10-15 — saved audit log, overall request budget, boss test (Early Morning Session)
These cover two items from the Security Review checklist in [[Owner Admin Revamp and Security Review]] (SEC-11 and SEC-04), plus a new testing button.
- **Saved log (SEC-11):**
  - every logged panel action (allowed or refused) is also written to the DataStore `CatEmpire_AdminLog_v1` every 30 seconds and when the server closes;
  - the store keeps the last 200 entries, with the actor's UserId, action, target, detail, result, time and server id;
  - the Activity Log shows them under **EARLIER SERVERS (saved log)**;
  - Studio uses memory, so in Studio the saved log is only as old as the session;
  - offline: an action reaches the saved log.
- **Overall request budget (SEC-04):**
  - `RequestGuard` now also allows at most **60 guarded requests per 10 seconds per player**, across every action name, so a client alternating names cannot get past per-action spacing;
  - offline: alternating names stop at the budget, and the budget refills.
- **START BOSS FIGHT (TEST, 60 S WARNING)** on the Events tab: see [[Systems/Boss Event]].
- **Not verified:** the saved log on a live server; whether 60/10 s is too strict for any real client (no Studio session hit it).

### 2026-10-15 — Cats tab fix (regression sweep)
The late-night species brought the catalogue to 15. The Cats tab's species grid then spilled under the Level row and hid the last cats. It now **scrolls** inside its space. Seen in Studio before and after:

![[Assets/Previews/OWNER-PANEL/2026-10-15-r3-cats-grid-overflow-BUG.png|480]]
![[Assets/Previews/OWNER-PANEL/2026-10-15-r4-cats-grid-scrolls.png|480]]

This also resolves the late-night "Cats tab with fifteen species" item in [[Testing/Not Yet Tested]]: the panel and the TEST SERVER badge were seen.
