---
type: system
id: SYS-CAT-COLLECTION
title: System Specification — Cat Collection
last_updated: 2026-10-11
status: IMPLEMENTED
dependencies:
  - "[[Systems/Player Data]]"
  - "[[Systems/Economy]]"
  - "[[Assets/Asset Registry]]"
tags:
  - system
  - cats
  - gacha
---

# Cat Collection System

## 2026-10-12 Optimization Update

AdoptCat now shares a single server path for the remote and plot prompt: cooldown, owned-pad distance, then one price+cat transaction. Starter granting uses an idempotent persisted marker instead of being an unconditional render side effect. Invalid or unavailable transactions spend no coins. The original species/drop pool is unchanged; Mythic/Secret remain unimplemented content. Offline adoption/starter/rejoin cases pass; see [[Technical/Optimization Pass 2026-10-12]].

---


## 1. Overview
The Cat Collection system governs acquiring, inspecting, and storing distinct feline companions across multiple rarity tiers.

## 2. Rarity Tiers & Probability Weights

| Rarity | Base Drop Chance | Generation Multiplier Base | Max Level |
|---|---|---|---|
| **Common** | 60.0% | $1.0\times$ | 10 |
| **Uncommon** | 25.0% | $1.5\times$ | 15 |
| **Rare** | 10.0% | $2.5\times$ | 20 |
| **Epic** | 4.0% | $5.0\times$ | 30 |
| **Legendary** | 0.9% | $12.0\times$ | 40 |
| **Mythic** | 0.09% | $30.0\times$ | 50 |
| **Secret** | 0.01% | $100.0\times$ | 100 |

## 3. Data-Driven Definitions
All cats must be defined inside `src/shared/CatDefinitions.luau`.
Each cat contains:
- `id`: Unique string (e.g., `"orange_tabby"`)
- `name`: Display name
- `rarity`: `CatRarity`
- `baseMultiplier`: Numeric multiplier for idle income
- `description`: Lore & flavor text
- `assetId`: Model/Texture reference ID

## 4. Server Authority & Validation
- Cat adoption requests (spending coins on rescue boxes) execute exclusively on the server.
- The server performs drop rolls via cryptographically secure pseudo-random numbers (`math.random` on server) to ensure clients cannot tamper with roll results.

## 5. Initial Implemented Catalog (`CatDefinitions.luau`)

| Cat ID | Name | Rarity | Base Multiplier | Base Yield (Coins/sec) | Description |
|---|---|---|---|---|---|
| `orange_tabby` | Orange Tabby | Common | $1.0\times$ | 1.0 | Friendly, sun-loving tabby who loves purring by the window. |
| `tuxedo` | Tuxedo Cat | Common | $1.1\times$ | 1.2 | Always dressed for formal lounging. Professional nap taker. |
| `calico` | Calico | Uncommon | $1.5\times$ | 2.0 | Tricolor sweetheart known for bringing fortune to cozy sanctuaries. |
| `scottish_fold` | Scottish Fold | Uncommon | $1.7\times$ | 2.5 | Folded ears hide a genius-level intellect for cardboard boxes. |
| `siamese_barista` | Siamese Barista | Rare | $2.5\times$ | 5.0 | Brews fish-foam lattes with exceptional speed and vocal commentary. |
| `persian_royal` | Persian Royal | Rare | $3.0\times$ | 7.0 | Fluffy royalty who demands only the softest velvet cushions. |
| `robo_kitten` | Robo-Kitten | Epic | $5.5\times$ | 15.0 | Equipped with turbo laser pointers and quantum purr drives. |
| `shadow_panther` | Shadow Prowler | Epic | $7.0\times$ | 22.0 | Sleek midnight prowler that moves between shadows without a sound. |
| `cosmic_sphinx` | Cosmic Sphinx | Legendary | $15.0\times$ | 60.0 | Channels ancient starlight and bends galaxy yarn to its will. |
| `golden_maneki` | Golden Maneki | Legendary | $25.0\times$ | 100.0 | The ultimate lucky feline, waving golden prosperity across your empire. |

