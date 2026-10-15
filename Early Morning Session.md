---
type: session-record
title: Early Morning Session
created: 2026-10-15
last_updated: 2026-10-15
session: 2026-10-15, after the Late Night Session
agent: Claude (Claude Code)
status: COMPLETE — nothing committed
tags:
  - session
  - history
  - review
---

# Early Morning Session

## The request
> do the same thing and put it in early morning session going until u run out of usage

"The same thing" is the [[Late Night Session]] request: implement as many [[Chat Ideas]] as possible, easier ones first, keep the vault updated, and record what was done and what could have been done better.

Everything is in the working tree on `master`, on top of `b540a2b`, together with the late-night work. **Nothing was committed.**

---

## What was done

| # | Feature | Chat idea | Note |
|---|---|---|---|
| 1 | **Trading at spawn:** request prompt over nearby trainers, 4 cats a side, READY → 5 s review → CONFIRM, all-or-nothing two-profile exchange, receipts, Trade requests ON / FRIENDS ONLY / OFF | 002 A | [[Systems/Trading]] |
| 2 | **Spawn boss event:** 4-boss rotation every 15 min, arena in the spawn plaza, JOIN, ATTACK (F), marked Pounce / Paw Sweep / Stomp, knockouts, prizes for every eligible trainer once per slot, owner test start | 002 B | [[Systems/Boss Event]] |
| 3 | **Boss opening windows:** double damage for 2.5 s after each move lands | 007 #6 | [[Systems/Boss Event]] |
| 4 | **Spawn boss in Explore → EVENTS** next to the Cat Parade | 002 B | [[Systems/Boss Event]] |
| 5 | **Boss Wins and Team Power boards** | 002 C | [[Systems/Leaderboards]] |
| 6 | **This Week view** (Monday 00:00 UTC) and a **YOU: #rank** row | 002 C | [[Systems/Leaderboards]] |
| 7 | **Fight boosts:** MIGHT / TOUGH / SECOND WIND before a rival fight, for that fight only | 007 #5 | [[Systems/Explore and Battle]] |
| 8 | **Saved owner audit log** and an **overall request budget** per player | Owner revamp checklist SEC-11, SEC-04 | [[Systems/Owner Panel]] |
| 9 | **Upgrade map** per cat: Strength, Toughness, Agility, bought with coins; kept through merges and trades | Home / sanctuary ("map of upgrades, including strength") | [[Systems/Upgrade Map]] |
| 10 | **Rival trainers in the worlds:** the rival team's lead cat on a podium with a Challenge prompt in all five rival worlds | 008 phase 2 | [[Systems/Explore and Battle]] |
| 11 | **Global leaderboards:** THIS SERVER / GLOBAL TOP 50 on the monument, OrderedDataStores, cached reads | 002 C | [[Systems/Leaderboards]] |
| 13 | **Trade journal:** trades commit through a DataStore record covering both players, and are applied on the next load after a crash | (trading safety) | [[Systems/Trading]] |
| 12 | **Regression sweep:** all nine HUD windows opened with no script errors; the Owner Panel cat grid overflow found and fixed | — | [[Systems/Owner Panel]] |

**Supporting changes:**
- `PlayerDataService:UpdatePair` (two profiles changed together or not at all) and `SaveNow`;
- `CombatUtil.calculateStats` takes a cat's upgrades;
- `LeaderboardUtil` has weeks;
- `UITheme` is unchanged; `RequestGuard` has the budget;
- new saved fields are listed in [[Technical/Data Schema]], new remotes in [[Technical/Remotes]].

### Not done, and why
| Idea | Why not |
|---|---|
| **Sanctuary toys** | They are new 3D objects. The project rule (2026-10-13) says new 3D assets are modelled in Blender and imported, and importing uploads assets to Roblox, which needs your approval. I did not want to repeat last night's native-part stopgap. |
| **Visiting the home sanctuary** | Its layout and access are undecided. |
| **IVY and Melman & Julian** | Their looks must follow your own cats. |
| **Shared co-op fights with party scaling** | A big design step (one fight, several trainers, turn order), and it depends on the combat-style decision. |

---

## How it was checked
- **Offline:** `tools/validate_project.py`.
  - At the start of this session: 844 core assertions.
  - At the end: **89 files compile, 0 unknown-name problems, 987 core and 80 Fight Map assertions pass.**
  - New test blocks: trading (51), boss event (36), opening windows (5), fight boosts (6), request budget and saved log (6), upgrade map (11), Team Power (7), weeks (6), global boards (7), trade journal (9).
- **Studio Play, solo** (1096x635), with captures in `Assets/Previews/` (TRADING, BOSS-EVENT, UPGRADE-MAP, EXPLORE-BATTLE, LEADERBOARD, PETS):
  - **trading:** a self-request refused; the Settings row cycled and saved; the window, popup and receipt drawn from **mock data**, clearly labelled, because a second player was not available;
  - **boss:**
    - an owner test fight from warning to victory, paying 110 coins and a carrier cat;
    - a **real scheduled** Tuxedo Captain fight at 15,000 HP;
    - knockouts, the Stomp warning on the ground, the HUD states, the arena sign countdown, the EVENTS card;
  - **upgrade map:** steps bought through its own buttons, matching the saved data and coins;
  - **boosts:** the picker, and TOUGH's health;
  - **trainers:** five placed; the Cyber City prompt opened the fight;
  - **leaderboard:** five tabs on the monument.
- **Bugs found in Studio and fixed:**
  1. The boss model was so big the camera sat inside it.
  2. The HUD said "in 0:00" between events.
  3. The arena sign never showed the idle countdown (`Tick` returned early).
  4. A Luau if-expression with a stray `end` broke compilation.
  5. The boss banner covered the middle of the screen everywhere. It now shows only near the arena between events.
  6. Trade card text was hard to read.
  7. The trainers were too small and their signs overlapped their ears.
8. **Found by a regression sweep:** the Owner Panel's species grid overflowed with 15 species and hid the last cats. Fixed to scroll. The sweep opened all nine HUD windows (Pets, Explore, Battle, Shop, Catpedia, Rebirth, Owner, Settings, Rewards) in one Play session with **no script errors**.

---

## What could have been done better
1. **Trading shipped with a data hole first, and got fixed later.** Trading was built and documented with a known crash-between-saves risk. A trade journal was added afterwards in the same session (trades now commit through one record and recover on load). The right order was the journal first. A tiny residual edge remains, written down in the Trading note, and none of this has met a real DataStore crash.
2. **More multiplayer features with no multiplayer test.** Trading, the boss with several trainers, parties and PvP are all offline-tested only. Tonight added two more to that pile. A two-player Studio session should have been the first thing done, not the tenth.
3. **Mock renders.** The trade window screenshots use made-up data pushed from the server. They show that the layout works, not that a trade works. They are labelled MOCK in file names and captions, but they are easy to misread at a glance.
4. **The boss arena is not "in the middle of spawn".** The proposal asked for the centre; the centre is the sphinx monument. I chose the open north-west quarter of the plaza without asking. That was reasonable to keep moving, but it is a visible design decision that is yours.
5. **More invented numbers.** These are all placeholders, and the list of things for you to decide grew again:
   - boss damage = team attack;
   - upgrade costs and bonuses;
   - boost values;
   - the 60-requests-per-10-seconds budget;
   - the 15-minute boss cadence (taken from the proposal, but untested).
6. **The request budget could bite real players.** It is generous on paper, but no real session with many windows open has been measured. If something starts saying "Please wait a moment" for no clear reason, this is the first suspect.
7. **Studio testing friction cost time:**
   - joining in the same step as teleporting failed, because the server had not seen the move yet;
   - the camera kept facing away from what I wanted to capture, which took three tries;
   - Studio's command bar loads its own copy of server modules, so one mock test failed.

   These are now written into the continuation guide.
8. **The upgrade map took on part of an undecided idea.** The sanctuary idea says its upgrade rules are undecided; I picked tracks, costs and bonuses myself. It is easy to change, but it is gameplay you have not agreed to yet.
9. **A test that looked like a bug.** The global board stayed empty in Studio because my test cat was an owner grant, which the boards deliberately ignore. I spent two runs and a debug print before seeing it. Test data should go through the same paths a player would use (here, buying a carrier).
10. **The files keep growing.** `WorldController.luau` (over 1,400 lines) and `CombatController.luau` picked up more. I kept new features in new files where I could (Trade, Boss, Training), but did not split the old big ones.

## Decisions waiting for you
- **Trading:** test it with two players before going live. Should owner-granted cats be tradable (today: yes, keeping their marking)?
- **Boss:**
  - the arena's place;
  - the 15-minute cadence;
  - the damage formula;
  - prizes;
  - whether a short disconnect should keep a prize.
- **Upgrade map:** keep it? Costs, bonuses, and whether it belongs in a sanctuary building.
- **Fight boosts:** keep them, and are the three choices right?
- **Toys:** go ahead with Blender models and importing (an asset upload)?
- Everything listed in [[Late Night Session]] under decisions.

## Files touched this session
- **New:**
  - `src/server/Services/GlobalLeaderboardService.luau`, `src/server/Modules/TradeJournal.luau`
  - `src/shared/TradeDefinitions.luau`, `src/shared/BossDefinitions.luau`, `src/shared/TrainingDefinitions.luau`
  - `src/server/Services/TradeService.luau`, `BossEventService.luau`, `TrainingService.luau`
  - `src/client/Controllers/TradeController.luau`, `BossController.luau`, `TrainingController.luau`
- **Changed:**
  - `PlayerDataService`, `CombatService`, `ExploreService`, `CatService`, `AdminService`, `ParadeService`, `LeaderboardService`
  - `RequestGuard`
  - `Types`, `CombatUtil`, `TurnBattle`, `BattleDefinitions`, `LeaderboardUtil`
  - `CombatController`, `InventoryController`, `SettingsController`, `AdminController`, `LeaderboardController`, `WorldController`
  - `tools/core_fixture.luau`, `tools/leaderboard_fixture.luau`, `tools/validate_core.py`
- **Vault:**
  - [[Systems/Trading]], [[Systems/Boss Event]], [[Systems/Upgrade Map]] (new)
  - [[Systems/Leaderboards]], [[Systems/Explore and Battle]], [[Systems/Owner Panel]]
  - [[Testing/Not Yet Tested]], [[Releases/Changelog]], [[Technical/Continuation Guide]], [[Technical/Data Schema]], [[Technical/Remotes]]
  - [[Chat Ideas]], [[Home]]
