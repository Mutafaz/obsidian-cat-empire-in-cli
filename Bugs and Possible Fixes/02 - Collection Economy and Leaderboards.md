---
type: bug-audit
created: 2026-10-15
status: OPEN - NO FIXES APPLIED
---

# Collection Economy and Leaderboards

Reviewed adoption, carriers, starter grants, merges/Keep, station production, prestige, login rewards, Catpedia, exploration rewards, and server/global ranking paths. Existing server-side balance checks and combined debit/item mutations are good foundations; a passing transaction test does not prove durable saving or UI behavior.

## QA-005 - Merging loses owner-grant provenance

**P1 · OFFLINE REPRODUCED THROUGH CATSERVICE.** `CatService.luau:148` upgrades the target and deletes the consumed cat without combining `leaderboardExcluded` flags. `PlayerDataService.luau:89` excludes only cats carrying that flag from Team Power.

**Reproduction:** obtain a normal level-1 Tuxedo and an owner-granted, excluded level-1 Tuxedo. Merge using the normal cat as target. The level-2 result has no exclusion flag and contributes its enhanced power to the board. Reversing the target changes provenance, so the result is order-dependent.

**Possible fix:** define merge provenance explicitly. A conservative rule is exclusion if either input is excluded, including in later merges and trades. Apply it in the authoritative merge transaction. Decide separately how owner-derived income and event rewards should count; a single cat flag does not establish complete economy provenance.

**Acceptance:** all four combinations of regular/excluded inputs, both argument orders, multi-step merges and a subsequent trade. Team Power and discoveries match the chosen policy.

## QA-006 - Hidden expeditions still pay rewards

**P1 · OFFLINE REPRODUCED THROUGH SERVER HANDLERS.** `ExpeditionController.luau:288` disables only the UI. `ExpeditionService.luau:162` still binds status/start/claim. The bootstrap loads that service automatically. A client can invoke the hidden feature and receive coins, yarn and cat rolls. Existing notes say expeditions were being removed.

**Reproduction:** invoke StartExpedition for meadow with an eligible profile, allow its server timer to expire and invoke ClaimExpedition. The audit mock advances the stored finish time instead of waiting; both handlers succeed. This is a hidden reachable feature, not a currency-argument exploit.

**Possible fix:** make the feature's enabled policy authoritative on the server. Reject new dispatches when retired; decide a migration/claim policy for existing missions without deleting saved progress. Keep read access only if useful, with a budget. Do not delete profile fields or outstanding rewards blindly.

**Acceptance:** disabled mode rejects new starts through direct remote calls; any intended legacy claims still settle once; enabled mode retains its existing checks. Confirm user intent before removing the service permanently.

## QA-007 - Final global scores can be missed on leaving

**P1 · RISK / NEEDS LIFECYCLE TEST.** `GlobalLeaderboardService.luau:167` ignores the departing player and schedules `Publish()` for later. Publish enumerates `Players:GetPlayers()` and calls `GetStatsSnapshot`. `PlayerDataService.luau:220` marks departing sessions closing, after which the snapshot readiness check fails. The player can also be gone from enumeration when the spawned callback runs.

**Impact:** progress since the previous two-minute publish may remain absent until another session publishes it; brief sessions may never publish a final score. This does not by itself delete the saved profile.

**Possible fix:** capture an explicit final score snapshot before readiness is revoked and enqueue that immutable snapshot. A dedicated unloading snapshot contract is safer than re-enumerating online players. Define shutdown ordering and retry behavior.

**Acceptance:** join and leave before the first 30-second pass, leave after earning points, disconnect while publishing, and server shutdown. Test varying listener/task order with a recording store, then disposable live boards.

## QA-008 - Zero Team Power leaves an old global score

**P2 · OFFLINE REPRODUCED THROUGH GLOBALLEADERBOARDSERVICE.** At `GlobalLeaderboardService.luau:110`, a zero is only written if the current server's `_written` cache previously saw that player. That cache does not know what an earlier server published.

**Reproduction:** seed a stored global Team Power of 999; load a fresh local publishing service where the player has no cats and Team Power is zero; Publish leaves the old 999 untouched. Team Power is defined as current owned power, so this is a stale rank, not an all-time record.

**Possible fix:** publish authoritative zero for non-monotonic current-state boards, or explicitly remove the prior entry. Avoid treating a fresh in-memory cache as knowledge of an empty persistent board. Keep weekly board initialization and all-time monotonic categories separate.

**Acceptance:** trade away all eligible cats, reconnect to a different server and publish. The old score clears. Also test zero after owner-excluding a roster and unchanged positive scores without unnecessary writes.

## QA-009 - Global tab results are not tied to the selected tab

**P2 · SOURCE CONFIRMED; LATENCY TEST PENDING.** `LeaderboardController.luau:13` keeps one `globalRows` array. Changing category at line 105 renders immediately with the prior rows, then starts a fetch. `fetchGlobal` at line 15 also accepts any completed response into that same array without checking its request category/period.

**Trigger:** switch global Trophies → Coins → This Week under delay. Old or out-of-order responses can be rendered under the newest label; a refused fetch retains the wrong rows.

**Possible fix:** key cache entries by category and period; capture those values and a request generation before yielding. Only render the response into the matching current selection. Show loading, last updated time and refresh failure explicitly.

**Acceptance:** delayed/out-of-order responses, rapid tab switching and rate-limited reads. No row is shown under a mismatched category or week.

## QA-017 - Pet income label does not match the production system

**P2 · SOURCE CONFIRMED.** `InventoryController.luau:104` calls `CatUtil.calculateYield`; line 186 presents it as `+... Coins/s`. `ProductionUtil.luau:10` actually pays station base yields multiplied by the assigned worker's multiplier and global modifiers. Merely owning or following an extra cat does not add its displayed per-cat yield. The two formulas also use different inputs.

**Player impact:** the prominent Pet Details number and “Equip Best” suggest that following a high-yield cat raises passive income. The follower operation only changes `equippedCatUuid`.

**Possible fix:** show “Worker multiplier” or “Potential station bonus” with assignment context; show actual total Coins/s from the same authoritative production calculation. Rename the action to “Follow best” and explain its selection metric. Implement a new per-cat income system only if the user explicitly wants that mechanic.

**Acceptance:** compare displayed total with actual credited income before/after owning, following, assigning, unassigning, merging, travelling, prestige and parade. Explain floor/rounding differences. Never claim an unassigned cat produces a standalone amount unless the server pays it.

## Balance decisions and suggestions, not confirmed bugs

- Prestige currently uses the **spendable Golden Yarn balance** for the advertised permanent multiplier (`EconomyDefinitions.getPrestigeMultiplier`). Unlocking a world spends yarn and lowers that multiplier. Decide whether “permanent” should mean lifetime yarn earned or remaining yarn; show the tradeoff before spending if retained.
- The sqrt prestige curve favors repeated minimum rebirths in yarn-per-coin terms: 500 coins → 1 yarn; 2,000 → 2; 4,500 → 3. Include the 100-coin reset balance, rebuild cost and elapsed playtime in any balance study before retuning.
- Shop rarity odds already come from the roll table, and purchases combine payment and cat grant. Preserve that. Improve presentation with per-species chance when targeting a pinned species, clearly separated from rarity chance.
- Login Rewards currently use elapsed 24-hour cooldowns and placeholder rewards. Test a real wait/rejoin and make this schedule explicit; do not call it a midnight reset.
- Catpedia counts currently owned owner-granted species for its rewards/bonus, while the Collection leaderboard excludes owner grants. This difference is already documented; decide whether it is intended rather than labeling it automatically as a new exploit.
- Collection discoveries persist, while the passive collection bonus requires current ownership. Keep those two meanings explicit in the UI.
- Show merge preview, surviving UUID/Keep status, training carried forward and consumed cat before confirmation. Training currently keeps the maximum step per track, not the sum of investment.

Related: [[Systems/Economy]], [[Systems/Production]], [[Systems/Cat Collection]], [[Systems/Cat Merging]], [[Systems/Leaderboards]], [[Systems/Shop]], [[Systems/Login Rewards]], [[Systems/Catpedia]].
