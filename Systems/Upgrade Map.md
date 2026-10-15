---
type: system
id: SYS-UPGRADE-MAP
title: System Specification — Upgrade map (cat training)
created: 2026-10-15
last_updated: 2026-10-15
status: IMPLEMENTED — placeholder costs and bonuses
dependencies:
  - "[[Systems/Combat]]"
  - "[[Systems/Cat Merging]]"
  - "[[Systems/Trading]]"
tags:
  - system
  - progression
---

# Upgrade map

## Source
From [[Chat Ideas]], "Home / cat sanctuary":
> Cats can be upgraded through a map of upgrades, including strength.

The note also says "the exact location/access, layout, and upgrade rules remain undecided". **Every rule below is the assistant's own proposal,** built during the [[Early Morning Session]] for the user to keep, change or drop. The sanctuary part of that idea (a home you visit, toys) is **not** built.

## How it works
- **Opening it:** MY PETS → select a cat → **UPGRADE** (on the showcase, between KEEP and PRACTICE) opens the **UPGRADE MAP** for that cat.
- **Three tracks,** each a path of steps bought in order:

  | Track | Effect per step | Steps |
  |---|---|---|
  | **Strength** | +6% attack | 5 |
  | **Toughness** | +6% health | 5 |
  | **Agility** | +1 speed | 3 |

- **What the steps look like:** bought steps are gold ✓; the next step is green and shows its price; later steps are grey and locked.
- **Live stats:** the left side shows the cat and its health, attack and speed before → after upgrades.
- **Cost of a step:** 150 × step² × rarity factor, in coins. Rarity factors: Common 1, Uncommon 1.5, Rare 2.5, Epic 4, Legendary 6, Mythic 10. Examples:
  - a Common's first step costs 150;
  - an Epic's third costs 5,400;
  - a Mythic's fifth costs 37,500.
- **Upgrades belong to the cat:**
  - they apply in every fight: Explore rivals, the Starter Trail, practice, PvP duels and the spawn boss's attack, through `CombatUtil.createFighterFromInstance`;
  - they also count toward Team Power and trade power;
  - **merging** keeps the higher step of each track from the two cats, so nothing bought is thrown away;
  - **trading** moves the cat with its upgrades (the trade proposal asked for "carried upgrade investment").
- **Battle lock:** a cat in a battle cannot be upgraded until the battle ends.

## Server
- **Remote:** `TrainCat(uuid, track)` in `TrainingService`. It checks ownership, the track, the next step and the coins, then spends and saves in one transaction.
- **Saved field:** `PlayerCatInstance.training = { strength?, toughness?, agility? }`, whole steps only. A bad value refuses the profile load, as with other corrupt fields.

## Verification
- **Offline (11 assertions):** bad cat or track refused; the first step's price and save; Strength applied to battle stats (health unchanged); a track capped at its last step; no coins refused; a cat mid-battle refused; a merge keeping the higher steps; cost and validity rules; a fractional step refused on load.
- **Studio Play, solo, 2026-10-15:**
  - a level 2 Maine Coon Ranger (Epic) given 10,000 coins;
  - Strength 1 and 2 and Agility 1 bought by pressing the map's own buttons: 600 + 2,400 + 600 = 3,600 coins, leaving 6,500, matching the saved `{"strength":2,"agility":1}`;
  - attack 115 → 129 and speed 18 → 19 shown;
  - a locked step refused with "Learn the steps before this one first.".
- **Not verified:** the upgraded stats inside an actual fight on screen (offline only); phones (the three showcase buttons are small); balance.

## Previews

![[Assets/Previews/UPGRADE-MAP/2026-10-15-r1-map-new-cat.png|480]]
![[Assets/Previews/UPGRADE-MAP/2026-10-15-r1-map-after-buying.png|480]]
![[Assets/Previews/PETS/2026-10-15-r4-keep-upgrade-practice.png|480]]

Actual Studio Play captures, 1096x635.

## Files
- `src/shared/TrainingDefinitions.luau`
- `src/server/Services/TrainingService.luau`
- `src/client/Controllers/TrainingController.luau`
- `CombatUtil.calculateStats(catId, level, training?)`
- `CatService` (merge)
- `InventoryController` (button)
- `Types`
