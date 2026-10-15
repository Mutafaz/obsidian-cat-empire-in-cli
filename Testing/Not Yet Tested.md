---
type: test-record
title: Not Yet Tested
created: 2026-10-13
last_updated: 2026-10-15
status: OPEN
tags:
  - testing
  - checklist
---

# Not Yet Tested

One list of what has been built but not checked, as of 2026-10-13. Tick an item only when it has actually been run, and note where the evidence is. What *was* tested is recorded in each system's own note.

## Applies to everything built so far
- [ ] **Two or more players in one server.** Every Studio test so far was solo.
- [ ] **Phones and tablets.** No new window has been captured on a small or touch screen.
- [ ] **A live server with real saving.** All tests used Studio's in-memory save store; no real save, rejoin or server shutdown was exercised.
- [ ] **Roblox's strict type check.** The offline validator only checks that files compile and runs logic tests.

## Leaderboards (built by Codex) — [[Systems/Leaderboards]]
The user reports it works. Codex's own record: solo Studio only, tabs clicked with the mouse, scores matched.
- [ ] With other players: each viewer keeping their own tab, correct order and shared ranks with real scores, a player leaving disappearing from the board.
- [ ] Touch on a phone, and scrolling a long list.
- [ ] Real saved profiles moving to the new save format (version 3); checked offline only. Older profiles start "Coins earned" at zero by design.
- [ ] Owner Panel grants staying off the Collection and Coins boards, in Studio (offline only).
- [ ] Login reward coins currently count as "Coins earned": decide whether that is wanted.
- [ ] Review of Codex's code by Claude, promised when the work was split, not done yet.

## Battle (PvP) and Explore (PvE) — [[Systems/Explore and Battle]]
- [ ] **A real duel between two players**: the challenge popup, accept/decline, both choosing moves, the 30-second turn timer, forfeit, leaving mid-battle and the result screen. Only covered offline; Studio solo cannot run it.
- [ ] Two players challenging each other at the same moment; a challenge to someone who is mid-way through a Fight Map fight.
- [ ] Phone layout of the Battle window and the challenge popup.
- [ ] Frostpeak's "Fight the Frostpeak Watch" button (Verdant Grove's was tested).
- [ ] Still not built: NPC trainers inside worlds, shared co-op fights with enemy scaling, personal loot, and the combat-style decision. Carrier caches, a boss per world, parties and the ready check now exist (see the next section).

## Catpedia — [[Systems/Catpedia]]
- [ ] The NOT OWNED status in Studio (needs a cat to leave the inventory; tested offline only).
- [ ] The collection bonus measured on real station income.
- [ ] Phones: the window only scales down as a whole; small screens may be hard to read.
- [ ] With other players, and with a real save and rejoin.
- [ ] Final values: per-species bonus, milestone rewards and the ten lore texts are placeholders.
- [ ] Owner-granted cats count as discovered in the Catpedia (they own the species) but not on the Collection leaderboard; decide whether that is wanted.

## Login Rewards — [[Systems/Login Rewards]]
- [ ] Phone layout (a two-column arrangement exists in code).
- [ ] A real 24-hour wait; every later day was reached with the owner testing button.
- [ ] Save, leave and rejoin on a live server keeping the wait.
- [ ] A save failure or server shutdown in the middle of a claim.
- [ ] Final reward values: the seven rewards are placeholders.

## Owner Panel — [[Systems/Owner Panel]]
- [ ] Anything aimed at another player: grant coins, yarn or a cat to someone else; kick; timed ban; unban.
- [ ] A non-owner in a live server being refused (refused in offline tests only).
- [ ] Announcements appearing on other players' screens, and Roblox's real text filter (Studio does not filter).
- [ ] The owner rule on the published place (place owner recognised outside Studio; group-owned places need a UserId listed).
- [ ] Phones.

## Rebirth — [[Assets/UI Overhaul 2026-10-13]] revision 9
- [ ] Phone layouts.
- [ ] The gold PRESTIGE REBORN button's own press (the green button was used).
- [ ] The 3% bonus measured on real station income in Studio (the window showed +6% for 2 yarn; income itself was checked offline only).
- [ ] Very large Golden Yarn totals.

## HUD and MY PETS — [[Assets/UI Overhaul 2026-10-13]] revision 8
- [ ] MERGE and AUTO-MERGE completing a merge in Studio (no duplicate pair was available).
- [ ] The search box, and inventories larger than twelve cats.
- [ ] The press squash and the Following cat's bob. The Mythic rainbow border was seen on 2026-10-14, on the Aurora Lynx card.
- [ ] Battle, Realms, Settings, the station worker window and the new-cat reveal under the dark theme: restyled automatically, never re-captured.
- [ ] Phone layouts.

## Starter guide and Expeditions
- [ ] The three-step guide from start to bonus in Studio after the expedition step was removed (offline only).
- [ ] Expeditions: the window is off, but the server service and its remotes still run and are untested as "unused".

## Map fixes (BUG-029 to BUG-038)
- [ ] The other ten sanctuary plots (two were checked).
- [ ] Travelling into the two realms that were moved.
- [ ] Stations inside a plot lining up with its walls.

## Tooling notes for whoever tests next
- Two automated playtests in one Studio break each other; make sure only one is running.
- Some captures on 2026-10-13 showed a black 3D view with the UI intact; it cleared later. Treat a black world in a capture as a capture problem until the game itself shows it.

## Late night session additions (2026-10-14/15) — [[Late Night Session]]
### Explore
- [ ] **Parties with real players:**
  - invite, accept and leave;
  - the leader's world choice reaching members;
  - I'M READY!;
  - GO ANYWAY;
  - travelling together.

  Covered offline only.
- [ ] Carrier caches in Frostpeak, Cyber City, Ancient Temple and Cloud Kingdom. Only Verdant Grove's was opened in Studio.
- [ ] A cache refilling after a real 24 hours (offline tests only).
- [ ] Fighting the Cyber Syndicate, Celestial Coliseum and Sky Guardians on screen. They start in offline tests.
- [ ] The rival results screen (FIGHT AGAIN / BACK TO EXPLORE) after a real win. The practice results screen was seen.
- [ ] Team presets: the "no longer yours" message after a preset cat is merged away (offline only).

### Shop
- [ ] Buying Cozy, Royal and Starlight carriers in Studio. Only Starter was bought.

### Catpedia and species
- [ ] The goal chip on phones, beside the jump button and thumbstick.
- [ ] The five new species as Blender models. Today they are native-part variants, a stopgap against the 2026-10-13 rule.
- [ ] The final balance of the new species and the Mythic odds (placeholders).

### Pets
- [ ] The larger KEEP card tag, changed after the last capture and not re-captured.
- [ ] Practice with a cat that is also in an Explore team or a duel. The reservation logic is shared and was tested offline only.

### Owner Panel
- [x] The Cats tab with fifteen species, and the TEST SERVER badge. Seen 2026-10-15; the grid overflowed and was fixed to scroll (see [[Systems/Owner Panel]]).

## Early morning session additions (2026-10-15) — [[Early Morning Session]]
### Trading — [[Systems/Trading]]
- [ ] **A real trade between two players.** Covered offline only; the window was rendered with mock data.
- [ ] The Request Trade prompt over another character; the Friends-only setting with real friends.
- [ ] **The trade journal** against a real DataStore and a real server stop mid-trade (offline mocks only). See [[Systems/Trading]].

### Spawn boss — [[Systems/Boss Event]]
- [ ] Several trainers in one fight: health scaling, damage ranks and the shared prize.
- [ ] A Paw Sweep warning and an opening-window hit seen on screen.
- [ ] A full six-minute timeout in Studio.
- [ ] The ATTACK and JOIN buttons on phones.
- [ ] Keeping a prize for a player who disconnects after qualifying (not built).

### Upgrade map — [[Systems/Upgrade Map]]
- [ ] Upgraded stats inside a fight on screen, and in a duel.
- [ ] The three small showcase buttons on phones.

### Explore
- [ ] The Frostpeak, Ancient Temple and Cloud Kingdom trainers on screen. Only Grove and Cyber City were captured.
- [ ] Fight boosts in a fight started from an in-world trainer (the picker appeared; no fight was played through).

### Leaderboards
- [ ] The THIS WEEK view on screen, and a real Monday reset.
- [ ] Boss Wins and Team Power with several players.
- [ ] GLOBAL boards on a live server (real OrderedDataStores, budgets, names of offline players).

### Security
- [ ] The saved owner log on a live server.
- [ ] The 60-requests-per-10-seconds budget under normal play with many windows open.
