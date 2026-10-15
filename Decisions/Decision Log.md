---
type: log
id: LOG-DECISIONS
title: Cat Empire — Architecture Decision Log (ADR)
last_updated: 2026-10-12
status: ACTIVE
tags:
  - decisions
  - adr
---

# Architecture Decision Records (ADR)

| ADR ID | Date | Title | Status | Summary |
|---|---|---|---|---|
| `ADR-001` | 2026-10-11 | Adopt Rojo for Studio Sync | APPROVED | Use Rojo project mapping to keep Luau source files in git-controlled local folders. |
| `ADR-002` | 2026-10-11 | Obsidian as Authority Knowledge Base | APPROVED | Keep all game specs, asset catalogs, and ADRs in Obsidian vault; code and models in Studio. |
| `ADR-003` | 2026-10-11 | Luau `--!strict` Everywhere | APPROVED | Mandate strict typing on all Luau files to catch bugs statically and document contracts. |
| `ADR-004` | 2026-10-11 | Service-Controller Modular Pattern | APPROVED | Separate server business logic (Services) from client presentation (Controllers). |
| `ADR-005` | 2026-10-11 | 12-Player Radial Plot Grid | APPROVED | Arrange 12 player sanctuary plots at radius 280 studs with 86-stud open oasis buffers between adjacent plots to support multiplayer without crowding. |
| `ADR-006` | 2026-10-11 | 1,000-Stud Egyptian Map Overhaul | APPROVED | Expand world to 1,000-stud golden sandstone island with encircling Nile River moat, Great Sphinx Cat of Bastet, and Egyptian-themed tycoon stations. |
| `ADR-007` | 2026-10-11 | Central Plaza Cardinal Alignment | APPROVED | Align 160-stud plaza into 4 cardinal quadrants (Center: Sphinx, South: Spawn, North: Adoption, West: Leaderboard, East: Realm Portal) to avoid congestion. |
| `ADR-008` | 2026-10-11 | Blender Mesh Pipeline & Procedural Fallback | APPROVED | Support custom low-poly 3D models in `ReplicatedStorage.CatModels` with fallback to `CatModelFactory.luau` stylized procedural rigs. |
| `ADR-009` | 2026-10-11 | Sound Pooling & Delta-Gated SFX | APPROVED | Pre-allocate 12 linear roll-off sound instances in `SoundService` with pitch variance, delta-gating coin pickup sounds to positive earnings only. |


## 2026-10-12 implementation decisions

- **ADR-010 / IMPLEMENTED**: Retain the existing Egyptian sanctuary and saved realm IDs; centralize presentation colors/layout in UITheme, use a static CatModelFactory adoption portrait, and keep cloud movement local. User authorized visual improvements; runtime acceptance is pending.
- **ADR-011 / IMPLEMENTED**: Use dated source audits and explicit test evidence to qualify historical completion claims. Preserve old records; keep a continuation guide and generated file inventory for future sessions.

See [[Systems/UI]], [[Technical/Continuation Guide]], and [[Testing/Visual Polish Checks]].


- ADR-012 / IMPLEMENTED (2026-10-12): use fail-closed flat-profile UpdateAsync leases with existing datastore/key names, isolated Studio memory defaults and compatible schema additions; no new third-party persistence dependency. Production rollout requires draining old SetAsync servers.
- ADR-013 / IMPLEMENTED (2026-10-12): version currency patches separately from profile snapshots; use structural client signals and cached production/stat snapshots to avoid inventory work on income ticks. Preserve existing economy formulas and saved world IDs.

Evidence: [[Technical/Optimization Pass 2026-10-12]]. Engine acceptance is pending.

- ADR-014 / PLANNED (2026-10-13): user withdrew the native-only asset requirement and wants Blender-made 3D assets. Existing native v2 art stays in place until Blender replacements are imported and accepted; no assets changed yet. Blender 4.5 is installed; Blender MCP is not set up. Rojo does not import FBX, so each mesh needs a Studio import/upload by the user.

- ADR-015 / IN PROGRESS (2026-10-13): user is removing Expeditions and replacing the UI with the dark mockup style. Client window, menu button and guide step are removed; the server service, remotes and saved `expeditions` field stay until the user confirms deleting them (saved data is involved). UI direction supersedes the light Claude Design style chosen earlier the same day.
