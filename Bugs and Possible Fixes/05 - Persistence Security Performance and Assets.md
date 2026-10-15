---
type: technical-audit
created: 2026-10-15
status: OPEN - NO FIXES APPLIED
---

# Persistence Security Performance and Assets

## QA-019 - Upgrade save validation disagrees with upgrade rules

**P2 · OFFLINE REPRODUCED.** `Types.luau:194` accepts any string upgrade key and integer steps up to 10. `TrainingDefinitions.luau:52` only accepts known tracks and their own caps: Strength/Toughness 5, Agility 3. The stricter validator is not used by reconciliation.

**Reproduction:** a saved cat with `{strength = 10, invented = 2}` passes `Types.reconcilePlayerData`, although `TrainingDefinitions.valid` rejects it. Stat calculation consumes the over-cap Strength value, yielding more attack than the intended upgrade map permits. This is a corrupt/legacy-save validation issue; no current client path to directly set arbitrary training was demonstrated.

**Possible fix:** establish one dependency-safe training schema for reconciliation and runtime validation. Reject or explicitly migrate unknown/out-of-range values, preserving the original record for recovery. Avoid a Types ↔ TrainingDefinitions require cycle. Do not silently reset a whole profile over one malformed upgrade record.

**Acceptance:** known tracks at zero/cap, cap+1, unknown names, negative/fractional/NaN/infinite steps and old profiles without training. Migration policy preserves valid progress.

## QA-020 - Some read endpoints bypass the overall request budget

**P2 · SOURCE CONFIRMED.** `ParadeService.luau:88` exposes GetEventStatus without RequestGuard. `ExpeditionService.luau:162` exposes GetExpeditionStatus similarly. Most newer handlers use the shared per-action and overall budget in RequestGuard.

**Impact:** a client can repeatedly call these handlers without consuming that advertised overall budget. Responses still perform work and allocate/serialize tables. No measured server slowdown or denial-of-service was demonstrated, so the impact is an uncovered control boundary rather than a benchmark claim.

**Possible fix:** guard/cache these reads with an appropriate per-action cadence and the same aggregate budget; retire hidden endpoints according to QA-006. Keep ordinary UI polling well within the allowed load and return a predictable throttled response.

**Acceptance:** alternate all read endpoints, spam each independently, and exercise ordinary window/leaderboard/boss interactions together. Verify budgets, clean-up on departure and useful retry feedback without penalizing normal input.

## QA-021 - Missing sound assets leave important feedback silent

**P2 · SOURCE CONFIRMED CONTENT GAP.** `AudioController.luau:37` maps CozyMeadow to BGM_AncientTemple. That entry is nil in `AssetRegistry.luau:109`; PlayMusic returns immediately if there is no asset. Meow, merge, prestige, portal, combat hit and other realm tracks also intentionally have nil IDs because earlier references were invalid.

**Possible fix:** choose properly licensed/permitted replacement audio, register and preload it, and provide a valid fallback for missing realm music. Keep mute settings and avoid log spam. Do not reinstate the invalid historical IDs merely to remove nils.

**Acceptance:** home join, every realm, missing/denied asset, rapid travel, mute/unmute and simultaneous SFX. Listen in Studio; an ID in a registry or a successful compile is not proof of audible playback.

## QA-022 - Startup success logging does not mean successful initialization

**P2 · SOURCE CONFIRMED.** Both `src/server/init.server.luau` and `src/client/init.client.luau` warn on require/OnInit errors, then continue and report that all loaded modules initialized successfully. OnStart runs in separate spawned tasks, after or independently of that success message. Failed modules are not marked unhealthy or excluded from subsequent phases.

**Impact:** a clean-looking success count can hide a missing service/controller, and dependent systems may still start against incomplete initialization. This review found no syntax failure; the issue is how future runtime failures are handled and reported.

**Possible fix:** track phase outcomes, distinguish loaded/initialized/started, and explicitly gate critical dependencies. Fail closed for unavailable persistence/economy services; expose a useful startup report. Preserve the service/controller pattern rather than replacing the whole bootstrap solely for logging.

**Acceptance:** inject one require failure, one OnInit failure and one yielding OnStart failure. The report must identify the module/phase; critical dependent systems must not advertise readiness. A successful run reports actual completed states.

## Persistence review and remaining release checks

The current ProfileStore uses UpdateAsync, leases, bounded retry/backoff, cloning and rejection of invalid/future data. PlayerDataService defaults Studio to memory and refuses unavailable live loads. These supersede the original source audit's unsafe SetAsync/default-load behavior; do not reopen BUG-006 just by copying its old description.

The major new weakness is the trade recovery protocol, documented in [[01 - Trading and Recovery]]. Additional tests remain necessary:

- Real API refusal/timeout, stale owner, overlapping server joins, lease expiry and final-save contention.
- Shutdown while saves or journal operations are yielding. SaveNow may skip a busy adapter and does not acknowledge durability to its caller.
- Long journal recovery relative to the acquired profile lease. Verify that an unresolved join never exceeds its ownership window and exposes stale data.
- Recovery must update all derived state consistently, including discoveries, team UUIDs, equipped pet and station links. Journal.apply clears the active team but does not prune saved presets; a UI may reasonably flag missing preset cats, but must not silently use them.
- Successful profile mutation means committed **in memory**. Autosave generally runs every 120 seconds; a normal server crash can roll back recent non-journaled progress. Any stronger durability promise needs evidence and a deliberate design.
- Schema additions remain at version 3 with additive defaults. Decide how incompatible future changes will be versioned/migrated; additive fields alone are not a current bug.

Do not run fault tests on real players' saves. Use the existing mock adapter and, for engine/API acceptance, separate disposable keys/stores with explicit isolation.

## Performance risks to measure, not confirmed slowdowns

| Source evidence | Possible effect | Suggested investigation / fix |
|---|---|---|
| PlayerDataService:GetStatsSnapshot computes and sorts owned cats for Team Power (`:80`) | Snapshot work grows with inventory; even callers wanting one world multiplier can pay for unrelated stats | Profile with large inventories; cache/version derived ranking values or expose a smaller snapshot where needed |
| PlayerDataService:GetData deep-clones the entire profile (`:66`); Trade/PvP status asks for many players' data | Polling cost grows with player count and inventory size | Use narrow public summaries and avoid full profile copies for lobby availability |
| Structural UpdateData clones a profile and replicates a full snapshot (`:136`, publishChange) | Rapid small mutations can amplify network/CPU cost | Measure payload sizes and action rates; batch or patch deliberately while retaining revision safety |
| Pets, trade pool and Catpedia create model previews for many cards | Large inventory/catalogue render and search can be expensive | Measure instance count/frame time with 100/500 cats; reuse keyed cards or virtualize visible rows |
| Boss recomputes team attack and fallback sorting on each attack | Repeated work for a busy event, plus inconsistent team policy | Resolve QA-012 first; then cache encounter team stats with explicit invalidation |
| Global leaderboard writes/reads are serialized; username lookups may yield | A nominal two-minute refresh can take longer under budget pressure | Measure actual pass duration and expose cache timestamps; bound/retry pending work without overlapping stale writes |
| Admin log batches accumulate during an outage and use one shared key | Memory growth or cross-server write contention | Cap/observe queue safely, retry with backoff and retain unique entry IDs for ambiguous outcomes |

No FPS, memory, network bandwidth or maximum-player benchmark was measured. Workspace.StreamingEnabled was confirmed true in Edit mode, but that does not certify low-end phone performance.

## Map and asset suggestions

- Recheck every one of the twelve plot entrances, purchase chain, adoption pad, worker podium and return route. Earlier fixes sampled only some plots; absence of a new source finding is not a completed walk test.
- With streaming enabled, travel to all five realms on a slow client and verify floors/portals/caches/trainers are usable on arrival. Add a loading/arrival state only if measurements reveal a need; no new fall-through was reproduced here.
- Improve landmark silhouettes and world-specific detail gradually, beginning with a recognisable central monument and clear destination signs. Preserve the existing movement paths.
- Five newer cat species still use native-part variant art per the latest notes. This is a documented stopgap against the Blender direction, not a newly observed rendering failure. Model future replacements in Blender under `assets/models/`, import using the authorized workflow, and preserve source files and prior previews.
- The Orange Tabby Blender pilot has several revisions and is not evidence that the entire roster has been imported/approved. Review the selected revision in world, follower and portrait use before changing factories.
- Keep Forge unchanged and leave its agreement acceptance to the user. This audit neither used nor extracted its EmitModule.

Related: [[Systems/Player Data]], [[Technical/Security]], [[Technical/Optimization Pass 2026-10-12]], [[Assets/Asset Registry]], [[Assets/Orange Tabby Blender Pilot]], [[Technical/Continuation Guide]].
