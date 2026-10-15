---
type: roadmap
id: ROADMAP-MAIN
title: Cat Empire — Master Development Roadmap
last_updated: 2026-10-12
status: ACTIVE
tags:
  - roadmap
  - milestones
---

# Cat Empire — Development Roadmap

## 2026-10-12 Audit Update

Reopen release hardening before publishing: fail-closed loads/session safety (P0), data-ready plot restoration/starter grants (P1), remote throttling/reward reservation (P1), merge-reference integrity (P1), durable expeditions (P1), then Studio visual/touch/multiplayer/performance acceptance. The requested visual pass is implemented; see [[Systems/UI]]. Historical “Complete” milestones describe source features, not full master-spec acceptance.

---

The sections below retain the prior project record. Where prior completion or verification claims conflict with this audit, use the dated audit evidence.


Adapted from the [[Master Specification]].

```
PHASE 1          PHASE 2          PHASE 3          PHASE 4          PHASE 5
Foundation   ──> Core Tycoon  ──> Collection   ──> Battling &   ──> Expansion &
& Tooling        & Sanctuary      & Merging        Prestige         Polish
(Active)
```

---

### Phase 1: Foundation & Tooling (Complete)
- [x] Create project guidelines (`GEMINI.md`, `AGENTS.md`).
- [x] Establish authoritative Obsidian knowledge base structure.
- [x] Configure Rojo project file (`default.project.json`).
- [x] Install Rojo CLI / Studio plugin and verify live synchronization.
- [x] Initialize Git source control repository (`master` branch).
- [x] Define full `Types.luau` contracts and Service/Controller framework architecture.

---

### Phase 2: Core Sanctuary & Tycoon Loop (Complete)
- [x] Implement server-authoritative `PlayerDataService` with session locking and mock store.
- [x] Build 12-player radial Tycoon plot assignment system ($R=280$ studs, 86-stud spacing).
- [x] Implement base currency generation (`Fish Coins`).
- [x] Implement station purchase and upgrade mechanics with distance validation.
- [x] Create comprehensive responsive HUD (currency counters, spring-punch scale animations).

---

### Phase 3: Cat Collection, Merging & Assignment (Complete)
- [x] Create data-driven Cat Definition registry (`CatDefinitions.luau`).
- [x] Implement kitten adoption / gacha rescue box with dramatic unboxing ceremony (`GachaController`).
- [x] Implement Cat Merging system (combining cats to rank up) with `SFX_MergeAscend`.
- [x] Implement cat workstation assignment (`StationUIController`) boosting station yields.
- [x] Implement visual roaming cat pet followers with smooth CFrame lerping (`PetFollowController`).
- [x] Build 16 Blender 3D models with `CatModelFactory.luau` procedural fallback.

---

### Phase 4: Expeditions, Battling & Prestige (Complete)
- [x] Implement expedition dispatch and timer reward system (`ExpeditionService`, `ExpeditionController`).
- [x] Implement 3-league auto-battler combat system with 10 cat signature skills (`CombatUtil`, `CombatService`).
- [x] Implement matchmaking and competitive leagues (Alley Prowlers, Cyber Syndicate, Celestial Coliseum).
- [x] Implement prestige/rebirth system with `Golden Yarn` currency and permanent perks (`PrestigeService`).
- [x] Implement 4-Realm World Travel (`WorldService`, `WorldController`) with Golden Yarn unlocks.
- [x] Implement Cat Parade server-wide 2x events (`ParadeService`, `ParadeController`).
- [x] Build global 3D SurfaceGui sanctuary leaderboard (`LeaderboardService`).

---

### Phase 5: Egyptian World Overhaul, Audio & Polish (Complete)
- [x] Expand island footprint to 1,000 studs diameter with sandstone plateau and Nile River moat (`MapService`).
- [x] Sculpt Colossal Great Sphinx Cat of Bastet, Nemes headdress, and 46-stud Sacred Lotus Pool.
- [x] Build 12 Grand Royal Processional Avenues with flaming bronze torch braziers and obelisks.
- [x] Align Central Plaza into balanced 4-Quadrant Cardinal layout (Center: Sphinx, South: Spawn, North: Adoption, West: Leaderboard, East: Realm Portal).
- [x] Re-theme all 5 Tycoon Stations into Egyptian architectural masterpieces with autonomous wandering cats.
- [x] Ingest sound pooling and map authentic Egyptian temple background music (`AudioController`).
- [x] Add floating currency popups, celebration bursts, and mobile low-detail mode (`FXController`).
- [x] Add Game Settings modal with sound/music/performance toggles (`SettingsController`).
- [ ] Run final Studio multi-player playtest and complete release publishing checklist.


## 2026-10-12 optimization checkpoint

The main initial audit fixes now exist with offline evidence: fail-closed loads/session leases, one-time starter/data readiness, transaction/merge integrity, selected request guards, persistent mission state, and elimination of income-tick inventory cloning/rebuilds. Do not mark release hardening complete: perform Script Analysis, solo/two-player flows, disposable API failure/ownership/shutdown cases, and mobile profiling next. See [[Technical/Optimization Pass 2026-10-12]].
