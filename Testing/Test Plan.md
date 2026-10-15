---
type: testing
id: PLAN-TESTING
title: Cat Empire — Master Test Plan
last_updated: 2026-10-12
status: ACTIVE
tags:
  - testing
  - qa
---

# Master Test Plan

## 2026-10-12 Audit Update

See [[Testing/Visual Polish Checks]] for the actual 2026-10-12 commands/results and pending Studio acceptance steps. Historical Rojo sourcemap claims should not be interpreted as AST compilation; it maps instances. A `--!strict` header alone is not evidence of passing Roblox type analysis. No current Studio save/reconnect/multiplayer test was run.

---

The sections below retain the prior project record. Where prior completion or verification claims conflict with this audit, use the dated audit evidence.


## 1. Testing Philosophy
- **Never claim a feature works without appropriate verification.**
- Distinguish between **IMPLEMENTED**, **TESTED**, and **VERIFIED**.

## 2. Test Environments & Types

| Test Type | Tool / Environment | Scope | Acceptance Criteria |
|---|---|---|---|
| **Formula & Math Unit Tests** | Standalone Luau / Lune | Cost formulas, drop tables | Correct probability distributions within 2% margin. |
| **Studio Solo Run** | Roblox Studio Play Solo | Single-player game loops | No runtime errors in Output window; UI renders smoothly. |
| **Multiplayer Network Run** | Studio 2-Player Local Server | Replication, trading, plot assignment | No race conditions; player A cannot mutate player B's plot. |
| **DataStore Integrity** | Mock store $\rightarrow$ Production pcall | Autosave, leave, reconnect | Progress restored accurately without data loss. |

## 3. Active Test Logs

| Test ID | Test Scope | Tool / Method | Date | Result | Findings & Notes |
|---|---|---|---|:---:|---|
| `TEST-001` | Rojo Sourcemap & Compilation | `rojo sourcemap` | 2026-10-11 | PASS | Clean AST generation, zero schema errors across DataModel. |
| `TEST-002` | Luau Strict Typing Compliance | Luau Analyzer | 2026-10-11 | PASS | All 23 source files start with `--!strict` and export typed signatures. |
| `TEST-003` | Central Plaza Cardinal Spatial Geometry | Coordinate Audit | 2026-10-11 | PASS | Sphinx (Center), Spawn (South), Adoption (North), Leaderboard (West), Portal (East) non-overlapping. |
| `TEST-004` | 12-Plot Radial Separation | Trigonometric Formula | 2026-10-11 | PASS | At $R=280$, adjacent plot distance is $146.6$ studs, leaving an 86.6-stud buffer between 62-stud plot shells. |
| `TEST-005` | Mock DataStore Persistence | `PlayerDataService` Mock | 2026-10-11 | PASS | In-memory session store persists across mock sessions without requiring Studio API access. |
| `TEST-006` | Bottom HUD Navigation Alignment | ScreenGui Position Audit | 2026-10-11 | PASS | Inventory (20-200), Expeditions (210-370), Combat (380-530), Realms (540-680) are cleanly aligned side-by-side. |


## 2026-10-12 reliability/core suite

The updated tools/validate_project.py includes tools/validate_core.py: 43 source syntax compilations and 81 offline assertions, plus the UI fixture. Core tests execute actual ProfileStore, Types, CatService, PlayerDataService, ExpeditionService, CombatService, DataController, PetFollowController, FXController and pure helper source under injectable mocks. They cover failures, lease ownership, legacy/corrupt schemas, rollback, starter/rejoin, atomic actions, replay guards, version ordering, payload scope, rate formulas, model reuse and detail state restoration. This is not Roblox type checking or real latency/scheduler/persistence profiling. See [[Technical/Optimization Pass 2026-10-12]] for outstanding engine tests.
