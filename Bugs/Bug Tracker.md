---
type: tracker
id: TRACKER-BUGS
title: Cat Empire — Bug & Issue Tracker
last_updated: 2026-10-12
status: ACTIVE
tags:
  - bugs
  - issues
---

# Bug & Issue Tracker

| Bug ID | Severity | System | Description | Status | Discovered Date | Resolution |
|---|---|---|---|---|---|---|
| `BUG-001` | Medium | `HUDController` | UIScale variables declared after `buildHUD()` caused spring-punch animations to silently abort. | RESOLVED | 2026-10-11 | Moved `_coinsScale` and `_yarnScale` to module header scope. |
| `BUG-002` | Low | `AudioController` | `SFX_CoinPickup` triggered when spending currency. | RESOLVED | 2026-10-11 | Gated `CurrencyChanged` listener to only fire sound when `delta > 0`. |
| `BUG-003` | Medium | `WorldService` | Cozy Meadow teleport return spawn at `(0, 5, 0)` spawned player inside Sphinx lotus pool. | RESOLVED | 2026-10-11 | Aligned return destination to `(0, 5, 50)` on the Sun Disc spawn platform. |
| `BUG-004` | High | `MapService` / `TycoonService` | Floor flashing and Z-fighting on overlapping procedural ground planes. | RESOLVED | 2026-10-11 | Enforced strict vertical Y elevation layering across base dunes, plaza, avenues, and plots. |
| `BUG-005` | High | `TycoonService` | Radial plot crowding with only 27-stud gaps at $R=145$ for 12 players. | RESOLVED | 2026-10-11 | Expanded island to 1,000 studs and plots to $R=280$, providing 86-stud open buffers. |


## Open issues from 2026-10-12 source audit

| Bug ID | Severity | System | Finding | Status | Evidence / next step |
|---|---|---|---|---|---|
| BUG-006 | Critical / P0 | PlayerDataService | Failed GetAsync creates default session later saved with SetAsync; no session locking | OPEN | Inspect loadData/saveData; fail closed and test injected read/save failures |
| BUG-007 | High / P1 | TycoonService / bootstrap | Plot can start before data load; station restoration grants another starter cat | OPEN | Gate restoration on PlayerLoaded; separate grants from rendering |
| BUG-008 | High / P1 | CombatService / CatService | Reward-bearing remote invocations lack server throttling/reservation; adoption lacks proximity validation | OPEN | Add validated transaction/cooldown contracts and adversarial request tests |
| BUG-009 | High / P1 | CatUtil / CatService | Assigned or equipped consumed merge cats can leave dangling references | OPEN | Define merge rules and repair references atomically |
| BUG-010 | High / P1 | ExpeditionService | Active state is memory-only; claims cleared before confirmed rewards; finished unclaimed mission can be replaced | OPEN | Persist state and test reconnect/duplicate claim/start cases |
| BUG-011 | Medium / P2 | TycoonService | Restored roaming labels read missing catInstance.rarity | OPEN | Resolve rarity through CatDefinitions; returning profile test |
| BUG-012 | Medium / P2 | FXController / docs | Low-detail flag does not silence existing scene emitters | OPEN | Apply reversible scene-effect toggles and profile on mobile |
| BUG-013 | Medium / P2 | InventoryController | Empty labels are not cleared on refresh; identical cat emoji hide species appearance | OPEN | Named empty state and bounded portrait strategy; verify large inventory performance |

See [[Technical/Project Audit 2026-10-12]]. These are source findings, not live-data experiments. The visual pass did not modify persistence or reward logic.


## 2026-10-12 remediation evidence

| Issue | Current disposition | Remaining acceptance |
|---|---|---|
| BUG-006 | IMPLEMENTED / OFFLINE TESTED: fail-closed loads, Studio isolation, leases/retries/metadata and stale-owner rejection | Real API outage/ownership/shutdown tests; old SetAsync servers must be drained before rollout |
| BUG-007 | IMPLEMENTED / OFFLINE TESTED starter/rejoin marker; source now gates plots on ready data | Actual plot chain/rejoin/rebirth visual tests |
| BUG-008 | PARTIALLY MITIGATED / OFFLINE TESTED: selected request cooldowns, adoption distance, atomic rewards | Remaining world/status aggregate budgets and adversarial engine tests |
| BUG-009 | IMPLEMENTED / OFFLINE TESTED: assigned merge rejection and equipped UUID transfer | Multiplayer follower/worker visuals |
| BUG-010 | IMPLEMENTED / OFFLINE TESTED: profile missions, reconnect, atomic claim, no overwrite/replay | Real API/save/disconnect tests; team reservations remain future work |
| BUG-011 | IMPLEMENTED source fix: rarity resolved from definition | Returning roaming label rendering |
| BUG-012 | IMPLEMENTED / OFFLINE TESTED effect suppression/restoration | Real device visuals/performance |
| BUG-013 | PARTIALLY FIXED: empty labels removed; unchanged inventories no longer rebuild on income | Inventory portrait/virtualization strategy and large-inventory device test |
| BUG-014 | IMPLEMENTED / OFFLINE TESTED: missing LocalPlayer binding in PetFollowController fixed | Studio follower rendering |

See [[Technical/Optimization Pass 2026-10-12]]. Offline tests do not close release/runtime gates.


## Studio findings — 2026-10-12

- BUG-015: ceremony remote created too late, crashing GachaController OnInit. FIXED / SOLO TESTED: remote created during server OnInit, fresh startup and starter ceremony pass.
- BUG-016: HUD/parade obscure modal titles. FIXED / VISUALLY TESTED for inventory in phone landscape/portrait; remaining dialogs need populated acceptance.
- BUG-017: portrait Realms navigation overlaps JumpButton. FIXED / ENGINE BOUNDS CHECKED: 30-pixel vertical clearance on iPhone 17 Pro.
- BUG-018: eight configured sound IDs point to non-audio, and local click file is missing. INVALID REFERENCES DISABLED; UI click replacement preload passes; soundtrack/SFX replacements OPEN.

Evidence and limits: [[Testing/Studio Runtime Checks 2026-10-12]].


## 2026-10-12 — Confirmed fixes and remaining checks
- FIXED: nine radial roads terminated at collidable plot walls. Source repair,12/12 clear rays,first entrance Humanoid walk checked.
- FIXED: skipped guide lost individual instructions; permanent paged review verified.
- FIXED: dark panel gradient multiplication and overlapping shared modals.
- FIXED: separate realm charge/unlock transactions; failure regression proves no charge on failed commit.
- FIXED: travel callback error could leave black fade; cleanup now protected.
- FIXED: new battle layout hid moves on phone landscape; compact two-column revision rendered with all4 moves visible.
- PENDING: mobile touch,multiplayer,realm prompt walkthrough,all other map areas. No claim that all game glitches were fixed.


## 2026-10-13 — Source review fixes (offline tested; Studio NOT RUN)

| Bug ID | System | Finding | Status |
|---|---|---|---|
| BUG-019 | ExpeditionController | Open modal re-fetched and rebuilt every card each second: flicker, swallowed clicks, possible duplicate cards | FIXED in source: local countdown, fetch-before-clear, single in-flight request |
| BUG-020 | WorldController / StationUIController | Cards rebuilt on every per-second income tick (`DataUpdated`), destroying buttons mid-click | FIXED in source: structural `ProfileUpdated` (+ Golden Yarn changes for realms) |
| BUG-021 | GachaController | Overlapping adoption ceremonies leaked a `BlurEffect`, leaving the screen blurred | FIXED in source: ceremonies queue; stale blur destroyed |
| BUG-022 | TycoonService | Standing on the adoption pad bought a cat every second | FIXED in source: touch adopts once per step-on; prompt unchanged |
| BUG-023 | TycoonService | Petting a walking cat snapped it to its waypoint | FIXED in source |
| BUG-024 | PlayerDataService / WorldService / PrestigeService | `currentWorld` survived rejoin, respawn and rebirth, keeping a realm income bonus (and realm-rival access) while standing in the oasis | FIXED, OFFLINE TESTED for rejoin and rebirth; respawn path untested |
| BUG-025 | ProfileStore | A failed final save left a local lease that refused the same player's rejoin on that server | FIXED, OFFLINE TESTED |
| BUG-026 | CombatService | Refused challenges (wrong realm, no cats) still started the 10 s team cooldown; team picked by level only | FIXED, OFFLINE TESTED: cooldown starts only with a real battle; team sorted by HP + ATK×4 |
| BUG-027 | CatService / ParadeService | Late joiners saw no follower pets and no running parade banner | FIXED in source; needs two-player Studio check |
| BUG-028 | CombatController | Refused realm challenge left an empty battle panel | FIXED in source: rival list plus reason; victory text shows Golden Yarn |

Open design note, not changed: prestige pays 1 Golden Yarn at 500 coins and `sqrt` above that, so repeated minimum rebirths are the most efficient path. Needs a user decision before retuning.


## 2026-10-13 — Map survey and fixes (Studio solo Play)

Request: "Go through the game and fix all map issues". Surveyed with a scripted camera in live Play (overhead, plaza, plots, island edge, all five realms), then re-captured after the fixes.

| Bug ID | Finding | Fix | Status |
|---|---|---|---|
| BUG-029 | Default Studio Baseplate was made transparent, but its grid Texture still drew and flickered against the sand at Y = 0 | `MapService` hides the baseplate's textures | FIXED, seen in Studio |
| BUG-030 | Sand layer and island base shared Y = 0 and striped | Sand top raised to Y = 0.06 | FIXED, seen in Studio |
| BUG-031 | Template SpawnLocation at the origin (inside the monument) competed with the plaza spawn | Disabled and hidden at startup | FIXED, confirmed `enabled=false` |
| BUG-032 | Non-uniform Ball parts render as a sphere of their smallest side: palm fronds were invisible (108 bare trunks), sphinx parts and seals were dots | New `RoundShape` helper (sphere mesh on a block) used by the palm, station, cat and scene-art builders | FIXED, palms and sphinx seen in Studio |
| BUG-033 | Every plot's gate faced north while its road arrived from the plaza through a hole cut in a side wall | Four parapet walls; the pylon gate is built on the wall the avenue reaches, at the crossing point; owner arrives just inside it | FIXED, plots 0 and 1 seen; other ten use the same code |
| BUG-034 | Gate braziers were buried inside the lintel and their fire shot sideways (also on avenue braziers) | Bowls sit on top of the lintel; emitters point up | FIXED in source; fire direction not closely inspected |
| BUG-035 | Adoption pad was sunk into the lawn (pad top = lawn top) | Raised to Y = 0.85 | FIXED, seen in Studio |
| BUG-036 | With gates on any side, the adoption pad and champion pedestal sat on the arrival point (a west-gate owner spawned on the pad and bought a cat) | Both moved near the courtyard centre | FIXED, arrival re-checked on plot 0 |
| BUG-037 | Cyber City, Ancient Temple and Cloud Kingdom were built at radius 500, on the rim of the 1000-stud home island | Moved to radius 850 with their return portals and `RealmLayout` spawns; temple wedge replaced by a stepped pyramid | FIXED, Cyber and Temple seen; travel to them not walked |
| BUG-038 | Outside the moat the world was empty void | Added an `OpenSea` plane | FIXED, seen in Studio |

![[Assets/Previews/MAP-FIXES/before-plaza-landmarks-2026-10-13.png|640]]
Before: bare palm trunks, grid showing through the sand.
![[Assets/Previews/MAP-FIXES/after-overview-2026-10-13.png|640]]
![[Assets/Previews/MAP-FIXES/after-plaza-palms-2026-10-13.png|640]]
After, actual Studio Play captures.

Still open: the Sphinx monument reads as a rounded blob in a frame, not a sphinx (art, not layout); realm interiors are bare platforms; stations inside plots are still world-aligned while gates now vary; cats now use true ellipsoids, so their proportions changed slightly and were not reviewed; all twelve plots and a full walk of every road were not individually checked; multiplayer untested. Backup: `.tools/backup-2026-10-13/src-before-map-fixes`.
