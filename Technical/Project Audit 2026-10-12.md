---
type: audit
status: TESTED
last_updated: 2026-10-12
---

# Project Audit — 2026-10-12

## Scope and evidence

Inventoried project files, read the Obsidian knowledge base and source structure,
examined gameplay/persistence/remote paths and presentation code, and compiled all
Luau source. [[Technical/File Inventory]] records each text file's structure and
each binary asset's size/fingerprint. Binary Blender/FBX assets were not opened in
a 3D editor; their mesh quality and Studio imports are not verified. This is an
implementation audit, not an exhaustive security certification.

The duplicate master documents have matching contents. Preserve them for history;
`Master Specification.md` is the required entry point. Obsidian's `.obsidian` files
are editor configuration, not gameplay assets. No personal/editor settings were changed.

## Actual architecture

| Area | Implemented responsibility | Constraints |
|---|---|---|
| Bootstrappers | Require Services/Controllers, call OnInit then concurrent OnStart | Enumeration/start ordering does not enforce player-data readiness |
| PlayerDataService + Types | Session tables, default schema, clone reads, GetAsync/SetAsync, autosave | No cross-server lock, migration validation, load-failure save guard, or retry strategy |
| CatService + CatUtil + CatDefinitions | Ten species, server adoption, same-species/level merge, equip | Only Common–Legendary rolls; no inventory cap or common remote throttle |
| TycoonService | Twelve radial plots, five chained stations, assignments, passive income, roaming cats | Very large module; starter granting mixed with visual restoration |
| MapService | Procedural Egyptian island, Sphinx, plaza, palms, clouds, atmosphere | Generated at runtime; no visual or part-budget profiling performed |
| WorldService + WorldDefinitions | Four realm plazas, yarn unlocks, teleport and income multiplier | Keep stable IDs; secondary realms are simple prototypes |
| CombatService + CombatUtil | Up to three strongest cats against fixed NPC divisions | Not real player matchmaking or asynchronous PvP; most skills are damage multipliers |
| ExpeditionService | Three server-timed missions and reward claims | Active state exists only in memory; assigned cats are not reserved |
| PrestigeService | Square-root yarn award, station reset, inventory retained | Formula/UI tuning remains partly duplicated |
| ParadeService | Timed server event and double production | Late-joining event synchronization needs review |
| LeaderboardService | Top five connected players by trophies/coins | Server-local ranking, not a persistent global leaderboard |
| DataController | Cached replicated profile and UI signals | Full profile sync, no schema validation on load |
| Inventory/Station UI | Collection cards, merging/equip, worker selection | Further mobile readability and empty-state cleanup needed |
| Gacha/FX/Audio | Adoption ceremony, visual effects, pooled sounds, realm music | Asset permissions/attribution and low-detail scene effects need verification |
| HUD/Settings/World/Prestige/Combat/Expedition/Parade UI | Screens and navigation for implemented actions | Responsive fitting added; actual rendering and scaled control readability need Studio |
| PetFollowController | Local interpolated companion models | Recreates local pet on each profile update; late-join peer pets need review |
| CatModelFactory + AssetRegistry | Procedural models/custom imported model lookup and IDs | Rojo does not import local FBX files; numeric audio IDs do not prove permission/license |
| Signal + NetworkUtil | Typed signals and remote creation/wait helpers | Remote factory provides no validation/rate limiting by itself |
| Asset generator | Blender source/output generator | Hardcoded output directory; executing overwrites outputs |

## Most important findings

1. **P0 / BUG-006 — Save overwrite risk:** `loadData` returns fresh defaults after
   GetAsync failure. The session is later saved with SetAsync, potentially replacing
   a valid profile. GetDataStore success also does not guarantee later API access.
   No session-lock mechanism exists despite historical documentation claims.
2. **P1 / BUG-007 — Join readiness and duplicate starter:** Tycoon initialization
   runs independently of asynchronous data loading. A plot created before its
   profile cannot restore saved stations; `buildStation(starter_kitten)` also grants
   a new cat during restoration/rebirth. Inspect PlayerLoaded wiring before fixing.
3. **P1 / BUG-008 — Remote reward spam:** StartArenaBattle awards a winning result
   on every invocation with no server cooldown/match reservation. AdoptCat also has
   no proximity check or rate limiter. Client button debounces are insufficient.
4. **P1 / BUG-009 — Merge references:** `canMerge` allows assigned cats; consuming
   a worker/equipped UUID leaves related references inconsistent. Define and enforce
   ownership, assignment, equipped-state, and transaction rules before mutating.
5. **P1 / BUG-010 — Expedition continuity:** active missions disappear on leaving;
   PlayerData has no expedition schema. Starting again can also replace an unclaimed
   finished mission. Claim state is cleared before rewards are confirmed.
6. **P2 — Documentation drift:** registry `.obj` paths do not exist; actual models
   are `.fbx`/`.blend`. Mythic/Secret are in types/UI but not the catalog/drop pool.
   CatCollection's chance table differs from implemented Legendary 1%. Several
   navigation links lead to missing notes; see inventory.
7. **P2 — Performance/visual follow-up:** full profile replication per income tick,
   follower rebuilds, unbounded new roaming cats, many server-driven part animations,
   low-detail toggle not disabling existing world emitters, generic inventory emoji,
   and overlapping dialogs all require focused follow-up/profiling.
8. **P2 — Returning roaming cat label:** TycoonService reads `catInstance.rarity`,
   although rarity belongs to the definition and is absent from PlayerCatInstance.

## Specification comparison

This is a substantial prototype/vertical slice, not a verified full implementation
of the master specification. It lacks five-cat selectable teams, actual PvP snapshots,
competitive seasons/rating, durable expeditions, evolution/material recipes,
offline rewards, comprehensive room upgrades, release-grade persistence, and
documented multiplayer/security evidence. Older percentages and checkmarks are
historical claims, not acceptance evidence from this audit.

## Tool/integration state

Direct filesystem vault access is confirmed. Rojo 7.7.1 responds locally as
CatEmpire on 34872. Build and sourcemap commands pass. Neither proves the Studio
plugin is connected or that Luau runs. No live Studio state was inspectable through
available tools. Official Luau CLI syntax checks pass; Roblox-aware type analysis,
Studio playtests, multiplayer, asset rendering, and persistence tests were not run.

## First deliverable and next priorities

The requested visual pass is IMPLEMENTED with local compile/mock evidence; see
[[Systems/UI]] and [[Testing/Visual Polish Checks]]. Next: Studio review of the pass,
then fail-closed persistence with an explicit Studio-only mock path, load readiness,
and session ownership. Follow with request throttling/reward transactions, merge
reference repair, and expedition persistence. Keep each change separately testable.
