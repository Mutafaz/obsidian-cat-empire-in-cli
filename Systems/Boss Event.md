---
type: system
id: SYS-BOSS-EVENT
title: System Specification — Spawn boss event
created: 2026-10-15
last_updated: 2026-10-15
status: IMPLEMENTED — solo-tested; placeholder balance
dependencies:
  - "[[Systems/Combat]]"
  - "[[Systems/Shop]]"
  - "[[Systems/Leaderboards]]"
tags:
  - system
  - boss
  - event
  - multiplayer
---

# Spawn boss event

## Source
Idea 002 B in [[Chat Ideas]] ("The boss fight in the middle of spawn"), plus 007 #6 (boss opening windows). Built during the [[Early Morning Session]]. The proposal's schedule, health table, prizes and eligibility rules were used as written. Its numbers are proposals, not tested balance.

## Where
**The arena is not in the exact middle.** The centre of spawn is the sphinx monument, so the arena is a sand-coloured ring (radius 18) with gold posts in the open north-west quarter of the spawn plaza, at (-46, 46). That is between the arrival point and the leaderboard, clear of the plaza's other structures (checked with a survey of the plaza in Studio). Around it:
- a sign showing the next boss and countdown;
- a **Join** plinth with a prompt at the east entrance.

## Schedule
One event every **15 minutes**, by the server clock (UTC). The same boss runs at the same time on every server; each server fights its own.

| Minute | Boss | Look | Health for 4 trainers | Coins | Carrier cat |
|---|---|---|---:|---:|---|
| :00 | Big Tabby | big orange tabby | 30,000 | 100 | Starter |
| :15 | Tuxedo Captain | big tuxedo | 60,000 | 200 | Cozy |
| :30 | Maine Coon Guardian | big Maine Coon Ranger | 90,000 | 350 | Royal |
| :45 | Royal Calico | big calico | 120,000 | 500 | Starlight |

- **One minute before:** Join opens.
- **The fight:** six minutes.
- **Afterwards:** 30 seconds of results, then the arena is quiet until the next warning.
- **If nobody joined,** the boss is skipped.

## Fighting
- **Health** is set once at the start: base × trainers who joined ÷ 4. One trainer faces a quarter. Late joiners help without raising it.
- **ATTACK** (button or **F**), at most once a second, only while standing inside the ring.
  - One attack deals your team's combined attack: your saved Explore team, otherwise your strongest three. **This damage formula is a placeholder.**
  - Overkill never counts.
- **Boss moves** every 5.5 seconds, each marked on the ground in red before it lands:

  | Move | Where it hits | Warning time |
  |---|---|---|
  | Pounce | a circle (radius 7) at one trainer | 2 s |
  | Paw Sweep | a strip in front of the boss toward one trainer | 2 s |
  | Stomp | a circle (radius 14) around the boss | 2.5 s |

  A trainer caught inside is **knocked out**: sent to the entrance, unable to attack for 5 seconds. Nothing is lost.
- **Opening window (007 #6):** for 2.5 seconds after each move lands, every attack deals **double damage**. The button turns yellow: "OPENING! x2". It works solo too.
- **The HUD:**
  - a banner under the currency bar: next boss and countdown, or health and time left, plus your damage;
  - the ATTACK button, with KNOCKED OUT and STEP INTO THE RING states;
  - a JOIN button near the arena;
  - a results receipt with CONTINUE.

  Explore → EVENTS shows a SPAWN BOSS card next to the Cat Parade.

## Prizes
- **Who qualifies:** at least **3 attacks** (1 if the whole fight was under 15 seconds) and an attack in the **final 30 seconds**.
- **On a win, each qualifying trainer gets:**
  - the coins;
  - a damage-rank bonus: +10% / +5% / +3% for ranks 1 to 3 (competition ranking, so ties share a rank);
  - **one cat** rolled like that boss's carrier.
- **On a timeout,** qualifying trainers get a quarter of the coins. There is no cat and no win.
- **One result per player per scheduled slot,** saved as `bossSlot` in the profile, so reconnecting or another server cannot pay twice.
- **Leaderboard counts:** scheduled wins count toward `bossWins` and `bossDamage`.
- **Owner test fights** (Owner Panel → Events → START BOSS FIGHT) pay the same prizes but record nothing.
- **Disconnects:** a trainer who leaves before the end is dropped from the fight and paid nothing. The proposal wanted entitlement kept for a short disconnect after qualifying; that is **not built**, because an absent player's profile is not loaded.

## Verification
- **Offline:** 36 assertions for the event, 5 for the opening window. They cover:
  - rotation, health scaling, phase timing, competition ranking, every coin rule, eligibility edge cases;
  - each move's zone shape;
  - a full scheduled fight with two trainers: the warning opening on time, joining from far away, joining with no cats, attacking before the start, attack damage and spacing, attacking from outside the ring, a knockout and its recovery;
  - the winner's prize (200 + 10% and a Cozy-or-better cat), an inactive trainer unpaid, win records;
  - the next slot's boss and health, the timeout prize, an empty event skipped, the owner start, the save format;
  - an opening attack doubled and expiring.
- **Studio Play, solo, 2026-10-15:**
  - an owner test fight from warning to victory: 110 coins (100 + 10% rank bonus) and one carrier cat, with the receipt shown;
  - a **real scheduled** Tuxedo Captain fight at 15,000 HP (one trainer);
  - knockouts by Pounce;
  - the Stomp warning drawn on the ground;
  - the boss and its health bar;
  - the HUD banner states;
  - the Explore EVENTS card.
- **Fixed during testing:**
  - the boss model was far too big (the camera ended up inside it);
  - the HUD said "in 0:00" between events;
  - the arena sign never showed the idle countdown.
- **Not verified:**
  - several trainers together;
  - a Paw Sweep warning seen on screen;
  - an opening-window hit seen on screen (offline only);
  - phones (the ATTACK button sits above the goal chip and may crowd the jump button);
  - a full six-minute timeout in Studio;
  - performance with many trainers.

## Previews

![[Assets/Previews/BOSS-EVENT/2026-10-15-r2-arena-idle.png|480]]

The arena from outside. The sign shows only "BOSS ARENA" because this was captured before the idle-sign fix.

![[Assets/Previews/BOSS-EVENT/2026-10-15-r2-fight-outside-ring.png|480]]

Big Tabby up, with its health bar.

![[Assets/Previews/BOSS-EVENT/2026-10-15-r2-stomp-warning-scheduled.png|480]]

A real scheduled Tuxedo Captain fight: the red Stomp warning around the boss.

![[Assets/Previews/BOSS-EVENT/2026-10-15-r2-knocked-out.png|480]]
![[Assets/Previews/BOSS-EVENT/2026-10-15-r2-explore-events-card.png|480]]
![[Assets/Previews/BOSS-EVENT/2026-10-15-r1-results-boss-too-big.png|480]]

Revision 1: the receipt is correct, but the boss model was oversized (fixed in r2).

All are actual Studio Play captures, solo, at 1096x635.

## Files
- `src/shared/BossDefinitions.luau`
- `src/server/Services/BossEventService.luau`
- `src/client/Controllers/BossController.luau`
- `AdminService` / `AdminController` (StartBossEvent)
- `ParadeService` (Events status)
- `Types` (`bossSlot`, `bossWins`, `bossDamage`)
