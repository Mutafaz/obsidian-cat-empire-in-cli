---
type: system
id: SYS-PRESTIGE
title: System Specification — Prestige & Golden Yarn
last_updated: 2026-10-11
status: IMPLEMENTED
dependencies:
  - "[[Systems/Economy]]"
  - "[[Systems/Player Data]]"
  - "[[Systems/Production]]"
tags:
  - system
  - prestige
  - rebirth
---

# Prestige & Golden Yarn System

## 1. Overview
The Prestige system allows players to sacrifice their temporary tycoon plot structures in exchange for permanent **Golden Yarn** currency and multiplicative income boosts.

## 2. Rebirth Mechanics & Formulas
- **Threshold**: Requires at least **500 Fish Coins** to execute a Prestige.
- **Reward Formula**:
  $$\text{Golden Yarn} = \max\left(1, \left\lfloor \sqrt{\frac{\text{FishCoins}}{500}} \right\rfloor\right)$$
- **Permanent Multiplier**:
  Each Golden Yarn increases all subsequent passive and active coin generation by **+3%** (was +25% until 2026-10-13, lowered at the user's request):
  $$\text{Income Multiplier} = 1.0 + (\text{GoldenYarn} \times 0.03)$$

## 3. What Resets vs. What Persists

| Category | On Prestige | Notes |
|---|:---:|---|
| **Tycoon Stations** | 🔄 Resets | Stations are cleared; plots rebuild fresh from Tier 1. |
| **Fish Coins** | 🔄 Resets | Resets to 100 starter coins. |
| **Golden Yarn** | 🔒 Persists | Cumulative and permanent. |
| **Cat Inventory** | 🔒 Persists | All collected and merged cats remain permanently in inventory. |
| **Unlocked Worlds** | 🔒 Persists | Persistent world progress. |

## 4. Implementation Location
- Server Logic: `src/server/Services/PrestigeService.luau` (`handlePrestigeRequest`)
- Tycoon Reset Hook: `src/server/Services/TycoonService.luau` (`ResetPlot`)
- Client Interface: `src/client/Controllers/PrestigeController.luau`
