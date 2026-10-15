---
type: technical
status: IMPLEMENTED
last_updated: 2026-10-12
---

# Remotes

## 2026-10-12 Optimization Update

Added server→client `SyncCurrencies({fishCoins, goldenYarn, battleTrophies}, revision)`; full SyncPlayerData now carries a separate revision argument, and GetPlayerData returns profile/revision. Client maintains separate profile/currency revisions to handle reordering. RequestGuard spacing protects adoption (1s), merge (0.25s), equip/assignment (0.2s), prestige (2s), battle (10s), expedition actions and selected reads (0.5s). Adoption requires proximity to the requesting player's own pad. Remaining world/status budgets and engine latency tests are open. See [[Technical/Optimization Pass 2026-10-12]].

---


NetworkUtil creates server remotes under `ReplicatedStorage.CatEmpireRemotes`;
clients wait for them. It does not itself validate, rate-limit, or authorize requests.
See source signatures and [[Technical/File Inventory]] for the current dependency index.

| Remote | Kind / owner | Intent |
|---|---|---|
| GetPlayerData / SyncPlayerData | Function / Event, PlayerDataService | Request own cached profile / server sends full profile |
| AdoptCat | Function, CatService | Spend server-derived 50 coins and roll cat |
| MergeCats | Function, CatService | Merge two owned UUIDs |
| EquipCat / SyncEquippedPet | Function / Event, CatService | Equip selection / notify clients of pet |
| AssignStationWorker / OpenStationAssignment | Function / Event, TycoonService | Set worker by station/UUID / open worker UI |
| CatAdoptedCeremony | Event, TycoonService | Server informs client which cat to present |
| RequestPrestige | Function, PrestigeService | Reset eligible sanctuary for computed yarn |
| GetExpeditionStatus / StartExpedition / ClaimExpedition | Functions, ExpeditionService | Inspect/dispatch/claim by mission ID |
| GetArenaDivisions / StartArenaBattle | Functions, CombatService | Inspect fixed NPC leagues / simulate by division ID |
| UnlockWorld / TravelWorld / OpenWorldTravel | Functions / Event, WorldService | Unlock/visit realm / open travel UI |
| CatParadeEvent | Event, ParadeService | Announce parade start/end |

Known gaps: server request throttling and reward reservations are absent on key
valuable remotes; direct AdoptCat has no proximity check; merge does not reject
assigned inputs. Keep reward amounts server-derived and add ownership/state/length/
proximity/cooldown checks as applicable. Existing GUI clicks provide no trust boundary.
See BUG-008/009 and [[Technical/Security]].


## 2026-10-12 — Turn battle contract update
StartArenaBattle(divisionId) now returns `{success,message,battle}`; GetArenaDivisions includes `activeBattle`. BattleAction(battleId,revision,kind,index) accepts move1–4,switch healthy team index,or forfeit. Server rejects mismatched session/stale revision/invalid inputs and rate-limits. OpenRealmBattle is server→client presentation; client still requests authoritative start, which verifies current unlocked realm. No client currency/stat fields accepted. World unlock/travel existing names unchanged; added request guards/atomic unlock.

## 2026-10-13 — monument categories
`GetServerLeaderboard` (RemoteFunction, LeaderboardService): no payload; returns only connected, ready profiles as `{userId,name,username,trophies,collection,coins}[]`. Collection and coins are saved discovery/earnings counts, not inventory length/current balance. Read-only; one-second per-caller throttle (nil when throttled). Client polls every five seconds and sorts the selected tab locally. See [[Systems/Leaderboards]].


## 2026-10-13 — Login Rewards
- `ClaimLoginReward` (RemoteFunction, client to server, no arguments): returns `{ success, message, day?, catId? }`. Server decides eligibility from its own clock and the saved profile; spaced to one request per second.
- `AdminRequest` gained the owner-only actions `SkipGuide` and `ReadyLoginReward` (temporary).

- Later the same day: the `SkipGuide` admin action was removed again; `ReadyLoginReward` remains.


## 2026-10-14 — Catpedia
- `ClaimCatpediaRewards` (RemoteFunction, client to server, no arguments): returns `{ success, message, claimed? }`. Pays every reached, unpaid milestone in one transaction; one request per second.


## 2026-10-14 — PvP
- `PvPRequest` (RemoteFunction): `(action, payload)` with Status, Invite `{targetUserId, team}`, Respond `{id, accept, team}`, Cancel `{id}`, SetAccepting `{accepting}`, Act `{battleId, revision, kind, index}`, Forfeit `{battleId}`. Spaced per action (Invite every 2 s).
- `PvPUpdate` (RemoteEvent, server to client): `{kind = "invite" | "inviteClosed" | "battle", ...}`.

## 2026-10-14/15 — late night session
All of these are rate-limited per player, and all validation happens on the server.

| Remote | Kind and direction | Contract |
|---|---|---|
| `ClaimExploreRewards` | RemoteFunction, client to server, no arguments | Returns `{ success, message, claimed? }` |
| `GetEventStatus` | RemoteFunction | Cat Parade timing for the Events card |
| `ExploreNotice` | RemoteEvent, server to client | `(message, good)`; replies to cache prompts |
| `BuyCarrier` | RemoteFunction | `(carrierId)`; charges and gives the cat in one transaction, then fires `CatAdoptedCeremony` |
| `StartPracticeBattle` | RemoteFunction | `(uuid)`; one owned cat against a Training Dummy, no rewards. Turns go through `BattleAction`. |
| `PinCatpediaGoal` | RemoteFunction | `(catId \| false)`; a real species or false to clear |
| `SetCatKept` | RemoteFunction | `(uuid, kept: boolean)` |
| `SetFightTeam` | RemoteFunction, existing | Gained an optional `preset` argument (Solo / Boss / Friends) |
| `PartyRequest` | RemoteFunction, existing | Gained `Choose {worldId}` (leader only, a world they have unlocked) and `Ready {ready}` (members only, the target world must be unlocked). `Teleport {worldId, anyway?}` now returns `{ success = false, confirm = true }` while someone is not ready, unless `anyway` is true. The party view gains `target` and `members[i].ready`. |

Carrier caches use a ProximityPrompt, not a remote. The server checks the player is in that world and within 14 studs.

## 2026-10-15 — early morning session
All of these are server-validated and spaced.

| Remote | Kind | Contract |
|---|---|---|
| `TradeRequest` | RemoteFunction | `(action, payload)`. Actions: Status, SetMode `{mode}`, Request `{targetUserId}`, Respond `{id, accept}`, Offer `{uuids}`, Ready `{ready}`, Confirm, Cancel `{id?}`. Request every 3 s. |
| `TradeUpdate` | RemoteEvent, server to client | `{kind = "request" \| "requestClosed" \| "trade" \| "closed" \| "complete", ...}` |
| `BossRequest` | RemoteFunction | `(action)`: Status, Join, Attack. Attack is also limited to one a second by the event itself. |
| `BossUpdate` | RemoteEvent, server to client | `{kind = "state" \| "notice" \| "result", ...}`; the state is sent every 0.5 s |
| `TrainCat` | RemoteFunction | `(uuid, track)`; track is strength, toughness or agility |
| `StartArenaBattle` | RemoteFunction, existing | Gained an optional `boost` (might, tough, wind) |
| `AdminRequest` | RemoteFunction, existing | Gained `StartBossEvent`. Status now also returns `earlierLog`. |
| `GetEventStatus` | RemoteFunction, existing | Also returns `boss` (the boss event state) |

Join prompts (boss plinth) and the in-world trainers' Challenge prompts are ProximityPrompts checked on the server.

- `GetGlobalLeaderboard` (RemoteFunction): `(category, weekly)` returns the cached top 50 `{userId, name, score, rank}`, or nil for a bad board or when spaced out (0.5 s).
