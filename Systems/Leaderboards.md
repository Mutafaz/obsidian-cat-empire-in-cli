# This-server monument leaderboards — 2026-10-13

Implemented the three categories requested in [[Ideas/Chat Ideas]], preserving the existing monument geometry. Trophies ranks current battle trophies; Collection ranks historical unique species discovered; Coins ranks cumulative gameplay earnings, unaffected by spending. Ties share competition ranks (1, 1, 3), with UserId ordering for stable rows.

`LeaderboardService` creates the existing board and serves `GetServerLeaderboard`. The response includes only currently connected players with ready profiles: userId, display name, username and the three public scores. The remote is read-only and throttled to one request per second per caller. It does not query an OrderedDataStore or players in other servers.

`LeaderboardController` owns an interactive PlayerGui SurfaceGui adorning the board. Each viewer selects their own tab. It refreshes every five seconds, preserves the selected tab, scrolls all server entries, highlights the local player, and rebinds if Streaming removes/reloads the monument. `LeaderboardUtil` handles deterministic sorting and ties.

## Saved tracking

- Schema 3 adds `coinsEarned` and `discoveredCats`. See [[Technical/Data Schema]].
- Normal AddCurrency FishCoins awards and positive net balance changes in successful UpdateData transactions add earnings. Initial balance, spending and rebirth reset do not. Failed transactions award nothing.
- Non-admin owned species are recorded on structural transactions. History survives removal, merging and rebirth. GiveCat/admin grants mark each cat with `leaderboardExcluded` so a later unrelated update cannot count it. A later normal acquisition of that species does count.
- Owner-panel coin/cat grants explicitly exclude leaderboard progress. Future refunds, purchases with real money or transfers must also be excluded if implemented; do not call the ordinary earnings path for them.
- Older profiles start earned Coins at zero because prior income was not tracked. Existing owned species seed Collection; removed historical species and pre-update admin provenance cannot be reconstructed.

## Verification and testing

2026-10-13: full validation passed: 64 Luau files syntax-compiled, 461 offline core assertions, existing responsive UI fixture passed. Counts include concurrent unrelated login-reward work. The 20 new leaderboard assertions exercise real services for migration, duplicate discovery, removal, earnings, spending, admin exclusions, rejected transactions, current-server filtering, unloaded profiles, throttling and tied ranks. Compilation is not a full strict typecheck.

Solo Studio Play: existing monument rendered; clicked Collection, Coins and Trophies using actual mouse input, verified matching selected states/descriptions/scores, and Coins selection persisted through a five-second refresh. [[Assets/Leaderboard Tabs]] has actual captures. Mock profiles only; no production DataStore write was tested. Studio returned to Edit and temporary preview camera/HUD changes were removed with the play session.

To test: Play, approach the west-plaza monument at (-52,10,0), click each tab; earn coins, spend coins, acquire duplicate/new species and wait up to five seconds. Owner grants should leave Collection/Coins unchanged. Use a two-player Studio test to check independent selection and departure cleanup. Real multi-client interaction, phone touch, long-list scrolling and live persistence remain unverified; simulated connected/absent-player filtering is covered offline.

## 2026-10-15 — Boss Wins, Team Power, This Week and your own row (Early Morning Session)
Built from idea 002 C in [[Chat Ideas]]; see [[Early Morning Session]].
- **Two new tabs:**
  - **Boss Wins:** scheduled spawn boss fights won with a prize. Owner test fights do not count.
  - **Team Power:** the strongest three cats owned now, at health + 4 × attack each, including their upgrade-map steps. Owner-granted cats do not count.

  The five tabs share the board's width.
- **ALL TIME / THIS WEEK button** on the Coins and Boss Wins boards.
  - Weeks start **Monday 00:00 UTC**, and the caption shows the time left.
  - Weekly counts live in the saved `weekly = { week, coins, bossWins }`, which starts again when a new week begins.
  - Coins count through both the normal transactions and the fast income path. Owner grants never count.
- **YOU: #rank • score** row under the list, so your own place is visible however long the board is.
- **Still this server only.** Global boards (an OrderedDataStore) are not built.
- **Verified:**
  - offline: Team Power with a fourth cat and a granted cat left out, the week boundary, weekly totals and reset, ranking by the weekly field;
  - Studio: the five tabs on the board, and the YOU row and captions read back. The weekly view was not seen on screen.

![[Assets/Previews/LEADERBOARD/2026-10-15-r2-five-tabs-and-arena-sign.png|480]]

## 2026-10-15 — GLOBAL boards (Early Morning Session)
- **Scope button:** the monument has a **THIS SERVER / GLOBAL TOP 50** button.
- **What GLOBAL shows:** the top 50 across all servers for the selected tab. With the THIS WEEK view, Coins and Boss Wins use this week's board.
- **How it works:** `GlobalLeaderboardService` writes each player's scores to one OrderedDataStore per board (`Global_Trophies`, `Global_TeamPower`, `Global_Coins_W<week>`, …).
  - It writes only when a score changes: 30 seconds after the server starts, then every 2 minutes, and when a player leaves.
  - It reads each board's top 50 into a cache every 2 minutes. `GetGlobalLeaderboard(category, weekly)` serves the cache, so viewers never cause DataStore calls.
  - Ranks are competition ranks; names come from the server or Roblox's name lookup, cached.
- **The same provenance rules as the server board:** owner-granted cats, coins and test boss wins never count. (This tripped up the first Studio test: a granted cat correctly did not appear.)
- **Studio** uses an in-memory store, so the "global" board in Studio is this session only.
- **Verified:**
  - offline: changed scores written once, unchanged not rewritten, the top read back with shared ranks, unknown boards refused, the remote;
  - Studio: a cat bought from the Shop appeared on GLOBAL Team Power ("YOU: #1 • 1060").
- **Not verified:** a live server with real OrderedDataStores; DataStore budgets with many players; the weekly global boards across a Monday.
