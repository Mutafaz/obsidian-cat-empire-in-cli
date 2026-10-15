---
type: backlog
id: BACKLOG-TASKS
title: Cat Empire — Task Backlog
last_updated: 2026-10-12
status: ACTIVE
tags:
  - backlog
  - tasks
---

# Cat Empire — Task Backlog

## 2026-10-12 Audit Update

- [x] **TASK-026**: File inventory, implementation audit, README, and continuation guide; static discovery evidence recorded.
- [x] **TASK-027**: Egyptian HUD/dialog/navigation/adoption/map/cloud polish implemented; compile/build/mock checks pass.
- [ ] **TASK-028 (P1)**: Complete [[Testing/Visual Polish Checks]] in Studio and record screenshots/logs; no runtime verification yet.
- [ ] **TASK-029 (P0)**: Prevent failed loads from creating writable default live sessions; implement Studio-safe mocks/session protection. Acceptance: failed read never overwrites prior data; two-server ownership and shutdown/save failures tested.
- [ ] **TASK-030 (P1)**: Gate plots on loaded profiles and grant starter once. Acceptance: rejoin restores stations/inventory without new starter grants; fresh join and rebirth behavior explicitly tested.
- [ ] **TASK-031 (P1)**: Validate/throttle valuable requests and reserve reward-bearing battles. Acceptance: rapid/adversarial requests cannot farm duplicate rewards or bypass interaction rules.
- [ ] **TASK-032 (P1)**: Repair assigned/equipped references during merges. Acceptance: consumed cat UUID has no station/follower references; invalid/assigned merge cases covered.
- [ ] **TASK-033 (P1)**: Persist expedition state and atomic claims. Acceptance: unfinished/finished missions survive reconnect; repeated claims cannot double-award; unclaimed completion is not overwritten.

---

The sections below retain the prior project record. Where prior completion or verification claims conflict with this audit, use the dated audit evidence.


## 🔴 High Priority (Immediate Next Tasks)

- [x] **TASK-001**: Install Rojo (`winget install Rojo.Rojo`) and verify Studio plugin connection.
- [x] **TASK-002**: Initialize Git repository and commit baseline scaffolding (`git init`).
- [x] **TASK-003**: Create `ServiceFramework` architecture in `src/server` and `src/client` (Lifecycle: `OnInit`, `OnStart`).
- [x] **TASK-004**: Implement `DataService` with safe in-memory mock fallback for Studio testing.
- [x] **TASK-005**: Design and build modular Tycoon Plot template in Studio / Luau.

---

## 🟡 Medium Priority (Core Gameplay Foundation)

- [x] **TASK-006**: Implement server-side currency accumulation math with pure utility functions (`EconomyUtil.luau`).
- [x] **TASK-007**: Build secure RemoteEvent network contracts with parameter type-checking and rate-limiting.
- [x] **TASK-008**: Define first 10 cat species in `CatDefinitions.luau` (Common to Legendary).
- [x] **TASK-009**: Implement Cat inventory and merging logic on the server.
- [x] **TASK-010**: Build player UI HUD (Coin Counter, Cat Inventory Drawer).
- [x] **TASK-015**: Implement Cat Workstation Assignment (`StationUIController`, 3D worker cats, station multiplier scaling).
- [x] **TASK-016**: Implement Multi-World Realm Travel (`WorldService`, `WorldController`, Golden Yarn realm unlocks).

---

## 🟢 Low Priority / Polish & Audio

- [x] **TASK-011**: Implement expedition auto-timer system.
- [x] **TASK-012**: Design arena combat formulas and auto-battle resolution.
- [x] **TASK-014**: Build Cat Parade world event and global 3D plaza leaderboard monument.
- [x] **TASK-013**: Ingest audio and visual particle effects from `assets/CATALOG.md` (`AssetRegistry.luau`).
- [x] **TASK-017**: Sound effects, sound pooling, and ambient realm BGM playback triggers (`AudioController.luau`).
- [x] **TASK-018**: Game settings modal with mobile low-detail mode (`SettingsController.luau`).
- [x] **TASK-020**: 1,000-stud Egyptian Island Map Expansion with Nile moat & royal avenues (`MapService.luau`).
- [x] **TASK-021**: Colossal Great Sphinx Cat of Bastet, Nemes headdress, and Sacred Lotus Pool (`MapService.luau`).
- [x] **TASK-022**: 12-Player Grand Radial Plot Grid ($R=280$ studs, 86-stud separation) (`TycoonService.luau`).
- [x] **TASK-023**: 5 Ancient Egyptian Tycoon Stations with autonomous cat wandering AI (`TycoonService.luau`).
- [x] **TASK-024**: Central Plaza 4-Quadrant Cardinal Spatial Alignment (Sphinx, Spawn, Adoption, Leaderboard, Portal).
- [x] **TASK-025**: Blender 3D Low-Poly Mesh Model Pipeline & Factory (`CatModelFactory.luau`, `assets/models/`).
- [ ] **TASK-019**: Final multiplayer testing pass and Studio place publish verification.


## 2026-10-12 follow-through

- TASK-029/030/031/032/033: implementation delivered with offline evidence; original real Studio/API/multiplayer acceptance remains pending rather than marking all checks complete.
- [x] TASK-034: eliminate income-tick profile clones/replication and unchanged pet/inventory rebuilds; cache production/stat summaries; bound roaming visuals; source plus offline checks.
- [x] TASK-035: reversible scene low-detail effects and new-emitter handling; offline checks.
- [ ] TASK-036 (P1): Script Analysis + Studio solo/two-player/API failure/ownership/shutdown acceptance for this pass, with logs and screenshots.
- [ ] TASK-037 (P2): profile mobile/large inventory, review 10 Hz server animations, virtualize inventory, finish late-join pet/parade sync and remaining request budgets.

See [[Technical/Optimization Pass 2026-10-12]].

## 2026-10-12 gameplay continuation

- [x] TASK-038: Existing-game onboarding implementation, solo Studio milestone flow, desktop skip/reopen, mock save/rejoin and one-time reward tests. [[Systems/Onboarding]].
- [ ] TASK-039: Physical mobile guide interaction, multiplayer/rejoin acceptance and clearer world navigation.
- Asset remakes deferred by user; Figma concept is not approved runtime art.


## 2026-10-12 — New gameplay checkpoint
Delivered: interactive arena turns,2 realm prototypes/rivals,guide replay pages,map entry fixes,Graphify local graph. Follow-up priorities: manual/mobile touch and multiplayer checks; physical realm rival/return prompt walkthrough; team-selection UI and battle animation; wild catch/items/evolution from full Cat Trainer spec; later asset/world art pass. See [[Testing/Realms and Turn Battles 2026-10-12]].
