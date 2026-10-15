---
type: system
id: SYS-WORLDS
title: System Specification — Multi-World & Realm Travel
last_updated: 2026-10-12
status: IMPLEMENTED
dependencies:
  - "[[Systems/Prestige]]"
  - "[[Systems/Player Data]]"
tags:
  - system
  - worlds
  - realms
  - prestige
---

# Multi-World & Realm Travel System

## 2026-10-12 Audit Update

The stable saved ID `CozyMeadow` is retained. Its visible name is now **Sacred Egyptian Oasis** in `WorldDefinitions.luau`, matching the procedural Egyptian map. [[Systems/UI]] documents new real gold plaza borders, turquoise avenue inlays, gentler lighting, and grouped client cloud animation. Realm UI now has fitting modals and responsive navigation. All visual and travel runtime checks remain pending in [[Testing/Visual Polish Checks]].

---

The sections below retain the prior project record. Where prior completion or verification claims conflict with this audit, use the dated audit evidence.


## 1. Overview
The Multi-World system enables players to expand beyond their starter sanctuary into mystical themed feline realms. Worlds are permanently unlocked using **Golden Yarn** obtained from Rebirths, granting permanent empire-wide production multipliers and unique aesthetic plazas.

## 2. Canonical Realms

| Realm ID | Realm Name | Golden Yarn Cost | Empire Multiplier | Theme & Aesthetic |
|---|---|:---:|:---:|---|
| `CozyMeadow` | Sacred Egyptian Oasis (Cozy Meadow) | 0 (Default) | 1.0x | 1,000-stud golden sandstone island, Great Sphinx of Bastet, Nile River moat, 12 royal avenues, distant pyramids |
| `CyberCity` | Neon Cyber Cat City | 5 Yarn | 1.5x (+50%) | High-tech metropolis, glowing cyan gridlines, electronic beats |
| `AncientTemple` | Ancient Feline Temple | 15 Yarn | 2.0x (+100%) | Desert sandstone plazas, golden pyramid core, sacred hieroglyphs |
| `CloudKingdom` | Celestial Cloud Kingdom | 30 Yarn | 3.0x (+200%) | Ethereal floating sky kingdom, rainbow arches, celestial yarn |

## 3. World Interaction & Central Plaza Cardinal Alignment
- **East Plaza Realm Portal**: A grand golden archway and swirling purple vortex located in the East Plaza quadrant at `Vector3.new(52, 0.8, 0)` facing West towards the Great Sphinx, equipped with a ProximityPrompt (`[E] Explore Realms`).
- **Cardinal Plaza Layout**:
  - *Center (`0, 0, 0`)*: Colossal Great Sphinx Cat of Bastet & 46-stud Sacred Lotus Pool
  - *South (`0, 0, 50`)*: Sun Disc Spawn Platform (players land facing North towards Sphinx)
  - *North (`0, 0, -50`)*: Pharaoh's Adoption Sanctum with 8 papyrus columns and mystery box sarcophagus
  - *West (`-52, 10, 0`)*: Global Sanctuary Leaderboard Monument with twin golden pillars facing East
  - *East (`52, 0.8, 0`)*: Realm Travel Portal Monument facing West
- **HUD Realm Button**: Accessible from the bottom navigation bar (`UDim2.new(0, 540, 1, -64)`) for instant modal access.
- **Sub-realm Return Portals**: Each distant realm features a glowing neon return pad transporting players back to the central spawn platform at `Vector3.new(0, 5, 50)`.
- **Screen Transitions**: Smooth camera and UI fullscreen fade sequence (`WorldController.luau`).

## 4. Implementation Location
- Configuration: `src/shared/WorldDefinitions.luau`
- Server Logic: `src/server/Services/WorldService.luau`
- Client Controller: `src/client/Controllers/WorldController.luau`


## 2026-10-12 — Two new playable prototypes and travel safety
VerdantGrove: free unlock,1.0× income; Frostpeak:3 Golden Yarn,1.25× income while visiting. Six entries total. Coordinates in shared RealmLayout; native trees/crystals, unobstructed paths, safety walls, return/rival prompts from server Modules/RealmBuilder. Rival start requires unlocked current realm. Unlock deduction+ownership is one transaction, including free unlocks. Travel checks living character, commits world, clears momentum; UI catches failures so the fade doesn't stay black. Income is based on current visited realm, not permanent stacking. Existing prose claiming permanent empire-wide bonuses should not be used to infer implementation. Realms are functional art prototypes. See [[Assets/Realm and Battle Brief]] and [[Testing/Realms and Turn Battles 2026-10-12]].
