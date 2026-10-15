---
type: system
id: SYS-WORKSTATIONS
title: System Specification — Cat Workstations & Assignment
last_updated: 2026-10-11
status: IMPLEMENTED
dependencies:
  - "[[Systems/Cat Collection]]"
  - "[[Systems/Player Data]]"
  - "[[Systems/Prestige]]"
tags:
  - system
  - stations
  - tycoon
  - assignment
---

# Cat Workstations & Station Assignment System

## 2026-10-12 Optimization Update

Purchases now atomically deduct cost and add the station record after ownership/readiness/proximity checks. Worker assignment checks transaction success, and moving a worker removes its previous podium visual. Data-ready plot restoration and persisted starterGranted prevent duplicate grants during rendering/rebirth. Returning roaming labels use CatDefinitions.rarity. Production rate is cached; four roaming cats per plot limit visual growth. Acceptance in Studio remains pending; see [[Technical/Optimization Pass 2026-10-12]].

---


## 1. Overview
The Cat Workstation Assignment system connects the player's cat collection to their physical tycoon sanctuary. Players can station specific feline companions at tycoon structures to massively multiply passive coin generation and observe their cats physically working in 3D.

## 2. Ancient Egyptian Stations & Roles

| Station ID | Structure Name | Base Yield | Role | Position Offset | Cost (Fish Coins) | Architectural Features |
|---|---|:---:|---|:---:|:---:|---|
| `starter_kitten` | Pharaoh's Cloud Daybed | 1 Coin/s | Temple Priest | `(-18, 1, -18)` | Free | Ebony & gold frame, lion legs, royal purple pleated mattress, lapis bolster, alabaster milk bowl, sleeping tabby kitten with "💤" particles. |
| `scratching_post` | Obelisk of Bastet | 3 Coins/s | Claw Guardian | `(0, 1, -18)` | 25 | Stepped sandstone dais, palm-fiber sisal ropes, glowing electrum pyramidion capstone, swinging scarab & ankh toys. |
| `cat_cafe` | Nile Oasis Tea Pavilion | 12 Coins/s | Royal Brewer | `(18, 1, -16)` | 100 | Colonnaded terrace, papyrus columns with lotus capitals, turquoise striped awning, red Aswan granite counter, golden samovar with rising steam. |
| `laser_arena` | Sun God Ra's Solar Sanctum | 30 Coins/s | Solar Champion | `(18, 1, 16)` | 250 | Sun disc platform, 4 quartz crystal obelisks, crisscrossing solar laser beams, animated darting red solar dot with PointLight. |
| `catnip_greenhouse` | Hanging Gardens of Bubastis | 75 Coins/s | Sacred Herbalist | `(-18, 1, 16)` | 600 | Colonnaded sandstone conservatory, emerald glass canopy, stone aqueducts with flowing water, blue lotus planters, golden pollen sparkle particles. |

## 3. Worker Multiplier Formula

When a cat is assigned to a station, its level and species base multiplier scale the station's yield:
$$\text{Worker Multiplier} = \max\left(1.0, \text{BaseMultiplier} \times (1 + (\text{Level} - 1) \times 0.5)\right)$$

### Total Sanctuary Production Formula
$$\text{Yield}_{\text{total}} = \sum \left(\text{BaseYield}_i \times \text{WorkerMultiplier}_i\right) \times \text{PrestigeMult} \times \text{ParadeMult} \times \text{WorldMult}$$

## 4. Visual 3D Representation & Sanctuary Courtyard Architecture
- **12-Player Radial Grid**: 12 spacious temple plots located at $R = 280$ studs, providing an **86-stud open oasis buffer between every plot** to eliminate crowding.
- **Temple Courtyard Foundation**: 68x68 sandstone terrace ($Y = 0.35$) with 62x62 fine golden sand courtyard ($Y = 0.60$) and perimeter parapet balustrades.
- **Grand Temple Pylon Gate**: Twin sloped pylon towers, winged sun disc emblem, flaming bronze fire braziers, and hieroglyphic stele signage.
- **Worker Podiums**: Each built station features a dedicated Worker Dais with an `Assign Priest` / `Assign Worker` ProximityPrompt.
- **Autonomous Cat Wandering AI**: Up to 4 roaming cats wander the temple grounds ($\pm 24$ studs), resting periodically with cute paw-stride tilts. Players can pet roaming cats to trigger purrs (`💖 Purrr!`), heart particles, and bonus coins.

## 5. Network Contracts
- Server Invocation: `AssignStationWorker(stationId: string, catUuid: string?)` -> `{ success: boolean, message: string, assignedUuid: string? }`
- Client Event: `OpenStationAssignment(stationId: string, stationName: string, role: string)`


## Native station art v2 — 2026-10-12

Visual constructors route to SanctuaryAssetBuilder for all five station types. Existing pad transaction, ownership, assignment, and production code remains authoritative. The starter model uses the original spawnCatModel path for its resting cat; Pet prompt inspected in solo Play. Static export includes a smaller display cat. Source legacy constructors remain behind UseLegacyAssetArt=true on TycoonService. Full purchase/worker/multiplayer verification remains pending. [[Testing/Asset Remake 2026-10-12]].
