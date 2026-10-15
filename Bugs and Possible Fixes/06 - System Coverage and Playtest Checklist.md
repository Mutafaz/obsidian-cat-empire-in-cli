---
type: audit-coverage
created: 2026-10-15
status: SOURCE REVIEW AND OFFLINE CHECKS - ENGINE ACCEPTANCE PENDING
---

# System Coverage and Playtest Checklist

The matrix lists every current server service plus its related player-facing paths. “Reviewed” describes the depth of this audit, not a claim that every line or every branch was tested. All 89 runtime Luau source files were syntax checked and compared with Edit-mode Studio fingerprints. Selected service/module logic and controller paths were inspected in detail; world geometry, full device behavior and multiplayer were not exercised here.

## System matrix

| Area / service | What was inspected or executed | Findings / limits |
|---|---|---|
| Bootstrap and NetworkUtil | Service/controller lifecycle source; remote registration patterns; validator | QA-022; ordering/readiness needs injected engine failures |
| PlayerDataService / ProfileStore | Full persistence source and existing mock tests | Trade recovery gates QA-001–004; live API/shutdown untested |
| CatService | Grants/starter, adoption, equipment, Keep, merge and follower broadcast source; merge provenance probe | QA-005; late-join follower rendering pending |
| TycoonService | Station purchase chain/restoration, assignment, data-ready plot allocation, reset and production loop | QA-017/018; no full plot/physics walk or 12-player test |
| MapService / realm builders | Architecture/map notes, entry points, existing map-audit history; full syntax coverage | Geometry not re-rendered; inspect all entrances/road/realm collision paths |
| WorldService | Unlock transaction, travel/root checks and respawn reset source | Travel/active-encounter policy and streamed arrival need tests |
| PrestigeService | Reward/reset source and existing core tests | Balance/permanent-yarn wording decision; actual rebuild/rejoin pending |
| TutorialService / guide | Existing service/progress tests, controller and continuation context | Fresh user, skip/reopen, one-time bonus and full live flow still need current acceptance |
| LoginRewardService | Complete claim handler, shared rules and existing tests | Real wait and live save pending; placeholder values are design decisions |
| CatpediaService | Complete claim/pin handlers, discovery/owned/bonus rules, controller states | Ownership/discovery messaging and phone reflow; owner-grant policy decision |
| ShopService | Complete purchase handler and current shop UI/odds/affordability update paths | No new atomic purchase defect found in reviewed path; all carrier reveals on phone remain unchecked |
| TrainingService | Complete handler and controller, training definitions/reconcile contract | QA-019; small/scaled upgrade controls QA-014 |
| CombatService | Rival/practice team building, snapshots, cooldowns/rewards and action validation | QA-017 player misunderstanding; real turn/action and reward UI checks needed |
| FightMapService | Full progression/team/reward handler source and 80 offline assertions | Eight fights remain; real scroll/selection/first-clear/replay/boss acceptance pending |
| PvPService | Full invitation/session/action/expiry source plus existing tests; lobby/controller update paths | Two real clients required; no friendly reward farming path claimed |
| PartyService | Full invite/ready/choose/travel source and existing tests | Partial-travel reason wording; independent fights are planned behavior |
| ExploreService | Complete milestones/cache/trainer creation source and existing tests | Five caches, trainer/portal walkthrough and refill pending |
| TradeService / TradeJournal | Complete source, current UI flow, existing tests and four new recovery probes | QA-001–004,010/011,014/015; highest integrity priority |
| BossEventService | Complete event flow, attack, join, payout and client banner/result paths | QA-012/013/015; multi-player/late-entry and fault acceptance pending |
| ParadeService | Full scheduling/status/late-join source; existing tests | QA-020; event sync on actual joining client pending |
| LeaderboardService | Public snapshot endpoint and world-board integration source; existing tests | Final score/provenance cross-system concerns; actual world interaction pending |
| GlobalLeaderboardService | Complete publish/cache source; seeded stale-score probe; client tab source | QA-007–009; no live OrderedDataStore calls made |
| AdminService / AdminConfig | Authorization, selected action/validation, audit queue/flush source and existing tests | Non-owner real-server refusal, filtering/moderation and other-player effects pending |
| ExpeditionService | Complete server handler source and disabled-client flag; hidden-feature probe | QA-006/020; decide retirement and legacy claims |
| HUD/Pets/Settings | Current bindings, responsive helpers, interaction handlers and historical Pets render | QA-014–018; preferences, focus and device checks pending |
| Audio/FX/Clouds/Parade/PetFollow | Audio/FX/follower key paths and current settings/preview/animation helpers; existing mocks | QA-021; low-detail performance, sound playback and remote-pet late joining unverified |
| Models/assets | Factory/registry/preview paths, asset notes and three historical UI previews | No Blender rebuild, upload, live render or asset approval performed |

## End-to-end checklist for the next tester

These boxes intentionally remain unchecked; a passing offline fixture does not check a Studio box.

### Fresh player and sanctuary

- [ ] Open an isolated new profile: loading, guide and free station appear in a usable order.
- [ ] Complete guide, skip/reopen and verify the bonus cannot be claimed twice.
- [ ] Buy every station in sequence, test shortage feedback, assign/move/unassign a worker and verify the actual income delta.
- [ ] Adopt once on step-on, leave/re-enter the pad, use its prompt and test wrong-owner/distance rejection.
- [ ] Search a populated inventory; Follow, Keep, manual merge and auto-merge; train and practice with the selected cat.
- [ ] Rebirth through its actual confirmation and verify coins, stations, cats, assignments, worlds, training and guide markers against the reset contract.
- [ ] Rejoin and respawn from every world; check saved progress and home location.

### Explore, progression and events

- [ ] Scroll/unlock/play all eight Trail encounters including final boss; compare first clear, replay, forfeit and timeout rewards.
- [ ] Travel/unlock every world; challenge each trainer; open all five caches and check refill after rejoin.
- [ ] Switch/restore team presets after a cat is merged or traded away; repair missing slots.
- [ ] Collect multiple Explore and Catpedia awards; repeated requests do not duplicate claims.
- [ ] Claim each login reward through actual timing and a saved rejoin; inspect next cycle and locked state.
- [ ] Run the scheduled boss with multiple real trainers, late entry, zero/low/high contribution, knockout and timeout.
- [ ] Run a parade, join late and compare income before/during/after; check owner-triggered scheduling.

### Multiplayer and persistence

- [ ] Two real clients complete reciprocal trade, one-way gift, offer edit, decline/cancel/expiry and Keep/following/worker restrictions.
- [ ] Fault-test journal writes/reads/receipts before treating trade as release-ready; repeat with disposable live records after offline repair.
- [ ] Two real clients duel with invitations, switches, countdown, simultaneous input, forfeit and departure.
- [ ] Party invite/accept/ready/change destination/GO ANYWAY; test locked/dead member, leader change and correct travel reasons.
- [ ] Late joiner sees other players' follower pets and active event state; re-equipped/merged pet updates for everyone.
- [ ] Record final global scores on short sessions/departure; clear stale power; flip tabs with latency and failures.
- [ ] Verify owner grants stay off intended boards after merges, trades and derived rewards according to the approved policy.
- [ ] Non-owner cannot invoke owner actions on a real server; audit outcomes, text filtering and disposable-account moderation behave correctly.
- [ ] Disposable save lease contention, outage, expiry, ambiguous timeout, shutdown and rejoin conserve valid progress.

### UI, devices and world

- [ ] Phone portrait + short landscape, desktop and rotation: final 44–48-pixel touch areas, readable text and reachable scroll/footer actions.
- [ ] Trade/boss popups fit; modals and receipts do not obscure required choices or native movement/jump controls.
- [ ] Keyboard/gamepad: focus, navigation, Activate, Back/close and focus restoration.
- [ ] Every asynchronous action has pending, refused, timeout and retry feedback.
- [ ] Music/SFX/reduced motion/low detail behave as labeled; listen to every active sound path.
- [ ] Walk all twelve plots and roads, five realm arrival/return routes, chest/trainer prompts and the island edge.
- [ ] Measure large-inventory/multi-player/low-end-client FPS, memory and replication; do not infer performance from syntax tests.

Related historical list: [[Testing/Not Yet Tested]]. Some statements in that older list are stale (for example it still says NPC trainers are not built); use current source plus [[Early Morning Session]] and this coverage matrix when planning acceptance.
