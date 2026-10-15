# Realms, turn battles, guide and movement — verification

## Delivered
- Existing three arena divisions now wait for player actions instead of immediately simulating a complete fight. Existing CombatUtil stats/auto-simulator remain for compatibility and historical tests; the arena remote uses TurnBattle.
- Four moves per existing species: Tackle, elemental attack, Guard, Rest. PP, accuracy, speed order, 1.25× STAB, 1.5× effectiveness/0.67× resistance; healthy party switching consumes a turn, fainted cats cannot act, automatic healthy replacement, Struggle fallback, 80-turn draw limit, 15-minute session expiry, explicit forfeit confirmation.
- Server snapshots, session ID and revision validation; no client damage or rewards. Battle team snapshots best three owned cats at start. Closing/reopening resumes active session. No battle survives disconnect. Pending reward commit can retry on reopen; completed actions cannot award again.
- Grove Keepers and Frostpeak Watch require unlocking and visiting their realms. Verdant Grove free, Frostpeak 3 Yarn/1.25× visiting income; existing realm IDs/costs preserved. Native static environment and return/rival proximity interactions.
- Realm debit/unlock now one transaction. Travel verifies alive character and unlocked realm, commits currentWorld, clears momentum, then teleports. Fade cleanup survives callback errors. World menu now reflows and exposes errors.
- UITheme readable gradients, rounded controls and exclusive shared modals. Guide review available permanently. Nine radial road/wall blockers repaired.

## Automated evidence
Final: 55 Luau source files syntax-compile with zero failures; 135 offline core assertions pass; six-viewport UI fixture checks navigation, modal fit/reflow, rotation, cleanup, one-open-modal behavior and idempotent gradient styling. Rojo `build default.project.json --output CatEmpire-preview.rbxlx` passes. These are not Luau type analysis or proof of live DataStore behavior.

Core tests include invalid/NaN move, empty PP, hit/miss, guard, heal clamp, faint ordering, switch punishment, reciprocal types, input immutability, Struggle, draw, replay and terminal rejection, reward once, no reward on forfeit, free/paid/duplicate/failed realm unlock, locked travel rejection and clearing travel momentum.

## Live Studio evidence
Official MCP connected; sources backed up in ServerStorage `BeforeNavigationFix_20261012` and `BeforeTurnBattles_20261012`, plus local `.tools/before-turn-battles` copies. Changed scripts synced explicitly; Rojo plugin connectivity not assumed.

- Fresh Play initializes 11 services / 16 controllers. Final console run has no runtime errors. All tests use the Studio memory profile; no live saves or publishing.
- Before map repair: 9/12 radial road rays hit plot walls. After: 12/12 clear. Temporary server ownership walk X238 → X271 passed through entrance, no jumping, then restored automatic ownership. Client-owned MoveTo/Move automation did not produce reliable movement and is not counted as a pass.
- Click Guide Next changes to page 2. Opening Arena closes Guide. Desktop Skip → Guide → Next reopens page 2 with skipped=true/rewardGranted=false.
- Real starter-pad touch grants starter. Forest unlock/travel succeed. One actual move-button click consumed elemental PP 12→11 and produced 49 resisted enemy damage / 76 super-effective player damage. Battle awaited another choice.
- Solo Grove defeat gave zero reward. Further action rejected. Separate temporary Studio fixture level 50 won Alley: balance 100→250, rewardGranted=true, expected150 coins; terminal replay rejected. Test fixtures self-destroy and disappear on stopping Play. One combined diagnostic read hit GetPlayerData throttle and returned nil; a subsequent read confirmed the values. No product error inferred from that diagnostic.
- Frostpeak unlock deducted 3 Yarn and travel succeeded. Both native realm models and return/rival prompts present. Actual interaction with return/rival prompts still needs a player walkthrough; underlying travel/start remotes tested.
- iPhone17Pro portrait: 401×778 viewport, Guide377×440 and navigation164.5×48; battle377×650, move164.5×56, switch106.3×56, forfeit337×48. Sensor orientation and CoreUISafeInsets. Landscape initial layout hid moves below portraits; fixed to compact two-column layout and recaptured with all four moves visible. Small landscape still scrolls for lower log/forfeit. Mobile touch and multiplayer unverified.
- Studio stopped; simulation disabled, orientation landscape/default viewport restored.

## How to test
1. Play; close Guide, touch FREE starter pad. Guide → Next/Previous; Skip → Guide should retain page access. Open another menu and confirm the earlier one closes.
2. Walk along each avenue into plots; first plot entrance is near (249,0,0). Walls remain outside the road opening.
3. Realms → unlock Verdant Grove (free) → travel. Follow path to rival and challenge. Choose move, inspect HP/PP/log; reopen Arena to resume. Switch after collecting a second cat; forfeit gives no rewards.
4. Obtain 3 Golden Yarn through existing progression, unlock Frostpeak, visit its rival, and use Return prompt. Do not seed production saves; fixture levels in screenshots are test-only.
5. Win Alley with a stronger team; note exactly one reward. Repeat stale/ended request through a test harness; no second reward. Test portrait and landscape, scroll to lower controls.

## Limits
Playable realm prototypes with basic art, not final environments. Existing ten Cat Empire species preserved; this does not implement the original twelve-cat Cat Trainer roster. No wild catching, PvP challenge flow, bag/potions, manual team selection, evolution or battle animation/VFX pass added here. Full master game/Forge verification remain pending. Art redesign remains deferred. Graphify graph is partial Luau analysis; see [[Technical/Graphify]].

An automatic approval check initially failed due to usage limit (not a safety rejection). After the user's continue instruction, regular Studio tool calls succeeded and the blocked collision test was completed. No approval bypass used.
