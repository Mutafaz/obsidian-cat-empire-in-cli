---
type: technical
status: IMPLEMENTED
last_updated: 2026-10-12
---

# Data Schema

## 2026-10-12 Optimization Update

Compatible schema-1 fields added: `starterGranted: boolean` (fresh default false; legacy inference from inventory/starter station) and `expeditions: { [string]: { finishTimestamp: number } }` (default empty). Types.reconcilePlayerData validates required fields without silently resetting corrupt/future records. Stored `_session` is adapter-private metadata in the flat record and is removed before gameplay/client access. Existing unknown fields are preserved. See [[Technical/Optimization Pass 2026-10-12]].

---


Source contract: `src/shared/Types.luau`, schema version 1. This describes current
source; it does not establish migration safety or runtime verification.

| Field | Current representation |
|---|---|
| schemaVersion | number, default 1 |
| fishCoins / goldenYarn / battleTrophies | numbers, default 100 / 0 / 0 |
| inventory | map of UUID → PlayerCatInstance |
| equippedCatUuid | optional UUID |
| tycoon | plotId plus stations map |
| unlockedWorlds / currentWorld | string array plus saved realm ID; defaults CozyMeadow |
| createdTimestamp / lastSavedTimestamp | server os.time numbers |

PlayerCatInstance contains `uuid`, `catId`, `level`, optional `assignedStationId`,
and `obtainedTimestamp`. Rarity and multipliers belong to CatDefinitions and are
not copied into individual records. StationSaveData contains `stationId`, `tierLevel`,
and optional `assignedCatUuid`. Current production does not use tierLevel to
implement a room-upgrade curve.

No expedition, offline-reward, evolution, material, session-lock, or battle-reservation
state exists in this schema. Existing load reconciliation adds only some missing
world/tycoon fields; schemaVersion is not used for comprehensive migration.
See [[Systems/Player Data]] and [[Technical/Project Audit 2026-10-12]] before changing saves.

## Schema 2 — onboarding (2026-10-12)

Adds tutorial = { completed: {[string]: boolean}, skipped: boolean, rewardGranted: boolean }. New profiles start active; legacy starter owners migrate to skipped. Completed milestones survive merges/prestige. Server profile transactions commit the reward and marker atomically. [[Systems/Onboarding]].

## Schema 3 — leaderboard history (2026-10-13)
`coinsEarned: number` starts at 0; `discoveredCats: {[string]: true}` persists historical species. `PlayerCatInstance.leaderboardExcluded: boolean?` marks new admin grants. Reconciliation validates these fields, seeds missing discoveries from non-excluded owned cats, preserves balances and starts missing earned coins at 0. Previously removed species and old admin provenance cannot be inferred. See [[Systems/Leaderboards]]. The older initial schema description above is historical, not the current full schema.


## 2026-10-13 — `loginRewards`
`loginRewards = { claimed: number, lastClaim: number }`: total login rewards claimed and the server time (seconds) of the last claim, 0 when never. Added as a defaulted field; `Types.reconcilePlayerData` rejects non-numbers, negatives, NaN, infinity and a fractional count. See [[Systems/Login Rewards]].


## 2026-10-14 — `catpediaClaimed`
`catpediaClaimed: number`: how many Catpedia collection milestones have been paid, in order. Defaulted to 0 for older saves; non-numbers, negatives, fractions, NaN and infinity are refused. See [[Systems/Catpedia]].

## 2026-10-14/15 — late night session fields
All fields are added with defaults. `Types.reconcilePlayerData` validates them and never resets them. See [[Late Night Session]].

| Field | Shape | Notes |
|---|---|---|
| `exploreClaimed` | `{[milestoneId]: true}` | Explore milestones already paid |
| `caches` | `{[worldId]: number}` | Server time each world's carrier cache was last opened. Negatives, NaN and infinity are refused. A time in the future is treated as a full 24-hour wait. |
| `catpediaPin` | `string?` | Species pinned as the collection goal. Non-strings are refused. |
| `teamLoadouts` | `{[presetName]: {uuid}}` | 1–3 string ids per preset. Ids of cats that have since gone are allowed (the client reports them). Preset names are limited to Solo, Boss and Friends by the server. |
| `PlayerCatInstance.kept` | `boolean?` | "Keep": never the cat used up in a merge |

`fightMap.team` is unchanged; saving a preset also writes it.

## 2026-10-15 — early morning session fields
All fields are defaulted on load and validated; nothing is reset.

| Field | Shape | Notes |
|---|---|---|
| `tradeRequests` | `"On" \| "Friends" \| "Off"` | Default On |
| `tradeHistory` | `{ {id, withUserId, withName, gave, got, at} }` | Newest last, 20 kept (up to 50 accepted on load) |
| `bossSlot` | number | Last scheduled boss slot paid; -1 = none |
| `bossWins` | number | Whole, at least 0 |
| `bossDamage` | number | Whole, at least 0 |
| `weekly` | `{ week, coins, bossWins }` | This Week boards; starts again each Monday 00:00 UTC |
| `PlayerCatInstance.training` | `{ strength?, toughness?, agility? }` | Whole upgrade-map steps (0–10 accepted on load; the server caps each track at its last step) |

**Trade journal (not part of the profile):**
- DataStore `CatEmpire_Trades_v1` holds:
  - `trade_<id>`: both sides' user ids, names and full cat records;
  - `user_<userId>`: that player's open trade ids.
- Profiles apply a listed trade on load if their `tradeHistory` lacks its id. Listings are removed once a load finds the receipt already saved. See [[Systems/Trading]].
