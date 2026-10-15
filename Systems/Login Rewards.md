---
type: system
id: SYS-LOGIN-REWARDS
title: System Specification — Login Rewards
created: 2026-10-13
last_updated: 2026-10-13
status: IMPLEMENTED (first version, placeholder reward values)
dependencies:
  - "[[Systems/Onboarding]]"
  - "[[Systems/Player Data]]"
  - "[[Systems/Owner Panel]]"
tags:
  - system
  - rewards
---

# Login Rewards

Built on 2026-10-13 from the "Rewards" part of [[Chat Ideas]] (Starter Rewards first, then Login Rewards with a countdown).

## Original request
> can you add this Login Rewards: new saved fields, a small server service, the seven-card window with countdown, Studio captures rendering is there add owner skip guide button will be removed later btw make sure u are updating obsidian

Reference image supplied by the user: `Assets/Reference Examples/Chat Ideas/2026-10-13/daily-rewards-user-reference.png` (a "Daily Rewards" mockup: six day cards in a grid, a tall day 7, a green CLAIM button).

## Expanded brief
- Same window shell as MY PETS and REBIRTH. Six day cards in a 3x2 grid, day 7 tall on the right with CLAIM under it, a bar along the bottom with the countdown.
- Opened from the existing Rewards side button. While the starter guide is unfinished the button opens the guide; once it has ended (finished or skipped) it opens Login Rewards, which keeps a GUIDE button.
- States shown with text and marks, not colour alone: claimed (dimmed, tick, "Claimed"), next (white border, gentle pulse when ready), later days (normal). A red "!" sits on the Rewards icon while a reward is waiting.
- Icons are the real ones already uploaded (coin, yarn, cat face); the mockup's gift boxes and chests were not supplied as art. No progress bars on cards.
- Acceptance: offline tests for every payout rule; a full week claimed in Studio; captures saved here.

## Rules (`src/shared/LoginRewards.luau`)
- One claim every 24 hours, counted from the previous claim on the server's clock. The first is available as soon as the guide has ended.
- Missing a day never resets progress. After day 7 the next claim starts a new week at day 1.
- **The seven rewards are placeholders awaiting a decision from the user:** 100 Coins, 150 Coins, a random cat, 250 Coins, 400 Coins, 1 Golden Yarn, a Rare-or-better cat. Cats come from the normal adoption odds (limited to Rare and above on day 7).

## How it works
- Saved field `loginRewards = { claimed, lastClaim }`: total claims and the server time of the last one. Older saves get `{0, 0}` on load; corrupt values are refused, not reset. The profile format number was not changed by this feature (another change the same evening raised it to 3 for leaderboard fields).
- `LoginRewardService` owns the RemoteFunction `ClaimLoginReward` (no arguments). It checks the guide has ended and the wait is over, then pays the reward and records the claim in one profile transaction. One request per second per player.
- `LoginRewardController` draws the window from the replicated profile and the synchronised server clock (`workspace:GetServerTimeNow()`); it never decides a claim.
- `CatUtil.rollCatIdAtLeast` and `CatUtil.rarityRank` were added for the rarity floor.

## Temporary owner tool
One button on the Owner Panel's Rewards tab, marked for removal later:
- **MAKE NEXT LOGIN REWARD READY** (`ReadyLoginReward`): clears the 24-hour wait for the selected player, so later days can be tested.

An owner **SKIP STARTER GUIDE** button (`SkipGuide`) was added at the user's request and removed again the same evening, also at the user's request. The guide's own "Skip guide" button, which every player has, is unchanged and is now the way to end the guide early.

## Verification
**Offline (`tools/core_fixture.luau`):** locked until the guide ends; day 1 exact; second claim inside the wait refused; one minute early refused; countdown values; a rejoin keeps the wait; two requests for one day pay once; days 3 to 7 exact by kind, cats at or above the promised rarity; the week wraps and a second week restarts at day 1; 200 Rare-or-better rolls never fall below Rare; a claim time ahead of the clock cannot lock rewards longer than one wait; older profiles gain the field; negative, fractional, NaN, infinite and text counts refused; both owner tools refused for non-owners and correct for owners. `tools/validate_project.py`: 64 files compile, 461 core assertions pass (the count includes the other agent's leaderboard tests).

**Studio Play, solo, 2026-10-13:** Rewards opened the guide while it was unfinished; SKIP STARTER GUIDE pressed in the Owner Panel; the "!" badge appeared; day 1 claimed (100 -> 200 coins), button turned to COME BACK LATER, bar counted down from 23:59:54; an early press was refused; LOGIN REWARD READY pressed once through the button and then called through the same remote for the later days; days 2 to 7 each claimed through the CLAIM button: 150, a Common Orange Tabby, 250, 400, 1 Golden Yarn, a Rare Persian Royal; after day 7 the grid cleared for a new week. Server log shows seven claims. No script errors from this feature.

**Security checkpoint** (items from [[Owner Admin Revamp and Security Review]] that apply; the others concern systems that do not exist):
```text
Review date: 2026-10-13
Source revision / exact changed files: uncommitted on top of b540a2b: LoginRewards.luau, LoginRewardService.luau, LoginRewardController.luau, Types.luau, CatUtil.luau, AdminService.luau, AdminController.luau, TutorialController.luau
Reviewer: Claude (builder; not an independent review)
Changed actions and permissions: new player remote ClaimLoginReward; two owner-only actions
Accounts / roles used: one Studio tester (owner by the Studio rule)
Environment: offline mock and Studio solo
Checks performed: SEC-02 (owner actions refused for non-owners, offline), SEC-03 (no client inputs on the claim; corrupt saved values refused), SEC-05 (duplicate claim pays once, offline), SEC-06 (payout and marker in one transaction; rejoin keeps the wait, offline)
Passed: the above, with the evidence listed in this note
Failed: none found
Not run / not applicable and why: SEC-04 aggregate request budget (only per-action spacing exists); SEC-12 (login rewards count toward the new Coins Earned board, which may or may not be wanted); SEC-13 (no second account); save failure and server shutdown during a claim; a live server
Required fixes: none known
Release readiness for this change only: not claimed; live-server and two-account checks are outstanding
```

**After the skip-guide removal (Studio, solo):** the guide's own Skip button ended the guide, Rewards then opened Login Rewards and day 1 paid 100 coins; the Owner Panel shows one testing button; the old `SkipGuide` request from an owner is answered "Unknown action." and logged as refused. Offline: 458 assertions pass.

Open items are collected in [[Testing/Not Yet Tested]].

**Not verified:** phone layouts (a narrow two-column arrangement exists in code, never captured); a real 24-hour wait; behaviour across a real save and rejoin in a live server.

## Previews
![[Assets/Previews/LOGIN-REWARDS/r1-day1-ready-studio.png|640]]
![[Assets/Previews/LOGIN-REWARDS/r1-countdown-studio.png|640]]
![[Assets/Previews/LOGIN-REWARDS/r1-day7-ready-studio.png|640]]
![[Assets/Previews/LOGIN-REWARDS/r1-new-week-studio.png|480]]
![[Assets/Previews/LOGIN-REWARDS/r1-hud-badge-studio.png|480]]
![[Assets/Previews/LOGIN-REWARDS/r1-owner-testing-tools-studio.png|480]]
Revision 1, actual Studio Play captures, 2026-10-13, 1096x635 viewport, with the 3D world rendering. In order: day 1 ready; countdown after the claim; day 7 ready with six claimed; the new week; the HUD with the "!" badge; the Owner Panel's testing buttons as first built (two buttons).

![[Assets/Previews/LOGIN-REWARDS/r2-owner-testing-tool-studio.png|480]]
Revision 2, same evening: the Owner Panel after the skip-guide button was removed (one testing button left).

## Implementation location
- Rules: `src/shared/LoginRewards.luau`
- Server: `src/server/Services/LoginRewardService.luau`
- Client: `src/client/Controllers/LoginRewardController.luau`; button routing in `TutorialController.luau`
- Owner tools: `AdminService.luau` (`SkipGuide`, `ReadyLoginReward`), `AdminController.luau`
