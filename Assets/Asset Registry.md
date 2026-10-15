---
type: registry
id: REGISTRY-ASSETS
title: Cat Empire — Master Asset Registry
last_updated: 2026-10-12
status: ACTIVE
tags:
  - assets
  - registry
---

# Cat Empire — Asset Registry

This registry mirrors and categorizes assets tracked across the game and local storage.

See also: Local workspace catalog at `assets/CATALOG.md`.

---

## 🐱 Cats (`Assets/Cats/` & `assets/models/`)

| Asset ID | Name | Rarity | Category | Status | 3D Mesh / Factory Path | Usage |
|---|---|---|---|---|---|---|
| `CAT-001` | Orange Tabby | Common | Starter Feline | IMPLEMENTED | `Cat_orange_tabby.fbx` / `CatModelFactory` | Sanctuary roaming, worker, pet follower |
| `CAT-002` | Tuxedo Cat | Common | Formal Lounger | IMPLEMENTED | `Cat_tuxedo.fbx` / `CatModelFactory` | Sanctuary roaming, worker, pet follower |
| `CAT-003` | Calico | Uncommon | Domestic Good Luck | IMPLEMENTED | `Cat_calico.fbx` / `CatModelFactory` | Sanctuary roaming, worker, pet follower |
| `CAT-004` | Scottish Fold | Uncommon | Folded Ear Genius | IMPLEMENTED | `Cat_scottish_fold.fbx` / `CatModelFactory` | Sanctuary roaming, worker, pet follower |
| `CAT-005` | Siamese Barista | Rare | Cafe Specialist | IMPLEMENTED | `Cat_siamese_barista.fbx` / `CatModelFactory` | Sanctuary roaming, worker, pet follower |
| `CAT-006` | Persian Royal | Rare | Fluffy Royalty | IMPLEMENTED | `Cat_persian_royal.fbx` / `CatModelFactory` | Sanctuary roaming, worker, pet follower |
| `CAT-007` | Robo-Kitten | Epic | Cybernetic Operative | IMPLEMENTED | `Cat_robo_kitten.fbx` / `CatModelFactory` | Sanctuary roaming, worker, pet follower |
| `CAT-008` | Shadow Prowler | Epic | Midnight Panther | IMPLEMENTED | `Cat_shadow_panther.fbx` / `CatModelFactory` | Sanctuary roaming, worker, pet follower |
| `CAT-009` | Cosmic Sphinx | Legendary | Galactic Celestial | IMPLEMENTED | `Cat_cosmic_sphinx.fbx` / `CatModelFactory` | Sanctuary roaming, worker, pet follower |
| `CAT-010` | Golden Maneki | Legendary | Auspicious Prosperity | IMPLEMENTED | `Cat_golden_maneki.fbx` / `CatModelFactory` | Sanctuary roaming, worker, pet follower |
| `CAT-011` | Grey Shorthair | Common | Tidy Caretaker | NATIVE STOPGAP (Blender pending) | `CleanCatBuilder` palette + markings | See [[Assets/Cat Species 2026-10-14]] |
| `CAT-012` | Ragdoll Snowpuff | Uncommon | Floppy Napper | NATIVE STOPGAP (Blender pending) | `CleanCatBuilder` palette + markings | See [[Assets/Cat Species 2026-10-14]] |
| `CAT-013` | Bengal Ember | Rare | Dune Sprinter | NATIVE STOPGAP (Blender pending) | `CleanCatBuilder` palette + markings | See [[Assets/Cat Species 2026-10-14]] |
| `CAT-014` | Maine Coon Ranger | Epic | Grove Guardian | NATIVE STOPGAP (Blender pending) | `CleanCatBuilder` palette + markings | See [[Assets/Cat Species 2026-10-14]] |
| `CAT-015` | Aurora Lynx | Mythic | Northern Lights | NATIVE STOPGAP (Blender pending) | `CleanCatBuilder` palette + markings | See [[Assets/Cat Species 2026-10-14]] |

---

## 🏰 Egyptian Buildings & Sanctuary Stations (`Assets/Buildings/`)

| Asset ID | Station / Structure Name | Type | Base Yield | Status | 3D Model Source / Geometry |
|---|---|---|---|---|---|
| `BLD-001` | Pharaoh's Cloud Daybed | Starter Rest | +1 Coin/s | IMPLEMENTED | `Procedural TycoonService (no starter FBX)` / Sandstone & ebony daybed |
| `BLD-002` | Obelisk of Bastet | Claw Training | +3 Coins/s | IMPLEMENTED | `Station_scratching_post.fbx` / Sandstone dais & sisal obelisk |
| `BLD-003` | Nile Oasis Tea Pavilion | Hospitality | +12 Coins/s | IMPLEMENTED | `Station_cat_cafe.fbx` / Papyrus colonnade & samovar |
| `BLD-004` | Sun God Ra's Solar Sanctum | Entertainment | +30 Coins/s | IMPLEMENTED | `Station_laser_arena.fbx` / Quartz obelisks & solar beams |
| `BLD-005` | Hanging Gardens of Bubastis | Agriculture | +75 Coins/s | IMPLEMENTED | `Station_catnip_greenhouse.fbx` / Aqueduct & lotus planters |
| `BLD-006` | Colossal Great Sphinx Cat | World Monument | Island Landmark | IMPLEMENTED | Carved golden sandstone Sphinx with Nemes headdress |
| `BLD-007` | Temple Pylon Gateway | Plot Entrance | Portal Gate | IMPLEMENTED | Sloped pylon towers with winged sun disc & fire braziers |

---

## 🎨 UI & 2D Art (`Assets/UI/`)

| Asset ID | Element Name | Type | Source / Model | Status | Usage |
|---|---|---|---|---|---|
| `UI-001` | Fish Coin Indicator | Procedural Pill | `🐟` Unicode + Color3 | IMPLEMENTED | HUD currency counter (`HUDController`) |
| `UI-002` | Golden Yarn Indicator | Procedural Pill | `🧶` Unicode + Color3 | IMPLEMENTED | Rebirth currency counter (`HUDController`) |
| `UI-003` | Battle Trophy Indicator | Procedural Pill | `🏆` Unicode + Color3 | IMPLEMENTED | Arena combat ranking badge (`HUDController`) |
| `UI-004` | Cat Card Frame | UICorner + UIStroke | Custom Luau UI Framework | IMPLEMENTED | Cat Inventory drawer & gacha reveals |
| `UI-005` | Typography Heading | Font | Google Fredoka One | IMPLEMENTED | SIL Open Font License 1.1 headings |

---

## 🎵 Audio (`src/shared/AssetRegistry.luau`)

| Asset Key | Type | Roblox Asset ID | License Provenance | Status | Usage |
|---|---|---|---|---|---|
| `SFX_UIClick` | SFX | `rbxasset://sounds/uiclick.mp3` | Roblox Engine Core | ACTIVE | Tactile UI button clicks |
| `SFX_CoinPickup` | SFX | `rbxassetid://9069609200` | Roblox Licensed Audio | ACTIVE | Coin income & petting feedback |
| `SFX_CatMeow` | SFX | `rbxassetid://9068095495` | Roblox Licensed Audio | ACTIVE | Petting interactions & adoption |
| `SFX_MergeAscend` | SFX | `rbxassetid://9069608779` | Roblox Licensed Audio | ACTIVE | Cat merge level upgrade chime |
| `SFX_PrestigeRebirth` | SFX | `rbxassetid://9069609653` | Roblox Licensed Audio | ACTIVE | Sacred Rebirth fanfare chime |
| `SFX_PortalWhoosh` | SFX | `rbxassetid://9069609503` | Roblox Licensed Audio | ACTIVE | Realm portal teleport transition |
| `SFX_CombatHit` | SFX | `rbxassetid://9069609070` | Roblox Licensed Audio | ACTIVE | Arena combat attack strike impact |
| `BGM_CozyMeadow` | Music | `rbxassetid://9043887091` | Roblox Licensed Audio | ACTIVE | Acoustic melody |
| `BGM_CyberCity` | Music | `rbxassetid://9043887413` | Roblox Licensed Audio | ACTIVE | Synthwave soundtrack for Cyber City |
| `BGM_AncientTemple` | Music | `rbxassetid://9043886567` | Roblox Licensed Audio | ACTIVE | Egyptian desert ambient BGM (Island Main) |
| `BGM_CloudKingdom` | Music | `rbxassetid://9043887720` | Roblox Licensed Audio | ACTIVE | Ethereal celestial harp soundtrack |


## Presentation assets added 2026-10-12

| Asset ID | Location | Status | Dependency / use |
|---|---|---|---|
| UI-006 | src/shared/UITheme.luau | IMPLEMENTED | Lapis/ivory/gold palette, safe-area helpers for HUD, dialogs, navigation |
| UI-007 | src/shared/CatPreview.luau | IMPLEMENTED | CatModelFactory static adoption ViewportFrame, private WorldModel/camera |
| ENV-001 | MapService → CatEmpireWorld inlays | IMPLEMENTED | 136 native non-colliding gold/turquoise parts; no upload |
| ENV-002 | MapService → DesertClouds / CloudController | IMPLEMENTED | 14 atomic three-part cloud groups; client movement |

The HUD's currency/trophy indicators now use text hierarchy rather than emoji pills. Earlier UI-001/002/003 descriptions are historical. Existing source model paths above were corrected from nonexistent OBJ names to actual FBX names; matching Blender source files remain in assets/models. The duplicate legacy `Cat_OrangeTabby` and canonical `Cat_orange_tabby` assets are preserved. Source existence does not prove Studio import or audio asset permission/licensing. See [[Technical/File Inventory]] and [[Testing/Visual Polish Checks]].


## 2026-10-12 optimization dependencies

UI-006/007 remain unchanged visual assets. UI consumers now depend on PresentationState and DataController structural signals; existing pet meshes are reused across unchanged balances. ENV roaming representations are capped at four per plot and managed effects are reversibly disabled in low-detail mode. No new external art, model imports, audio IDs or uploads were introduced.

New system modules: server Modules/ProfileStore.luau and Modules/RequestGuard.luau; shared EconomyDefinitions.luau, ProductionUtil.luau, PresentationState.luau. Dependencies and test evidence are in [[Technical/Optimization Pass 2026-10-12]]; refreshed [[Technical/File Inventory]] records each file.


## Audio corrections — 2026-10-12

Studio playback/Marketplace checks identified eight incorrect audio IDs. Those keys now use nil pending valid replacement assets; original IDs are preserved in src/shared/AssetRegistry.luau comments. UI click uses the bundled volume_slider.ogg and passes Studio preload. See [[Testing/Studio Runtime Checks 2026-10-12]] for the full audit; earlier claims that these placeholder sounds are usable are superseded.


## Design references — 2026-10-12

Added local design procedure references and Figma handoff guidance, plus source-derived UI token JSON; these are documentation and do not add runtime assets. See [[Assets/Figma and Design Workflow]]. Native-only Cat Trainer scope still governs actual assets.


## Native asset remake — 2026-10-12

Active procedural art remade: ten current cats, five station templates, palm, adoption egg, entrance emblems, and architecture/monument finishes. Seventeen editable native models plus manifest/previews are in assets/native-v2. Old Blender/FBX originals are preserved. Builders: CatArtDefinitions, CleanCatBuilder, SanctuaryAssetBuilder, OasisPropBuilder, SceneArtStyle. Runtime uses factory/station/map hooks; exported files are snapshots. Full evidence/limits: [[Testing/Asset Remake 2026-10-12]].


## Required preview/prompt records — 2026-10-12

Every asset task now starts with design/Asset Prompt Enhancer.md and ends with captioned actual previews embedded in its vault note, as recorded in AGENTS.md section 6. Browse [[Assets/Asset Preview Gallery]]. [[Assets/Calico Asset]] demonstrates the full input/context/expanded-output record and 35-to-36-part r1/r2 marking revision. Dedicated snapshots now live inside Assets/Previews; older gallery images retain baseline labels.

### CAT-CALICO / r3 concept reference

Editable Figma: https://www.figma.com/design/QKdv8P5JreMGQsftAFRySh?node-id=2-2. Source SVGs and construction script: design/calico-*. Actual Figma concept preview embedded in [[Assets/Calico Asset]]. CONCEPT RENDERED; visual acceptance and native Roblox implementation pending. Does not replace Cat_calico.rbxmx or establish Studio verification.


## 2026-10-12 — UI and realm gameplay prototypes
- UI-NAV r1: guide pages, common blue panel/button theme and modal exclusivity. [[Assets/UI Navigation Revision]].
- REALMS-BATTLES r1: Verdant Grove/Frostpeak native environments and turn battle UI. [[Assets/Realm and Battle Brief]]. Actual desktop/portrait/landscape snippets under Assets/Previews/REALMS-BATTLES. Placeholder realm art; existing cats retained per user.

## LEADERBOARD — monument tabs, 2026-10-13
Existing geometry with new UITheme-based interactive surface. Original/expanded brief and actual desktop Studio previews: [[Assets/Leaderboard Tabs]]. Source: LeaderboardController, LeaderboardService, LeaderboardUtil. Solo tab interaction verified; mobile and multi-client pending. Preview files: `Assets/Previews/LEADERBOARD/`.

## Cat art pipeline (planned 2026-10-15)
Icons and 3D models for every cat: see [[Assets/Cat Art Pipeline Plan]]. Per-cat prompts are in `Assets/Cat Prompts/` and `design/cat-prompts/cat_prompts.json` (generated by `tools/build_cat_prompts.py`). Nothing has been generated, modelled or uploaded yet.

| `CAT-001` (pilot) | Orange Tabby | Common | A1 Blender pilot | BLENDER PILOT — not imported | `assets/models/orange_tabby_v3/Cat_orange_tabby.fbx` | See [[Assets/Orange Tabby Blender Pilot]] |
