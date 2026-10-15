---
type: system
id: SYS-EXPLORE-BATTLE
title: System Specification — Explore (PvE) and Battle (PvP)
created: 2026-10-14
last_updated: 2026-10-15
status: PHASE 1 BUILT; PHASES 2-3 PARTLY BUILT (2026-10-14/15)
dependencies:
  - "[[Systems/Combat]]"
  - "[[Systems/Worlds]]"
tags:
  - system
  - combat
  - pvp
  - pve
---

# Explore (PvE) and Battle (PvP)

## Original request
> im changing the premise of the explore button and battle button can you read it in chat idea i believe line 458

then: "can u implement the idea?" The idea is entry 008 in [[Chat Ideas]] ("Explore = PvE, Battle = PvP", keeping both button names) with the detail in [[Cooperative Battle Worlds]].

## Phases
The full idea is several builds of work, so it is split. Phase 1 exists. The late night session added parts of phases 2 and 3; see the sections below and [[Late Night Session]].

| Phase | Content | State |
|---|---|---|
| 1 | Battle becomes friendly PvP challenges; PvE fights (Starter Trail, world rivals) move under Explore | **Built 2026-10-14** |
| 2 | Fights placed inside the worlds (NPC trainers you walk up to), carrier caches to discover, a boss per world | **Partly built:** a rival fight in every world (new Sky Guardians boss for Cloud Kingdom) and carrier caches in five worlds. Not built: NPC trainers you walk up to |
| 3 | Parties: invite one or two friends, ready up and travel together; enemy health x1.5 / x2 for 2 / 3 trainers; personal loot | **Partly built:** parties of up to 4, invites, leader teleport and a ready check. Not built: shared co-op fights, enemy scaling, personal loot |
| 4 | Combat style decision: keep turn-based (current engine) or build real-time co-op (the assistant's recommendation in [[Cooperative Battle Worlds]]) | Waiting on the user |

## Battle = PvP (phase 1)
- The Battle side button opens a new window (`BattleController`): **Challenge a player** lists everyone else in this server (with "In a battle", "Not taking challenges" or "Has no cats yet" where it applies); **Your team** picks 1 to 3 of your cats (strongest three until you choose); **Taking challenges: ON/OFF**.
- A challenge shows a popup on the other player's screen for 30 seconds: Accept (with their current team) or Decline. The challenger can withdraw it.
- The duel uses the existing turn engine: each turn both trainers choose a move or a switch; switches happen first, then attacks in speed order (an exact speed tie is a coin flip). A trainer who has not chosen within 30 seconds gets an attack chosen for them. Forfeit needs two presses. Leaving the server hands the win to the other player. A battle longer than 15 minutes ends as a draw.
- **Friendly only: no coins, yarn or trophies change hands**, as the idea note asks, so two accounts cannot farm each other. Ranked PvP is a possible later mode.
- Cats in a battle are reserved: they cannot be merged, and their owner cannot start a Fight Map or rival fight until it ends (and the reverse).
- Server: `PvPService` (RemoteFunction `PvPRequest` with Status / Invite / Respond / Cancel / SetAccepting / Act / Forfeit; RemoteEvent `PvPUpdate` pushes invites and turns). Engine: `TurnBattle.newVersus`, `stepVersus`, `validVersusAction`, `defaultAction`.

## Explore = PvE (phase 1)
- The Explore window is the PvE hub: a **Starter Trail** card at the top (Codex's eight-fight chapter, opened from here instead of from Battle), then the worlds with unlock and travel as before.
- A world with a rival team shows **"You are here • Fight the …"** on its card while you are in it (Verdant Grove: Grove Keepers; Frostpeak: Frostpeak Watch). These are the existing rival fights; the in-world signs still start them too.
- The fight panel (`CombatController`) no longer has its own side button and is titled "Explore Fights". Its fight logic and rewards are unchanged.

## Verification
- Offline (`tools/core_fixture.luau`, 40 new assertions): challenges need a team of 1 to 3 distinct own cats; self, absent and switched-off targets refused; one open challenge per player; the target sees it; the challenger cannot accept their own; expiry; decline; accepted battle views oriented to each player; no new challenge mid-battle; battle cats cannot be merged; one action does not resolve a turn, a second action in the same turn is refused, the other trainer's action resolves it exactly once; turn timeout resolves; forfeit closes the battle for both; no coins or trophies paid; leaving mid-battle ends it and frees the opponent; the engine: faster cat strikes first, switches before attacks, an invalid action is blamed on its side, the timeout action is a move. `tools/validate_project.py`: 72 files compile, 599 core and 80 Fight Map assertions pass.
- Studio Play, solo, 2026-10-14: Battle window opened with "Nobody else is in this server yet", the team defaulted to the strongest three, the challenges switch went OFF and back ON; a self-challenge sent to the server was refused. Explore showed the Starter Trail card; OPEN THE TRAIL opened the fight panel; after unlocking and travelling to Verdant Grove its card read "You are here • Fight the Grove Keepers" and started a real fight with four move buttons. No script errors.
- **Not verified: an actual duel.** Studio's test tool here runs one player only, so the invite popup, the duel screen, timeouts with real clients and the result screen have never been seen on screen. A two-player test (Studio "Start" with 2 players, or a live server) is needed. Also unverified: phones.

![[Assets/Previews/EXPLORE-BATTLE/r1-battle-pvp-lobby-solo-studio.png|640]]
![[Assets/Previews/EXPLORE-BATTLE/r1-explore-hub-studio.png|480]]
![[Assets/Previews/EXPLORE-BATTLE/r1-explore-in-verdant-grove-studio.png|480]]
![[Assets/Previews/EXPLORE-BATTLE/r1-explore-rival-fight-studio.png|480]]
Actual Studio Play captures, 2026-10-14, solo, 1096x635.


## Explore window rebuild (from Claude Design, 2026-10-14)
`WorldController` was rebuilt from the Claude Design "Explore" artboard. The source is saved at `design/claude-design/explore-r1/`.
- **Modes** (left): All Worlds, Story Worlds, Boss Battles, Arena PvP (opens the Battle window), Events, and **CREATE TEAM**. Events shows a Cat Parade card with a live countdown, from the server's `GetEventStatus`.
- **Select World** (middle):
  - painted cards for unlocked worlds (oasis, grove, frost, cyber, temple and cloud scenes);
  - locked "?" cards showing their yarn price;
  - a **SHOW LOCKED** switch;
  - the TOTAL UNLOCKED bar with the next milestone;
  - **COLLECT REWARDS**, hanging under the window.
- **World & Party** (right):
  - tier rosette, portal, world text and rewards;
  - four party circles with headshots;
  - INVITE FRIENDS and SHOW LOOT;
  - the big **TELEPORT & BATTLE!** button. Its text says what pressing it does: UNLOCK FOR FREE, UNLOCK n YARN, BATTLE!, TELEPORT & BATTLE! or WAITING FOR LEADER.
- **Explore milestones** (`ExploreDefinitions.milestones`, placeholder values) are paid by `ClaimExploreRewards` in one transaction:

  | Milestone | Reward |
  |---|---|
  | 2 worlds unlocked | 150 coins |
  | 4 trail fights cleared | 200 coins |
  | 8 trail fights cleared | 1 yarn |
  | 4 worlds unlocked | 2 yarn |
  | 6 worlds unlocked | 3 yarn |

- **Every rival now has a world.** A rival fight only starts while you stand in its world.

  | World | Rival |
  |---|---|
  | Oasis | Alley Prowlers |
  | Verdant Grove | Grove Keepers |
  | Frostpeak | Frostpeak Watch |
  | Cyber City | Cyber Syndicate |
  | Ancient Temple | Celestial Coliseum |
  | Cloud Kingdom | **Sky Guardians** (new boss) |

  Sky Guardians recommends Lv 8 and pays 3,000 coins, 250 trophies and 2 yarn (placeholder numbers).

## Results screen (Chat Ideas 007 #4)
After a fight the screen shows a headline (VICTORY!, DEFEAT or DRAW), what was earned, and a clear next step:

| Fight | Buttons |
|---|---|
| Starter Trail | PLAY AGAIN, NEXT FIGHT, TRAIL MAP |
| Rivals | FIGHT AGAIN, BACK TO EXPLORE |
| Practice | PRACTICE AGAIN, CLOSE |

## Carrier caches (phase 2 start)
- **Where:** a small chest beside the arrival point of five worlds. The home oasis has none; it has the adoption box instead.

  | World | Carrier rolled |
  |---|---|
  | Verdant Grove | Starter |
  | Frostpeak | Cozy |
  | Cyber City | Cozy |
  | Ancient Temple | Royal |
  | Cloud Kingdom | Starlight |

- **How:** hold E (0.5 s) to open. Each world's cache gives one cat a day, rolled like that carrier.
- **Server rules:** you must be in that world and within 14 studs. The cat and the time are saved together (`caches` in the profile), then the NEW CAT reveal shows.
- SHOW LOOT lists the cache and whether it is ready.
- **Bug found and fixed 2026-10-15:** the chest's prompt never appeared. The lid, band and lock parts covered the chest's centre and blocked the prompt's line-of-sight check, so those parts are now not queryable.

## Saved team presets (Chat Ideas 007 #1)
- CREATE TEAM has three preset tabs: **SOLO, BOSS, FRIENDS** (`FightMapDefinitions.LOADOUTS`).
- **Using it:** tap a tab to load it and pick cats. Then **SAVE AS BOSS TEAM** saves both the preset and the active team.
- **Missing cats:** loading a preset never swaps in other cats. Cats no longer owned are left out, and the player is told how many ("1 cat in your Boss team is no longer yours…").
- **Storage:** saved as `teamLoadouts` (preset name → cat ids) through the existing `SetFightTeam(ids, preset?)`.

## Party ready check (Chat Ideas 007 #3)
- **The leader chooses:** their selected world becomes the party's destination. `PartyRequest` "Choose" is sent half a second after they stop clicking.
- **Members get ready:** they see LEADER PICKED <world> and press **I'M READY!** ("Ready"). A member can only be ready for a world they have unlocked.
- **Choosing another world** clears everyone's ready. Ready is also cleared after each teleport.
- **On screen:** party circles have a gold ring for the leader, green when ready and blue while still choosing. The title reads PARTY (3/4) • 2/3 READY.
- **Not a lock:** if someone is still choosing, the leader's TELEPORT names who, then turns into **GO ANYWAY?** for five seconds. A second press travels.

## Practice (Chat Ideas 007 #8)
- **PRACTICE** on the MY PETS showcase starts a fight with that one cat against a **Training Dummy**: a Grey Shorthair model with 3x your cat's health and attack 1.
- No coins, trophies or yarn, and no team cooldown.
- The cat is reserved during the fight, so it cannot be merged meanwhile.
- Remote `StartPracticeBattle(uuid)`. Turns use the normal `BattleAction`.

## Verification — late night session
- **Offline:**
  - `tools/validate_project.py` now also runs `luau-analyze` to find unknown names. It found nothing new, but it would have caught the Catpedia bug fixed tonight.
  - Final run: 78 files compile, 0 unknown-name problems, 844 core and 80 Fight Map assertions pass.
  - New test blocks:
    - caches: once a day, only in their world, and Cloud Kingdom's Epic floor;
    - every world has a fight, and Sky Guardians starts;
    - practice: no rewards, dummy stats, the reservation released, no cooldown, forfeit;
    - presets: an unknown name refused, a preset saved as the active team too, a plain save leaving presets alone, cats you do not own refused, and save-format checks;
    - ready check (14 assertions): the confirm, clearing on a new choice, unlocked worlds only, a solo player refused.
- **Studio Play, solo:**
  - the whole Explore window: home, a locked card, unlocking, collecting, loot, and the team picker;
  - teleporting into Verdant Grove, which opened the Grove Keepers fight, and the Arena PvP shortcut;
  - the Events card text "CAT PARADE • ON NOW! 0:51 left";
  - practice from Pets: 4 moves used, then forfeit, PRACTICE AGAIN and CLOSE;
  - presets saved, loaded, and shown above the cat rows;
  - the Verdant Grove cache opened through its real prompt and gave one cat, after the fix.
- **Not verified:**
  - the ready check and parties with real players, which needs two clients;
  - GO ANYWAY on screen;
  - caches in the other four worlds;
  - the second-day refill (offline tests only);
  - phones.

![[Assets/Previews/EXPLORE-BATTLE/2026-10-14-r2-ex_home.png|480]]
![[Assets/Previews/EXPLORE-BATTLE/2026-10-14-r2-ex_loot.png|480]]
![[Assets/Previews/EXPLORE-BATTLE/2026-10-14-r2-ex_team.png|480]]
![[Assets/Previews/EXPLORE-BATTLE/2026-10-14-r2-ex_teleport_fight.png|480]]
![[Assets/Previews/EXPLORE-BATTLE/2026-10-14-r3-practice-fight.png|480]]
![[Assets/Previews/EXPLORE-BATTLE/2026-10-14-r3-practice-result.png|480]]
![[Assets/Previews/EXPLORE-BATTLE/2026-10-14-r3-team-preset-loaded.png|480]]
![[Assets/Previews/EXPLORE-BATTLE/2026-10-14-r4-team-presets-on-top.png|480]]
![[Assets/Previews/EXPLORE-BATTLE/2026-10-14-r4-loot-cache-row.png|480]]
![[Assets/Previews/EXPLORE-BATTLE/2026-10-15-r4-cache-chest-grove.png|480]]
![[Assets/Previews/EXPLORE-BATTLE/2026-10-15-r4-cache-opened.png|480]]

These are actual Studio Play captures from 2026-10-14/15, solo, at 1096x635. The r3 preset capture shows the tabs below the cats; r4 shows the fix.

## 2026-10-15 — trainers in the worlds and fight boosts (Early Morning Session)
- **Rival trainers you walk up to** (phase 2):
  - every rival world now has its rival team's strongest cat standing on a podium, with the team's name, recommended level and a **Challenge** prompt;
  - Verdant Grove and Frostpeak: the cat replaces the old block figure on their podium;
  - Cyber City, Ancient Temple and Cloud Kingdom: a new podium beside the arrival point;
  - the prompt opens the same fight as Explore.

  Studio: five trainers placed, and the Cyber City prompt opened the fight. The other worlds' trainers were seen only by name.
- **Fight boosts** (007 #5, temporary run choices), for one fight only:
  - before a rival fight you choose **MIGHT** (+10% attack), **TOUGH** (+15% health) or **SECOND WIND** (+1 Rest use), or **NO BOOST, JUST FIGHT**;
  - the server applies the choice (`StartArenaBattle(division, boost?)`), and the fight's status line names it;
  - values are placeholders.

  Offline: an unknown boost refused, each effect applied, the rival unaffected, the cat unchanged afterwards. Studio: the picker, and TOUGH raising a Bengal Ember from 284 to 327 HP.
- **Spawn boss** in EVENTS: see [[Systems/Boss Event]].

![[Assets/Previews/EXPLORE-BATTLE/2026-10-15-r5-fight-boost-picker.png|480]]
![[Assets/Previews/EXPLORE-BATTLE/2026-10-15-r5-fight-with-tough.png|480]]
![[Assets/Previews/EXPLORE-BATTLE/2026-10-15-r6-trainer-grove.png|480]]
![[Assets/Previews/EXPLORE-BATTLE/2026-10-15-r7-trainer-cyber-sign-raised.png|480]]

These are actual Studio captures. In r6 the character partly hides the Grove trainer. In r7 the camera angle puts the raised sign behind the parade bar.
