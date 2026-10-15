---
type: system
id: SYS-COMBAT
title: System Specification — Battle Arena & Combat Simulation
last_updated: 2026-10-11
status: IMPLEMENTED
dependencies:
  - "[[Systems/Cat Collection]]"
  - "[[Systems/Player Data]]"
  - "[[Systems/Prestige]]"
tags:
  - system
  - combat
  - arena
  - pvp
---

# Battle Arena & Combat Simulation System

## 2026-10-12 Optimization Update

StartArenaBattle is spaced by a ten-second server cooldown; read requests are also spaced. Rewards are reported only if the profile transaction commits. Offline tests verify a valid NPC win, immediate replay rejection, and unchanged balance after replay. This remains NPC PvE rather than actual matchmaking/PvP. The new cooldown is an anti-spam/gameplay pacing change; tune it through playtesting. See [[Technical/Optimization Pass 2026-10-12]].

---


## 1. Overview
The Combat system enables players to assemble competitive 3-cat teams and battle rival feline clans across tiered arena divisions to earn Battle Trophies, Fish Coins, and Golden Yarn.

## 2. Stat Compounding Formulas
Combat stats scale with both the cat's innate Rarity and their Merge Level:

$$\text{Max HP} = \text{baseHp}(\text{rarity}) \times (1 + (\text{level}-1) \times 0.35)$$
$$\text{ATK} = \text{baseAtk}(\text{rarity}) \times (1 + (\text{level}-1) \times 0.35)$$
$$\text{SPD} = \text{baseSpd}(\text{rarity})$$

### Base Stats by Rarity:
| Rarity | Base HP | Base ATK | Base SPD |
|---|:---:|:---:|:---:|
| **Common** | 100 | 25 | 10 |
| **Uncommon** | 140 | 36 | 12 |
| **Rare** | 210 | 55 | 15 |
| **Epic** | 320 | 85 | 18 |
| **Legendary** | 500 | 140 | 22 |
| **Mythic** | 850 | 240 | 28 |
| **Secret** | 1500 | 450 | 35 |

## 3. Signature Cat Abilities

| Species | Ability | Type | Multiplier / Effect |
|---|---|:---:|---|
| **Orange Tabby** | Sunlit Purr | Heal | Restores 35% max HP to self |
| **Tuxedo Cat** | Gentleman Strike | Damage | 180% Critical Strike |
| **Calico** | Fortune Swipe | Damage | 150% Lucky Strike |
| **Scottish Fold** | Box Bunker | Defense | 140% Guarded Bash |
| **Siamese Barista** | Espresso Frenzy | Multi | 200% Double Strike |
| **Persian Royal** | Royal Command | Debuff | 160% Intimidating Strike |
| **Robo-Kitten** | Laser Barrage | AoE | 220% Tech Beam |
| **Shadow Prowler** | Shadow Pounce | Armor Piercing | 250% Sneak Critical |
| **Cosmic Sphinx** | Galaxy Burst | Burst | 300% Celestial Explosion |
| **Golden Maneki** | Prosperity Wave | Burst | 280% Prosperity Blast |

## 4. Arena Leagues & Divisions

| Division | Enemies | Rec. Level | Coin Reward | Trophy Reward | Yarn Reward |
|---|---|:---:|:---:|:---:|:---:|
| **Alley Prowlers (Novice)** | 2 Urban Cats | Lvl 1+ | 150 | 25 | 0 |
| **Cyber Syndicate (Inter.)** | 2 Cyber Cats | Lvl 3+ | 500 | 60 | 0 |
| **Celestial Coliseum (Master)** | 3 Celestial Bosses | Lvl 5+ | 1,500 | 150 | 1 |

## 5. Implementation Location
- Simulation & Stats Engine: `src/shared/CombatUtil.luau`
- Authoritative Server Service: `src/server/Services/CombatService.luau`
- Interactive Arena UI: `src/client/Controllers/CombatController.luau`


## 2026-10-12 — Current interactive arena replaces auto battle entry
CombatService now runs sessions through shared TurnBattle/BattleDefinitions and BattleAction(sessionId,revision,kind,index). StartArenaBattle returns `battle`, not legacy `battleResult`; updated CombatController renders the snapshot. GetArenaDivisions includes activeBattle for recovery. Four native move controls, HP/PP, type effects, healthy switching, guard/rest, Struggle, turn limit, expiry, forfeit, one-time server rewards. Best3 inventory cats are snapshotted at start. Two realm rivals join prior3 divisions. Legacy CombatUtil.simulateBattle remains available but is no longer invoked by arena entry. Prior auto-battle claims above are historical. Exact verification and remaining catching/PvP/team-selection/animation scope: [[Testing/Realms and Turn Battles 2026-10-12]].


## 2026-10-14 — PvE under Explore, PvP under Battle
NPC fights (Starter Trail, world rivals) are opened from Explore now; the Battle button runs friendly player-versus-player duels on the same turn engine. See [[Systems/Explore and Battle]].
