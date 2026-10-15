---
type: system
id: SYS-CAT-MERGING
title: System Specification — Cat Merging
last_updated: 2026-10-11
status: IMPLEMENTED
dependencies:
  - "[[Systems/Cat Collection]]"
  - "[[Systems/Player Data]]"
tags:
  - system
  - cats
  - merge
---

# Cat Merging System

## 2026-10-12 Optimization Update

Assigned cats must be unassigned before merging. The server revalidates both cats and station references inside the transaction. It retains the first UUID, upgrades its level, consumes the second, and transfers an equipped second UUID to the surviving first UUID; equipped peer visuals are notified. Same-species/level/self/max-level rules remain. False/error commits abort without consumption; offline cases pass. See [[Technical/Optimization Pass 2026-10-12]].

---


## 1. Overview
The Cat Merging system allows players to combine two duplicate felines of the same species and level into a stronger, higher-level feline with amplified income generation.

## 2. Merging Rules & Formulas
- **Condition**: Must own two distinct cat instances ($UUID_1 \neq UUID_2$) where $catId_1 = catId_2$ and $level_1 = level_2$.
- **Result**:
  - $UUID_1$ level increases: $level_{new} = level_{old} + 1$.
  - $UUID_2$ is consumed and permanently removed from `PlayerData.inventory`.
  - Production yield scales according to:
    $$\text{Yield} = \text{baseRate} \times \text{baseMultiplier} \times (1 + (\text{level} - 1) \times 0.5)$$

## 3. Server Authority & Anti-Exploit
- Merge operations are executed strictly via the server RemoteFunction `MergeCats(uuid1, uuid2)`.
- Client cannot merge cats they do not own or mutate levels arbitrarily.
- Server validates existence of both UUIDs in the player's session before altering state.

## 4. Implementation Location
- Math & validation: `src/shared/CatUtil.luau` (`CatUtil.canMerge`, `CatUtil.calculateYield`)
- Server logic: `src/server/Services/CatService.luau` (`handleMergeRequest`)
- Client interface: `src/client/Controllers/InventoryController.luau`
