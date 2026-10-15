---
type: system
id: SYS-EXPEDITIONS
title: System Specification — Feline Expeditions & Adventures
last_updated: 2026-10-11
status: IMPLEMENTED
dependencies:
  - "[[Systems/Cat Collection]]"
  - "[[Systems/Economy]]"
  - "[[Systems/Player Data]]"
tags:
  - system
  - expeditions
  - idle
---

# Feline Expeditions & Adventures System

## 2026-10-12 Optimization Update

Active mission finish timestamps now live in PlayerData.expeditions and survive save/reload. Finished unclaimed missions cannot be replaced by starting again. Claim validates server time and atomically awards coins/yarn/bonus cat while consuming mission state. Duplicate and early claims fail. Status reads copy only mission state. Mission roster, durations, rewards and inventory-count requirements remain unchanged; teams are not reserved. Reconnect/claim/replay mock cases pass; Studio/API tests remain pending. See [[Technical/Optimization Pass 2026-10-12]].

---


## 1. Overview
The Expeditions system allows players to dispatch teams of adopted cats on timed explorations into distant realms to retrieve Fish Coins, Golden Yarn, and bonus rescue cats.

## 2. Exploration Zones & Rewards

| Zone | Duration | Required Cats | Fish Coins | Golden Yarn | Bonus Cat Chance | Target Realm |
|---|---|:---:|---|:---:|:---:|---|
| **Sunny Meadow** | 30s | 1 Cat | 100 | 0 | 50% | Grassy starter plains |
| **Catnip Canyon** | 90s | 2 Cats | 350 | 0 | 80% | High-altitude catnip groves |
| **Cosmic Nebula** | 180s (3m) | 3 Cats | 800 | 1 | 100% | Zero-gravity galaxy yarn expanse |

## 3. Server Authority & Anti-Exploit
- Dispatches and countdown timers are validated strictly on the server:
  - `finishTimestamp` stored authoritatively in `ExpeditionService`.
  - Claim requests verified against `os.time() >= finishTimestamp`.
  - Prevents speed hacking or client clock tampering.
- Coin rewards scale with the player's permanent Golden Yarn prestige multiplier ($1.0 + (\text{Yarn} \times 0.25)$).

## 4. Implementation Location
- Server Logic: `src/server/Services/ExpeditionService.luau`
- Client Interface: `src/client/Controllers/ExpeditionController.luau`


> [!warning] Being removed — 2026-10-13
> The user decided to remove Expeditions. The client window, its menu button and the starter-guide step are gone. `ExpeditionService`, the three remotes and the `expeditions` profile field still exist on the server. See ADR-015 in [[Decisions/Decision Log]].
