---
type: test-report
status: TESTED
last_updated: 2026-10-12
---

# Studio Runtime Checks — 2026-10-12

This checkpoint supersedes earlier statements that Studio was inaccessible. It is a local solo-play check, not a release certification.

## Scope and acceptance

After the user enabled the official Studio MCP server, discovery returned actual tools and one connected instance named CatEmpire. The place was in Edit mode with PlaceId 0. Plan: confirm source sync, run isolated local Play, fix observed startup faults and UI overlaps, verify affected behavior, and restore Edit/default viewport. Acceptance: no startup console errors; ceremony renders after starter claim; adoption validates proximity/cooldown/cost; inventory is above the HUD; portrait navigation clears jump input.

## Results and changes

- Compared all 43 game Luau sources against Studio before edits: no differences. Rojo synchronization is confirmed for that snapshot, beyond merely observing a listening server.
- First Play exposed a GachaController OnInit error: CatAdoptedCeremony was created only when a cat was granted. TycoonService now creates it in OnInit. Subsequent fresh sessions initialized 10 services and 15 controllers without startup errors.
- Studio confirmed the isolated memory backend. No live datastore was used, no place was published, and no assets were uploaded.
- Fresh profile has 100 coins and no cats until the free starter pad is claimed. Activating its actual ProximityPrompt grants one Orange Tabby, records starterGranted and the station, destroys the pad, and starts income. The ceremony rendered its species portrait and HUD updated to one cat. This was a single fresh claim, not an engine reconnect test.
- Adoption through the real remote rejected a distant player. After settling near the adoption pad, a request granted one Shadow Prowler, charged 50 coins, and rejected an immediate second request. Snapshot balances were 217 before and 168 after, including one income tick; inventory increased from one to two. Approaching the pad can also trigger its touch handler, so arrival and remote cooldown must be tested separately.
- Device simulator: iPhone 17 Pro, LandscapeLeft viewport 750×381 and Portrait 401×778; StarterGui.ScreenOrientation is Sensor. HUD/navigation render in both. Initial inventory screenshots showed the HUD and parade banner covering its title. UITheme.bindModal now raises an open dialog's ScreenGui to DisplayOrder 20, its panel to ZIndex ≥10, and restores the prior order on close. Adoption remains at order 100. Retest screenshots show the inventory title and close control unobscured in both orientations.
- Portrait navigation overlapped Roblox's jump control. Compact portrait navigation now reserves 120 pixels at the bottom. Actual Realms bounds after the fix: x204.5–364.5, y556–600; JumpButton x306–376, y630–700, leaving 30 pixels vertically. Inventory was explicitly made visible through execute_luau for the final visual checks; these screenshots do not verify every navigation click handler.
- Updated the UI mock fixture with Roblox's default layer/visibility values and checks for modal layer raise/restore. All 43 source syntax compilations, six viewport/seven-modal layout cases, and 81 core assertions pass.
- Stopped our playtest and successfully called StopSimulationAsync. Studio is restored to Edit/default viewport with landscape simulator orientation.

## Audio audit

The configured temple music failed to load because its ID is not audio. Marketplace metadata checks found additional incorrect IDs. These entries retain their keys but now have nil asset IDs with the old IDs preserved in comments, pending legitimate replacements.

| Key | Previous ID | Observed asset type / evidence |
|---|---|---|
| BGM_AncientTemple | 9043886567 | Studio asset-type mismatch |
| SFX_CatMeow | 9068095495 | Script (5) |
| SFX_MergeAscend | 9069608779 | Script (5); also failed during ceremony |
| SFX_PrestigeRebirth | 9069609653 | Script (5) |
| SFX_PortalWhoosh | 9069609503 | Image (1) |
| SFX_CombatHit | 9069609070 | Script (5) |
| BGM_CyberCity | 9043887413 | SolidModel (39) |
| BGM_CloudKingdom | 9043887720 | Script (5) |

BGM_CozyMeadow (9043887091) and SFX_CoinPickup (9069609200) identify as audio (3); metadata alone does not establish playback permission or artistic suitability. The missing local sounds/uiclick.mp3 was replaced with the installed sounds/volume_slider.ogg; actual ContentProvider preload returned AssetFetchStatus.Success. Main Egyptian music and the other unavailable effects remain silent until replacement assets are approved/validated.

## Evidence and remaining work

Local original captures are in ignored `.tools/studio-captures/`: starter ceremony `1791812336733322900.jpg`; pre-fix phone inventory `1791812502809277000.jpg` and `1791812503658972500.jpg`; final inventory portrait `1791812646803788800.jpg` and landscape `1791812657785927000.jpg`. These are local evidence, not portable committed assets.

Do not infer service readiness from require() inside the MCP execution environment: an exploratory server require returned an empty module state despite the running service and working remote. Client GetPlayerData remote responses, replicated instances, actual prompts, console logs, and captures supplied the runtime evidence above.

Still pending: Roblox type/Script Analysis; all seven dialogs with real populated content; ceremony on mobile; close-button touch sizes/readability (whole-panel scaling shrinks these); multiplayer/rejoin/rebirth; live disposable-store outage/ownership/shutdown tests; large inventories; measured scene/CPU/GPU performance; remaining request budgets; correct soundtrack/effects. Nothing in this report establishes that the entire game is verified or optimized on physical devices.

Related: [[Technical/Roblox Studio MCP]], [[Technical/Continuation Guide]], [[Technical/Optimization Pass 2026-10-12]], [[Systems/UI]], [[Systems/Audio & VFX]].
