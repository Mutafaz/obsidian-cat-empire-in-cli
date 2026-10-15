---
type: ideas
title: Battle Progression Overhaul
created: 2026-10-13
last_updated: 2026-10-14
status: PROPOSED
tags:
  - ideas
  - combat
  - economy
  - overhaul
---

# Battle Progression Overhaul

Linked from [[Chat Ideas]]. This is a proposed change in the game's main progression loop, not an implementation instruction. No game code, player data, Studio state, or existing system specifications were changed for this brainstorming entry.

**Later direction — 2026-10-14:** See [[Cooperative Battle Worlds]]. The user now proposes actual playable destinations reached together by solo players or parties, with fights and item/carrier discoveries along the route. This supersedes the UI-only fight-node presentation below where inconsistent. Earlier encounter counts and numerical examples remain historical proposals, not implementation requirements; combat controls are still open.

**Confirmed navigation — 2026-10-14:** **Explore = PvE**, including world selection, solo/co-op adventures, NPC fights, discoveries, and world bosses. **Battle = PvP**, including player challenges and a possible later ranked mode. The combined Battle-tab recommendation below is historical; this newer division takes precedence. The proposed Worlds/Arena renames were not selected.

## Original request

> add an idea thing that overhauls the game in the fact that instead of each cat gives money you do the battle tab where you can fight other players and challenge their cats or the the preloaded map of fights and bosses. Idk this one you will have to kinda help me with

## Main direction

Cats provide battle power and team choices rather than earning passive money merely by being owned or assigned. The player earns the main progression currency by completing fights and bosses, then spends it on carriers, training, and the sanctuary.

**Proposed loop:** Choose cats → win battles → earn Fish Coins → buy a carrier or upgrade → merge/build a stronger team → unlock harder fights.

Trading, the carrier store, the home, login rewards, leaderboards, IVY, and Melman & Julian retain their purposes. The main overhaul is the source of recurring income. A player should not need another player online to earn coins or buy the next carrier.

## Recommended Battle tab

| Page | Purpose | Proposed rewards |
|---|---|---|
| **Fight Map** | A prepared progression route of NPC trainers, stronger encounters, and bosses | Fish Coins; larger first-clear and boss rewards; selected cat-only carrier milestones |
| **Challenge Players** | Send another player an invitation to fight their selected cats | Friendly result and rematch; no farmable currency or ranked trophies |
| **Server Boss** | See the current/next shared spawn event and join it | The participation-based prizes already proposed in idea 002 |

The default page is Fight Map, with **Continue your next fight** prominent. Show the selected team across the bottom so players can change it before committing to a fight.

An optional **Ranked** submode under Challenge Players can come later: match willing players with similar team power, award battle trophies from verified results, and keep it separate from direct friendly invitations. It is not necessary for the first playable version of this concept.

## Team and fight format

Recommended starting format: **three collection slots**, one active cat on each side, and short turn-based move selection. This builds on the existing battle style instead of requiring every cat to have a new real-time combat system. Players choose moves, guard, rest where available, or switch to another healthy cat. Aim for ordinary fights around one to two minutes; bosses can be longer.

Melman & Julian occupy one of those three slots together. IVY has her own type/rarity and stays the strongest collectible at comparable upgrades. Their exact combat actions and the duo's health/action model still require a separate decision; one slot does not automatically authorize two independent turns.

The selected three cats should be the player's choice, not always an automatic selection of the highest-power inventory entries. Snapshot the team at the start of an encounter, preventing mid-fight trading, merging, or upgrading from changing an already-running battle.

For a first release, use a small shared set of understandable moves rather than promising 1,000 individually designed move kits. Raw rarity/power determines potential, while choices such as guarding, switching, and opponent patterns give the player something meaningful to do.

The cooperative spawn boss can keep the separately proposed real-time format. That is an explicit second encounter mode, not a claim that turn-based fights and real-time raids are one existing system. If building both proves too large later, choose one first; do not silently drop the shared event.

## The preloaded fight map

Prepare encounters in advance. Each node has a named trainer or boss, a fixed enemy team, recommended power, a reward preview, and unlock conditions. It is a curated progression route, not random enemies silently scaled to negate stronger cats.

Recommended initial structure: **four chapters of eight encounters each**, with a small first version built around chapter one only:

- Six ordinary trainer fights.
- One stronger trainer encounter.
- One chapter boss.

Examples of route labels: **Starter Trail**, **Garden Path**, **Riverside Route**, and **Championship Grounds**. These are UI chapter-label suggestions, not approved new explorable worlds or asset requirements.

Show completed nodes with a check, the next fight with a clear highlight, and future nodes locked along a visible path. Selecting a node shows the enemy cats, approximate difficulty, and both first-clear and replay prizes. Winning the chapter boss unlocks the next chapter and access to a higher-power carrier tier; players still buy carriers from the spawn store.

Example chapter-one structure and coin rewards, purely for tuning discussion:

| Node | Encounter | First-clear total coins | Replay coins |
|---|---|---:|---:|
| 1 | Practice trainer | 20 | 10 |
| 2 | Trainer fight | 30 | 15 |
| 3 | Trainer fight | 40 | 20 |
| 4 | Trainer fight | 50 | 25 |
| 5 | Trainer fight | 60 | 30 |
| 6 | Trainer fight | 70 | 35 |
| 7 | Stronger trainer | 100 | 50 |
| 8 | Chapter boss | 200 + one Starter Carrier | 100; no repeat milestone carrier |

The first-clear column is the **total** reward for that first win, not an additional payment on top of the replay amount. First-clear/milestone bonuses are saved once. Later chapters can offer larger rewards only after carrier prices, power progression, and expected fight times are balanced together. No later-chapter coin curve is fixed here.

Allow replay of cleared nodes for reliable income. Better teams can earn more by taking harder fights, but low-level players always retain an accessible earning route. Do not force them to purchase a carrier to recover from a loss. An ordinary completed loss grants no coins in this starting proposal; there is no entry fee, coin deduction, consumed cat, or paid revive. Cats recover for the next fight.

## Player challenges

1. Select a player at spawn or in the Battle tab and choose **Challenge**.
2. Show both proposed teams and power before they accept, with no hidden wager.
3. Both players confirm their teams; the fight starts only when both are ready.
4. Fight under the same short turn-based rules as the trainer map.
5. Show the winner, each team's surviving cats, and **Rematch / Return to Spawn**.

Requests can be declined, ignored, or disabled. A friendly challenge does not grant repeatable coins or ranked trophies, avoiding easy reward farming between cooperating accounts. Do not transfer the losing player's cats or money. Winning a challenge is not a trade.

If Ranked is added later, use matched opponents and account for team power, record disconnect/forfeit outcomes, and award trophies through the server. Do not compare a starter team with IVY and call it a fair match. Timers and disconnected-player rules must be stated before the fight. Exact rating math, rewards, and power brackets remain undecided.

## Map bosses versus the spawn boss

| Boss kind | Who fights it | When it appears | Progression role |
|---|---|---|---|
| Chapter/map boss | One player's selected team against a prepared NPC encounter | Available after the chapter's prerequisite nodes | Unlock next chapter; one-time milestone reward; smaller repeat coins |
| Spawn/server boss | Opted-in players in that server cooperate | The scheduled rotating event from idea 002 | Shared event prizes and boss-event leaderboard credit |

Map bosses do not need to wait for a server event. The scheduled boss remains an enjoyable group activity rather than the only route to progression. Do not automatically copy raid HP into a three-cat turn-based fight; each mode needs its own balancing.

## Economy and progression implications

- **Recurring coins:** Completed map fights and boss events. Starter/login rewards supplement those earnings rather than replacing them.
- **Spending:** Carrier purchases, chosen cat upgrades, and sanctuary toys/decorations. Carriers still contain cats only.
- **Collection:** The 1,000-entry catalog stays a proposed collection list. Rarity and upgrades determine battle potential; the earlier power scores are not boss DPS or a finalized attack formula.
- **Merging:** The proposed carrier/merge routes remain collection progression. Avoid a recipe that silently destroys the only team needed to earn coins; preview the remaining usable team and protect favorites/special cats. Training carryover/refunds remain an explicit open rule.
- **Home:** A place to see cats, decorate, and train. Existing worker stations/passive-production pads would need a separately planned replacement or retirement; do not delete them in this ideas chat.
- **Golden Yarn/Rebirth:** The existing tycoon reset/income bonus needs redesign if passive income ends. Recommended first step is to keep this overhaul independent of a new rebirth scheme, preserve earned balances, and decide its battle-era purpose before implementation. Do not assume the old income multiplier or station reset makes sense unchanged.
- **Trophies:** Use ranked player battles for future competitive trophies. Map progression should award coins and completion progress, not inflate a PvP rank. Existing trophies already awarded by PvE require a migration decision; do not wipe or relabel historical balances without one.
- **Leaderboards:** Keep Team Power, Collection, and Coins Earned. Add or consider **Highest Map Node Cleared** for campaign progress. Keep server-event Boss Wins/Damage separate from ordinary map-boss farming. A future ranked trophy board should have a clearly defined starting season/migration.

## Example first session

Open a free starter carrier → choose the starter cat → win the practice node → earn coins → replay an easy node or advance → buy another carrier from the spawn store → assemble up to three slots → train or merge → defeat the first chapter boss → unlock the next route.

The first encounter must be beatable with the guaranteed starter. Rewards/prices must permit at least one useful early purchase without depending on a lucky drop. No progression gate should require IVY or the duo. They are aspirational special cats, not mandatory keys to completing the map.

## Suggested scope for a later implementation

First: one eight-node map chapter, explicit team selection, completed-win rewards, saved node progress, one-time first clears, and the loop back to the carrier store.

Next: consenting-player challenges, more prepared chapters, and integration with the separately planned spawn boss. Ranked matchmaking can follow once real two-player fights and reward integrity are verified. This ordering is a recommendation, not permission to start implementing it.

## Return-to checks before building

- Reopen [[Owner Admin Revamp and Security Review#Security Review — return-to checkpoint]] for rewards, team reservations, profile saves, duplicate payouts, admin provenance, and leaderboard rules.
- Plan the removal/replacement of passive income, station persistence, old onboarding steps, prestige/reset behavior, and existing trophy semantics together. Preserve current player collections, currencies, and history.
- Ensure a free starter can earn coins, losses do not create a softlock, cleared nodes remain replayable, and time-limited server bosses are optional.
- Test first-clear rewards once, repeat-win rewards, forfeits, disconnects/rejoins, concurrent trade/merge requests, and delayed or failed saves.
- Test a friendly challenge with two consenting clients; do not call NPC encounters PvP.
- Keep historical idea 002 boss values and catalog power bands labeled as sample values until both fight modes are balanced.

## Context and verification status

Read current `CombatService.luau`, `CombatController.luau`, `BattleDefinitions.luau`, and the passive-income loop in `TycoonService.luau`, alongside [[Systems/Combat]], [[Systems/Production]], [[Systems/Prestige]], and the current idea/catalog notes. The inspected combat path contains NPC sessions and move selection; it does not establish implemented player matchmaking. Passive income still exists in the inspected source. Earlier system-note tables may describe historical behavior; source reading is not a live playtest.

The idea notes were found in their current `Ideas/` folder after the project tidy-up. No copies were recreated at their old paths. Only this concept note and the idea index were edited for this request. No new mockup, gameplay code, runtime tests, asset generation, or economy changes occurred.
