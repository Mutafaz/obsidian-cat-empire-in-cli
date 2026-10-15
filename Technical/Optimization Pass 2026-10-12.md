---
type: implementation-report
status: TESTED
last_updated: 2026-10-12
---

# Optimization and Reliability Pass — 2026-10-12

This report supersedes the initial audit for changed systems. Preserve earlier
evidence in [[Technical/Project Audit 2026-10-12]]; this is not a release certification.

## Acceptance and resulting behavior

The plan targeted failed-load overwrites, profile ownership, duplicate starter
grants, and income-tick cloning/rebuilding. Request, merge, expedition and low-detail
gaps from the audit were also addressed.

| System | Implemented change |
|---|---|
| PlayerDataService / ProfileStore | Failed live loads refuse the join; UpdateAsync leases, bounded retries, staggered saves, in-flight save protection, and shutdown waiting |
| Studio persistence | Isolated memory store by default, even with Studio API access enabled; no automatic live-to-mock fallback |
| Structural transactions | Clone/commit; false/error aborts without mutating authoritative state; finite nonnegative currency totals checked |
| Plot startup / starter | PlayerLoaded/IsReady gate; already-loaded players caught; persisted idempotent starter marker; legacy inference avoids re-grants |
| Currency replication | Three balance fields plus revision per currency change; structural updates retain full snapshots |
| Client ordering | Separate profile/currency revisions preserve inventory and newer balances when messages arrive out of order |
| Production / economy | ProductionUtil caches derived rates on structural/yarn/world changes; no inventory clones on income ticks; shared prestige/adoption tuning preserves existing curves |
| Leaderboard / world reads | Small stats snapshots replace full inventory clones |
| Inventory / HUD / pets | Structural-change signals and pet equality prevent unrelated balance updates from rebuilding cards/models/counts; missing LocalPlayer binding fixed |
| Adoption / purchases | Atomic price/grant/station changes; adoption proximity to owned pad and server spacing checks |
| Merging | Assigned inputs rejected; equipped consumed UUID transfers to survivor; peer pet visual notified |
| RequestGuard | Server spacing for adoption, merge, equip, assignment, prestige, battles and selected expensive reads; ten-second battle cooldown |
| Expeditions | Profile-backed timestamps survive reconnect; finished unclaimed mission cannot be replaced; rewards/cat/mission consumption commit together |
| Roaming / animation | Four roaming cats per plot; inventory retained; server walk/stationary updates reduced to about 10 Hz |
| Low detail | Managed scene particles/trails/beams/bloom/sunrays suppressed; original enabled states restored; new emitters handled; unrelated effects untouched |

No FPS, memory, or network percentage improvement is claimed. Removed work paths
and bounded visual counts are source changes; device profiling remains required.

## Persistence contract and limitations

Existing datastore/key names remain `CatEmpire_Saves_v1` and `CatEmpire_UserData_v1_`.
Profiles keep their flat shape and unknown stored fields. Compatible schema-1 additions
are starterGranted and expeditions. Invalid required fields and future schemas are
refused, not replaced with defaults. `_session` is a private stored token/expiry
record stripped from cached gameplay data and client payloads. Existing key
metadata/user IDs are preserved.

Lease expiry: 600 seconds; staggered autosave/renewal: 120 seconds; up to three
attempts with backoff. Failed saves warn. Expiry prevents mutations and requests
a reconnect. Leaving waits for an in-flight save then saves/releases. Shutdown
waits up to 25 seconds for active saves/loads and logs unconfirmed completion.

Studio defaults to memory. To intentionally test the live store, set the
PlayerDataService ModuleScript's `UseLiveDataStore` attribute to true in Studio,
using disposable accounts/place data. No live player records were accessed here.

Older servers using SetAsync ignore leases: stop/drain those before a production
rollout of the new code. No rollout occurred. Crashes can lose progress since the
last successful save; API timeouts can leave commit outcomes uncertain. An
unconfirmed save is never reported as verified.

The adapter follows [Roblox's data-store guidance](https://create.roblox.com/docs/cloud-services/data-stores/best-practices)
for guarded updates, ordered retries, and periodic saving. Actual API latency,
quota/throttling, cross-server contention, and shutdown still need engine tests.

## Actual verification

- All **43 game source files** syntax-compile with Luau 0.742.
- Actual UI helpers pass on six viewports with seven modals per viewport, rotation,
  cleanup, navigation bounds/overlap, and five number-format cases.
- **81 offline core assertions** pass with actual modules/services: load/save failures,
  retries, fresh/legacy/corrupt/future schema, two owners/stale writes, metadata,
  transaction rollback, small ordered currency sync, starter/reconnect, adoption
  proximity, merge/equipped references, expedition reconnect/claim replay, battle
  cooldown/rewards, production stacking, stats snapshots, actual pet reuse, and
  managed/new/unrelated scene effect disable/restore.
- Rojo build passes. Roblox-aware type analysis, live viewport inspection, solo/
  multiplayer playtests, actual API persistence, and measured performance are NOT RUN.

Run `python tools/validate_project.py` (includes the core suite) or
`python tools/validate_core.py` for just core tests. Mocks do not model network
latency, Roblox scheduler races, engine geometry/streaming, or real DataStore quotas.

## Next checks

1. Restart Studio Play after sync and test fresh joins, station chain, returning
   plots, rebirth, workers, income, menus, followers, and low-detail mode.
2. Run two-player and disposable live-store tests for failures, competing owners,
   leaving during load/save, lease expiry, and shutdown.
3. Profile mobile with representative inventories; review slower server animations
   and move visual-only animation locally if replication remains costly.
4. Finish remaining world/status request budgets, peer pet/parade late-join sync,
   inventory virtualization, and prompt-failure feedback. NPC arena remains a PvE
   prototype; expeditions still check inventory counts rather than reserving teams.
5. Script Analysis, runtime/performance, saves, multiplayer, and asset permissions
   remain release gates. See [[Technical/Continuation Guide]].
