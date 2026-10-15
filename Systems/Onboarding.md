---
type: system
status: TESTED
last_updated: 2026-10-12
---

# First-session sanctuary guide

User direction: "the assests are still not my favorite so just continue building the game we can change them later."

Art iteration is deferred. This milestone improves the existing Cat Empire runtime; it is not the full Cat Trainer starter/wild-battle/catch tutorial. Forge setup and the larger Cat Trainer conversion remain separate pending work.

## Delivered

Four persisted milestones: receive starter kitten, own two cats, assign a valid worker, dispatch an expedition. Milestones can be completed out of order and remain completed after cats are merged or reassigned. The first completion grants 100 Fish Coins once. Skip is permanent and gives no bonus; the Guide button still opens general help. Existing saves that already received a starter skip new onboarding during migration.

Source: src/shared/TutorialProgress.luau owns step copy/reward and pure advancement rules. PlayerDataService.UpdateData advances within each successful structural transaction before committing money and completion together. TutorialService exposes only SkipTutorial; clients cannot submit milestone claims or amounts. TutorialController observes full profile changes and reuses UITheme; it has no per-frame loop. Types schema 2 adds tutorial.completed, skipped and rewardGranted. Prestige retains tutorial progress.

## Plan and acceptance

Guide the currently available collect/work/expedition loop without redesigning assets. Use server-confirmed state and existing remotes. Persist progress, prevent repeated bonuses, handle skipped/legacy profiles, and keep buttons at touch size. Test the actual flow in Studio plus save/rejoin and adversarial cases in offline service mocks.

## Evidence — 2026-10-12

- 51 Luau files pass syntax compilation. Existing UI fixture passes its seven-modal/six-viewport checks; that fixture does not cover the new guide.
- 99 offline core assertions pass (18 new onboarding assertions): new/legacy profiles, invalid milestones, partial reconciliation, starter/collection/valid worker, aborted transactions, expedition completion, exact 100 bonus, repeated updates, save/rejoin, skip and repeat skip, no skipped bonus.
- Studio fresh Play starts 11 services and 16 controllers without script errors. Studio memory store explicitly active; live player saves were not used.
- Real starter-pad touch and adoption interaction advance first two milestones. Real AssignStationWorker and StartExpedition client remotes complete the remaining milestones; synchronized tutorial.rewardGranted is true. Measured wallet change was 105 during the last step because production continued; exact 100 reward is established by isolated service tests, not that noisy wallet measurement.
- Completed tutorial rejects SkipTutorial. In a separate fresh Play, desktop mouse click on Skip sets skipped=true, keeps coins at 100, and closes the guide. Desktop click on Guide reopens general help.
- Desktop review found Guide covering Sacred Rebirth; moved Guide below Settings. Corrected position is in source and Studio.
- Phone simulator: iPhone 17 Pro portrait, viewport 401×778, ScreenOrientation.Sensor, CoreUISafeInsets. Guide 377×320; Continue 183.35×48, Skip 145.65×48, toggle 116×48. Text visible and buttons at full size. Phone mouse automation returned success without activating the action; touch interaction remains unverified. Desktop action worked after restoring the viewport.
- Rojo was stopped; restarted hidden on port 34872. Studio did not automatically reconnect. Backed up two existing Studio sources in .tools/gameplay-backup and synced five matching project modules through the official Studio MCP. Reconnect the Rojo plugin for future automatic sync; running Rojo is not proof of a plugin connection.
- Play stopped and device simulator reset to default. No publishing or live-save writes.

## Actual gameplay previews

![[Assets/Previews/ONBOARDING/guide-phone-2026-10-12.jpg|360]]

2026-10-12, initial guide, actual Studio Play phone simulator screenshot. Source TutorialController/UITheme. Layout checked; physical-device/touch input not verified.

![[Assets/Previews/ONBOARDING/guide-desktop-2026-10-12.jpg|720]]

2026-10-12, skipped help state, actual Studio Play desktop screenshot after clicking Guide. MCP click indicator is part of the capture. Existing world background/art quality is not certified by this test.

## Test it

1. Play with the default isolated Studio memory profile; first guide opens.
2. Close it, touch the free starter pad, adopt for 50 coins, use Assign Priest at an owned station's podium to assign a cat, then dispatch Sunny Meadow in Expeditions.
3. Reopen Guide: completion message, four saved milestones and one 100-coin bonus. Normal production continues separately.
4. For Skip, begin a fresh Play session and click Skip guide. No reward; Guide reopens help.
5. Run tools/validate_project.py for service/mock persistence regressions. Studio's memory store resets between Play sessions, so stopping Play is not a real persistence/rejoin test.

Remaining: multiplayer/live DataStore failure and reconnect acceptance, real mobile input, guided world navigation, remaining Cat Trainer systems. Assets are deliberately deferred by the user.


## 2026-10-12 — Permanent Guide review
TutorialController now retains individual instructions for skipped and completed users. Permanent Guide button, Previous/Next page controls with disabled endpoints and close button. Browsing is client presentation only: does not change milestones, skipped flag or reward marker. Desktop Skip→Guide→Next verified; portrait preview saved in [[Assets/UI Navigation Revision]]. Existing completion/skip server semantics remain unchanged.

## 2026-10-13 — expedition step removed

The guide now has three milestones (starter kitten, two cats, a valid worker); the bonus is granted when the worker step completes. The "dispatch an expedition" step was dropped because Expeditions are being removed (ADR-015). The side-menu button is now "Rewards" and the window title "Starter Rewards". Older notes above describing four milestones are historical. Offline: aborted worker transaction grants nothing; committed one grants exactly 100 once (148 core assertions pass). Not re-run in Studio end to end.


## 2026-10-13 — Rewards button after the guide
Once the guide has ended (finished or skipped) the Rewards side button opens [[Systems/Login Rewards]] instead of the guide; the Login Rewards window has a GUIDE button for reading the instructions again.
