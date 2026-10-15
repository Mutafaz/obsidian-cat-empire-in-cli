# Leaderboard tabs — 2026-10-13

Original request: "Can you add this its describe in chat ideas **Leaderboard categories**: Trophies, Collection and Coins tabs on the existing monument, this-server only"

Expanded brief: preserve existing monument geometry. Use a client-owned interactive SurfaceGui on its display, with dark slate rows, purple selected tab, large Trophies/Collection/Coins buttons, explicit This Server scope, score criteria and tied competition ranks (1,1,3). Tab choice is per viewer. Server supplies only loaded connected players' public ranking stats. No global/weekly boards or rewards. Collection means historical unique species discovered; Coins means gameplay earnings before spending, as specified in Chat Ideas. Add persistent tracking without inventing missing historical earnings; seed existing owned species for legacy profiles, start earned coins at zero. Future admin cat/currency grants do not increment these totals.

Acceptance: independent tab selection, correct descending category order and tied ranks, departures excluded, duplicate cats/spending do not reduce history, rejected transactions/admin grants do not inflate scores, legacy data retained. Match current UITheme; no new 3D asset. Preview pending until live Studio capture. Source and final verification recorded below.

## Revision 1 — actual Studio previews, 2026-10-13

Verified project context: existing SanctuaryLeaderboard/DisplayBoard geometry, current UITheme purple/slate palette and Fredoka face, Chat Ideas definitions. Source: `src/client/Controllers/LeaderboardController.luau`, `src/shared/LeaderboardUtil.luau`, `src/server/Services/LeaderboardService.luau` and profile tracking. No external art or geometry added.

Desktop Studio viewport, 1096 × 635, front view; HUD temporarily hidden and camera placed in front of the monument for clear captures. These are actual in-game renders with temporary Studio profile scores, not mockups. Coins capture includes gameplay login earnings from the shared Studio test session; Collection capture is a fresh solo session with no cats. Each tab was clicked and its resulting state inspected. Phone touch and independent simultaneous players remain unverified.

![[Assets/Previews/LEADERBOARD/coins-2026-10-13.jpg]]
![[Assets/Previews/LEADERBOARD/collection-2026-10-13.jpg]]

The rendered selection, score criteria and this-server scope are readable at the close view. Previous preview-pending status above is superseded by these captures. Full behavior and test steps: [[Systems/Leaderboards]].
