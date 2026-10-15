---
type: changelog
id: CHANGELOG-MAIN
title: Cat Empire — Project Changelog
last_updated: 2026-10-15
status: ACTIVE
tags:
  - changelog
  - release
---

# Cat Empire — Project Changelog

## [0.1.0-pre] — 2026-10-11

### Initial Setup & Knowledge Base Scaffolding
- Added `GEMINI.md` and `AGENTS.md` specifying architecture, security, and development workflow.
- Established authoritative Obsidian knowledge base inside `Obsidian/Cat Empire In CLI/`.
- Created central navigation hub (`Home.md`), `Development Rules.md`, `Workflow.md`, and master roadmap.
- Initialized `default.project.json` for Rojo synchronization.
- Verified Rojo 7.7.1 installation, generated valid DataModel sourcemap, and deployed `RojoManagedPlugin.rbxm` to Roblox Studio plugins directory.
- Created Luau starter files with `--!strict` typing (`Types.luau`, server/client init stubs).
- Configured asset tracking registers (`assets/CATALOG.md` and `Assets/Asset Registry.md`).

### [0.2.0-alpha] — 2026-10-11
- Implemented strictly-typed `Signal.luau` module (GoodSignal node pattern).
- Implemented modular 2-phase lifecycle framework (`OnInit`, `OnStart`) in `init.server.luau` and `init.client.luau`.
- Built authoritative `PlayerDataService.luau` with automatic in-memory mock store fallback for offline Studio development, session-persistence, autosaving, and server-to-client replication.
- Built `DataController.luau` client controller dispatching `DataLoaded`, `DataUpdated`, and `CurrencyChanged` signals.
- Created `CatDefinitions.luau` defining the first 10 cat species (Orange Tabby through Golden Maneki).
- Created `NetworkUtil.luau` for reliable, type-safe remote instance management.

### [0.3.0-alpha] — 2026-10-11
- Built `CatService.luau` handling authoritative cat grants, gacha adoption rolls, and merging.
- Created `CatUtil.luau` containing rarity weights, production yield compounding formulas, and merge validation.
- Built `InventoryController.luau` rendering an interactive on-screen Cat Sanctuary Collection Drawer with cards, rarity banners, level indicators, and real-time merging controls.
- Added repeatable Mystery Cat Adoption Box pad to sanctuary plots (50 Fish Coins).
- Added `AssetRegistry.luau` for hot-swapping procedural models with real 3D assets and textures.

### [0.4.0-alpha] — 2026-10-11
- Implemented `PrestigeService.luau` with square-root curve rebirth calculation and permanent $+25\%$ per Golden Yarn multiplier perks.
- Built `PrestigeController.luau` rendering a dedicated Rebirth dialog with live statistics and confirmations.
- Added `ResetPlot` hook into `TycoonService.luau` so sanctuary plots rebuild cleanly after rebirth.
- Built `PetFollowController.luau` rendering smooth 3D animated companion cats that follow players on `RenderStepped`.
- Added companion equip/follow buttons to cat cards in `InventoryController.luau`.
- Added `Systems/Prestige.md` to the Obsidian knowledge base.

### [0.5.0-alpha] — 2026-10-11
- Added interactive Cat Petting system to roaming sanctuary cats with floating hearts billboard and coin rewards.
- Built `ExpeditionService.luau` managing timed missions across Sunny Meadow, Catnip Canyon, and Cosmic Nebula.
- Built `ExpeditionController.luau` providing mission selection, live second countdowns, and reward claiming.
- Added `Systems/Expeditions.md` to Obsidian vault.

### [0.6.0-alpha] — 2026-10-11
- Implemented `CombatUtil.luau` with pure auto-battle simulation engine, speed-based turn order, and 10 signature cat abilities.
- Built authoritative `CombatService.luau` managing 3 Arena Leagues (Alley Prowlers, Cyber Syndicate, Celestial Coliseum) and Battle Trophy progression.
- Built interactive `CombatController.luau` featuring league matchmaking, round-by-round combat logs, and victory fanfare screens.
- Added `battleTrophies` to `Types.luau` player save data contract.
- Added `Systems/Combat.md` to Obsidian knowledge base.

### [0.7.0-alpha] — 2026-10-11
- Built server-wide Cat Parade event system (`ParadeService.luau`, `ParadeController.luau`) granting 2x sanctuary income multipliers.
- Spawns physical 3D Sanctuary Leaderboard Monument in the central plaza (`LeaderboardService.luau`) displaying top player trophies and wealth.
- Implemented modular 5-station Tycoon structures (Starter Bed, Scratching Post, Cat Cafe, Laser Arena, Catnip Greenhouse) with full 3D models.
- Added Cat Workstation Assignment (`StationUIController.luau`), enabling players to assign feline workers from their inventory to multiply station income.
- Rendered animated 3D worker cat models physically stationed at their desks with role titles and multiplier badges.
- Implemented Multi-World Realm Travel System (`WorldService.luau`, `WorldController.luau`, `WorldDefinitions.luau`) featuring Cozy Meadow, Neon Cyber Cat City, Ancient Feline Temple, and Celestial Cloud Kingdom unlocked with Golden Yarn.
- Added Central Realm Travel Portal in sanctuary plaza with proximity prompt and screen fade travel transitions.
- Added `Systems/Workstations.md` and `Systems/Worlds.md` to Obsidian knowledge base.

### [0.8.0-alpha] — 2026-10-11
- Built `AudioController.luau` implementing a 12-channel pre-allocated sound pool under `SoundService` with randomized pitch variation.
- Integrated ambient background music for all 4 realms with smooth linear cross-fades upon world travel.
- Added tactile sound effects for UI clicks, coin collection, cat petting purrs, merge ascending chimes, celestial rebirth gongs, portal whooshes, and arena combat hits.
- Built `FXController.luau` handling rising floating `+N 🐟` coin indicators, celebratory confetti bursts, merge sparkles, and mobile low-detail performance toggles.
- Built `SettingsController.luau` modal with toggles for BGM, SFX, and Low Detail Mode, alongside asset attribution credits.
- Expanded `AssetRegistry.luau` and `assets/CATALOG.md` with verified Roblox audio asset IDs.
- Added `Systems/Audio & VFX.md` to the Obsidian knowledge base.

### [0.8.1-alpha] — 2026-10-11
- Fixed model animation part detachment: converted follower pet and plot cat bounce routines to `Model:PivotTo()`, preventing ears, head, and billboards from freezing in space.
- Added full Tycoon station persistence: saved built stations to `PlayerData.tycoon.stations` and restored all owned structures upon rejoining.
- Added duplicate plot and session initialization guards for seamless Roblox Studio Play Solo testing.
- Fixed missing `Types` module import in `AudioController.luau`.
- Automatically spawn equipped follower pet on load without needing manual drawer toggle.
- Aligned bottom navigation toolbar (`Inventory`, `Expeditions`, `Arena`, `Realms`) with uniform 10px spacing.

### [0.9.0-alpha] — 2026-10-11
- Generated complete 3D asset library using local Blender 4.5 via automated CLI scripting (`assets/scripts/generate_all_assets.py`):
  - 10 Cat Breeds: Orange Tabby, Tuxedo, Calico, Scottish Fold, Siamese Barista, Persian Royal, Robo-Kitten, Shadow Panther, Cosmic Sphinx, Golden Maneki (both `.blend` and `.fbx` formats).
  - 4 Tycoon Stations: Scratching Post, Cat Cafe, Laser Arena, Catnip Greenhouse.
  - Mystery Adoption Gift Box with decorative ribbons and top bow knot.
- Created `MapService.luau` generating a lush 12-player sanctuary island:
  - Giant circular natural grass island with stone retaining cliff perimeter.
  - Grand Central Plaza with Paw-Print Fountain, sparkling water, and Golden Maneki monument.
  - 12 radial cobblestone promenades connecting sanctuaries directly into the central plaza.
  - Foliage grove with 28 oak trees, 12 flowering cherry blossom trees, and lantern streetlamps.
  - Cinematic golden-hour lighting with Bloom, SunRays, Atmosphere, and ColorCorrection.
- Expanded `TycoonService.luau` to a 12-Player radial multiplayer grid (`MAX_PLOTS = 12`):
  - Dynamic plot allocation and recycling pool.
  - Inward-facing plots connected to central plaza promenade.

### [0.9.1-alpha] — 2026-10-11
- Fixed floor flashing (Z-fighting): hidden default Roblox Studio Baseplate and enforced strict non-overlapping Y layering (Island Y=0.0, Courtyard Y=0.25, Promenades Y=0.25, Foundations Y=0.35, Lawns Y=0.6).
- Pre-built all 12 player sanctuary sections at server startup:
  - Each lot features a raised stone terrace foundation, manicured grass lawn, and white wooden picket fences on 3 sides.
  - Grand entrance archway with dual wooden posts and overhead signboards dynamically toggling between "Available Sanctuary Lot" and "{Player}'s Cat Sanctuary".
  - Clean station isolation inside dedicated per-plot containers.

### [0.9.2-alpha] — 2026-10-11
- **Dramatic Gacha Unboxing Ceremony (`GachaController.luau`)**:
  - Full-screen cinematic adoption ceremony with background darkening, screen blur, 3-stage wobbling & shaking gift box, celebration confetti burst, and spring-scale reveal card modal with "AWESOME" collect button.
- **Juicy UI & Flying Coin VFX (`HUDController.luau`, `FXController.luau`)**:
  - Attached `UIScale` spring-punch animation (`Scale = 1.25 -> 1.0`) on currency gains.
  - Added flying golden fish coins travelling from screen center to the top-left HUD counter.
- **Upgraded All 5 Tycoon Stations to Luxury 3D Visuals (`TycoonService.luau`)**:
  - **Starter Cloud Bed**: Circular birch platform, quilted mattress, 8-part bolster cushion ring, folded lavender blanket, mint pillow, feeding mat with ceramic milk bowl & terracotta kibble dish, bedside stool with glowing lantern, and sleeping orange tabby with floating animated "💤" BillboardGui.
  - **Luxury Scratching Castle**: Stepped walnut base with emerald carpet, Level 1 enclosed cylindrical cat cave condo with entrance portal, sisal rope wrapped scratching column with banded twine rings, Level 2 lounging hammock shelf with hanging swaying yarn pom-pom on string, and Level 3 lookout crow's nest perch with 4 golden finials.
  - **Cozy Feline Cafe**: Polished hardwood deck, 4 bronze roof pillars, European striped awning with strawberry-pink and vanilla-cream fabric stripes, mahogany counter with marble top, dual-group chrome espresso machine with steam particle emitter, ceramic cups, clear glass pastry showcase with mini croissants and fish cookies, brass pendant lamps with PointLights, and A-frame chalkboard menu.
  - **Cyber Laser Arena**: Dark octagonal platform, pulsing neon cyan perimeter trim, neon laser grid lines crossing the floor, 4 high-tech corner emitter pylons with glowing cyan/magenta crystal prisms, 2 crisscrossing overhead laser beams, and an animated red laser dot darting across the floor with red PointLight.
  - **Royal Catnip Greenhouse**: Terracotta brick foundation terrace, white wrought-iron structural frame, crystal clear emerald glass canopy, raised dark soil planters, clusters of blooming catnip bushes with glowing purple flowers, magical floating pollen sparkle particle emitter, carved marble birdbath, and wooden potting bench.
- **Autonomous Cat Wandering AI (`TycoonService.luau`)**:
  - Plot cats now autonomously wander the sanctuary grounds with waddling paw-step tilts and tail bobs, resting periodically.
  - Interactive "Pet" ProximityPrompt turns the cat toward the player, emits heart particles, purrs `💖 Purrr! (+Coins)`, and gives coin rewards before resuming roaming.
  - Restores up to 4 unassigned cats from player inventory on join so plots immediately have cats roaming around.
- **Central Plaza & Island World Enhancements (`MapService.luau`)**:
  - Dedicated `PlazaSpawnLocation` with golden inlay rim and welcome billboard.
  - 4 carved wooden park benches with cast-iron legs around the fountain circle.
  - Grand Central Adoption Festival Pavilion with octagonal stage, 6 classical columns, purple striped canopy dome, and the giant Mystery Gift Box Monument with floating sparkles and banner.
  - 12 decorative flower planter urns with blooming tulips/roses at each promenade entrance.
  - 10-14 stylized puffy cartoon clouds drifting lazily across the sky above the island.
  - Cherry blossom trees shedding gentle falling pink petals that flutter on the wind.

### [0.9.3-alpha] — 2026-10-11
- **Massive 1000-Stud Egyptian World Expansion (`MapService.luau`)**:
  - Expanded island footprint from 480 to **1000 studs** diameter with golden sandstone plateau and encircling turquoise Nile moat.
  - Expanded Central Sanctuary Plaza from 90 to **160 studs** diameter with concentric gold hieroglyphic inlays.
  - Widened and extended 12 Grand Royal Processional Avenues (radius 80 to 250 studs, 12 studs wide) flanked by mini-obelisks and flaming bronze fire braziers.
- **The Colossal Great Sphinx Cat of Bastet**:
  - Towering Sphinx Cat monument carved from golden sandstone with royal Nemes headdress, lapis lazuli collar, golden claws, and glowing emerald neon eyes.
  - Surrounded by an expansive 46-stud Sacred Lotus Pool with clear turquoise water, floating blue lotus pads, and 4 corner Bastet Obelisks capped with electrum pyramidions.
- **Distant Desert Pyramids & Skyline Horizon**:
  - Added 3 monumental stepped pyramids rising from the outer desert dunes (up to 50 studs high with gold capstones).
- **Date Palms & Oasis Foliage**:
  - Date palms with curved segmented trunks, arching fronds, and golden date clusters lining every royal avenue.
- **Egyptian Temple Courtyard Sanctuaries (`TycoonService.luau`)**:
  - Expanded plot radial placement to **280 studs** (giving a massive 86-stud separation between plots to eliminate crowding).
  - Enlarged each plot to a 68x68 sandstone terrace with 62x62 golden sand courtyard and sandstone parapet balustrades.
  - Monumental Egyptian Pylon Gateway with winged sun disc crest, twin flaming torch braziers, and hieroglyphic stele signage.
- **Egyptian Tycoon Stations**:
  - *Pharaoh's Cloud Daybed*: Ebony & gold daybed, royal purple pleated mattress, lapis bolster, and alabaster offering bowl.
  - *Obelisk of Bastet*: Stepped sandstone dais, palm-fiber sisal ropes, and glowing gold electrum pyramidion.
  - *Nile Oasis Tea Pavilion*: Colonnade terrace, papyrus columns, turquoise striped linen awning, and golden samovar with rising steam.
  - *Sun God Ra's Solar Sanctum*: Sun disc platform, 4 quartz crystal obelisks, and animated sacred red solar dot.
  - *Hanging Gardens of Bubastis*: Colonnaded sandstone conservatory, aqueduct water channels, blooming lotus flowers, and golden pollen particles.

### [0.9.4-alpha] — 2026-10-11
- **Central Plaza 4-Quadrant Cardinal Layout Alignment**:
  - *Center (`0, 0, 0`)*: The Colossal Great Sphinx Cat of Bastet & 46-stud Sacred Lotus Pool.
  - *South (`0, 0, 50`)*: Grand Sun Disc Spawn Platform facing directly towards the Great Sphinx.
  - *North (`0, 0, -50`)*: Pharaoh's Adoption Sanctum with 8 papyrus columns and mystery cat box altar.
  - *West (`-52, 10, 0`)*: Sanctuary Leaderboard Monument with twin gold pillars and live SurfaceGui ranking board facing East.
  - *East (`52, 0.8, 0`)*: Grand Realm Travel Portal Monument with glowing electrum archway and purple vortex facing West.
- **Audio Atmosphere Alignment (`AudioController.luau`)**:
  - Bound starting sanctuary music to `BGM_AncientTemple` (`rbxassetid://9043886567`) for authentic Egyptian desert ambience.
  - Throttled coin pickup SFX to only trigger on positive currency collection (`delta > 0`).
- **UI Hardening & Animation Scope Fix (`HUDController.luau`)**:
  - Fixed module-level scoping for `_coinsScale` and `_yarnScale` UIScale instances, ensuring bounce punch animations trigger reliably on currency gains.
- **Teleportation Destination Safe-Landing (`WorldService.luau`)**:
  - Aligned Cozy Meadow return point to `Vector3.new(0, 5, 50)` so returning players land gracefully on the sun disc platform without intersecting lotus pool or monument geometry.





## [Unreleased] — 2026-10-12

- Audited source/vault/assets; added README, continuation guide, dated audit, generated file inventory, and repeatable offline checks.
- Recorded release blockers and corrected unsupported current verification claims while retaining historical records.
- Added shared Egyptian UITheme, live sanctuary HUD, fitting modal layouts, and responsive four-action navigation.
- Added responsive adoption ceremony with a static species-specific 3D CatPreview using existing CatModelFactory.
- Added genuine gold plaza ring segments, turquoise avenue borders, gold lane diamonds, and softer bloom/sunrays/saturation.
- Grouped all cloud puffs and moved animation to a local CloudController, with reduced updates in low-detail mode.
- Updated displayed starter world identity while preserving saved CozyMeadow ID.
- Corrected Obsidian asset paths to actual FBX sources and registered native presentation assets.
- Validation: official Luau syntax compilation, actual UI helper mock checks, Rojo build/sourcemap, and git diff whitespace checks pass. Roblox type analysis, Studio visuals/gameplay, saves, and multiplayer are NOT RUN. See [[Testing/Visual Polish Checks]].
- No publishing or changes to existing gameplay reward/persistence behavior.


### [Unreleased] — 2026-10-12 — Reliability and optimization pass

- Replaced unsafe live-load fallback/SetAsync with fail-closed ProfileStore ownership leases and bounded UpdateAsync retries; added default isolated Studio memory store, profile validation, staggered renewal, shutdown save waiting.
- Added abortable structural transactions, compatible starter/expedition fields, data-ready plots, idempotent starter grants, atomic purchases/adoption/mission claims, assigned-merge rejection/equipped reference transfer and selected server request guards.
- Persisted expedition timestamps; rejected early/duplicate claims and replacement of finished unclaimed missions.
- Replaced income-tick inventory replication/cloning with versioned balance patches and cached ProductionUtil rates; added lightweight stats snapshots and structural-only client signals.
- Reused unchanged pet models, fixed missing LocalPlayer, reduced inventory/HUD rebuilding, fixed empty labels/returning rarity labels, bounded roaming cats to four per plot and reduced server motion updates.
- Added reversible scene low-detail handling; centralized existing economy math. Ten-second battle cooldown is a new pacing/safety setting.
- Verification: 43 game scripts compile, UI mock suite and 81 core assertions pass; Rojo build passes. Real Roblox type/runtime/API/multiplayer and measured performance are NOT RUN. No live data edits or publishing.
- See [[Technical/Optimization Pass 2026-10-12]] and updated [[Technical/Continuation Guide]].


### [Unreleased] — 2026-10-12 — Studio integration setup

- Confirmed running Rojo and open Studio process. Registered the already installed official Studio MCP launcher in Codex config, preserving other connections.
- Added tools/studio_mcp.py and [[Technical/Roblox Studio MCP]] for bounded direct discovery/text-tool diagnostics. Protocol initialization passes, but discovery returned zero tools; user-side Studio enablement is pending. No engine test, live save, or publishing performed.


## Studio verification and runtime fixes — 2026-10-12

Verified official MCP access and source sync. Fixed missing ceremony remote initialization, modal overlays behind HUD/parade, portrait navigation overlapping jump, and eight non-audio IDs; replaced missing click sound with a successfully preloaded bundled sound. Local solo starter/adoption checks and phone inventory screenshots passed for documented cases. Studio restored to Edit/default viewport. See [[Testing/Studio Runtime Checks 2026-10-12]].


## Cat Trainer tooling setup — 2026-10-12

User removed the project-only modification rule. Installed supplied Forge plugin unchanged (matching SHA256), installed/read required roblox-vfx skill, and recorded authorization in AGENTS.md. Existing Studio session still needs plugin reload and user agreement via Forge's Emit Module workflow. MCP connection and reversible test pass; no game systems replaced/published and no live saves touched. [[Technical/Cat Trainer Step 0]].


## Design and Figma reference workflow — 2026-10-12

Vendored the requested design library Codex prompt/14 procedures with MIT license at pinned commit, preserving existing AGENTS rules. Added Roblox-specific design guidance, Figma tutorial, and a source-derived UI token JSON. Verified all upstream copy hashes and JSON. No runtime assets, uploads, cloud editing, or gameplay changes. [[Assets/Figma and Design Workflow]].


## Native asset remake — 2026-10-12

Rebuilt active cat and workstation art in a cohesive rounded style, sculpted palm/adoption egg and scenery finishes, and added seventeen editable native exports. Inventory uses bounded true portraits, projected camera framing, taller cards and full-size mobile reflow. Legacy binary assets/builders preserved, geometry and solo Play checked, phone Close/Follow measured at 44px, source/UI/core checks and main/kit builds pass. [[Testing/Asset Remake 2026-10-12]].


## Prompt-to-asset workflow and vault previews — 2026-10-12

Added user-required prompt expansion and embedded preview rules to AGENTS and Development Rules, reusable design/Asset Prompt Enhancer.md, and seven actual Studio screenshot attachments in the vault. Calico example records original input, verified context, expanded output, before/after/rear renders. Refined calico markings within the existing style; 36 parts. Export refreshed with backups, manifest updated, other snapshots unchanged. [[Assets/Calico Asset]] and [[Assets/Asset Preview Gallery]].

## 2026-10-12 — Calico editable Figma concept

Created and inspected front/side vector calico design sheet, portrait check, palette and Roblox handoff. Figma link and actual r3 concept screenshot recorded in Assets/Calico Asset; preserves older r1/r2 renders and identifies user's visual rejection. Editable vector source in design/calico-front.svg and design/calico-side.svg. Runtime model reconstruction remains pending.

## 2026-10-12 — First-session gameplay guide

User deferred art revisions. Added persisted onboarding milestones, server-only advancement, skip/general help, and one-time 100 Fish Coin completion bonus. Migrates existing starter owners without forced onboarding. Reuses current theme/art. [[Systems/Onboarding]] records 99 offline checks, solo Studio loop, desktop interactions, phone layout and limitations. Full Cat Trainer conversion remains pending.


## 2026-10-12 — Interactive battles and explorable realm prototypes
- Replaced immediate arena simulation UI with server-authoritative move turns, HP/PP, types, switching, guard/rest, forfeit and safe session recovery.
- Added free Verdant Grove and 3-Yarn Frostpeak, realm rivals, native walkable prototypes and return prompts. Atomic world purchase and travel fade recovery fixes.
- Repaired nine blocked avenue entries, permanent paged Guide review, brighter rounded UI and exclusive modals.
- Local Graphify code graph generated; actual rendered snippets and test evidence saved in Obsidian. 55 source compilation /135 assertions /Rojo build /solo Studio checks pass. See [[Testing/Realms and Turn Battles 2026-10-12]].


## Source review fixes — 2026-10-13

Fixed BUG-019 to BUG-028 (see [[Bugs/Bug Tracker]]): expedition/realm/station menus no longer rebuild every second, adoption ceremonies queue, adoption pad no longer drains coins, realm bonus ends on rejoin/respawn/rebirth, failed final save no longer blocks rejoin, battle cooldown and team selection corrected, late-join pet and parade sync, follower snaps after teleports. Added `Types.HOME_WORLD`. Offline suite extended to 149 assertions (PrestigeService now exercised). Evidence: 55 files compile, UI layout suite and 149 core assertions pass. Studio runtime, multiplayer and live saves NOT RUN: the Studio MCP bridge listed no connected Studio this session. Asset direction changed to Blender (ADR-014); no assets changed.


## UI overhaul, simulator style — 2026-10-13

Rebuilt `UITheme` and restyled all twelve UI controllers after the user's reference screenshots: coloured glossy header bars, red X close, dark slate bodies, thick outlines, Fredoka One outlined text, rarity/realm coloured cards, accent-coloured buttons. Brief and limits: [[Assets/UI Overhaul 2026-10-13]]. Offline layout and core suites pass; **no Studio render yet (preview pending)**.


## UI art kit from Blender — 2026-10-13

Added `assets/ui/` (stud tile, sunburst, 12-icon sheet, Blender source, concept mockup) and image/icon support in `UITheme` (`UITheme.images`, `UITheme.icon`, stud and ray layers, left-hand menu column on large screens). Asset IDs are empty until the user uploads the three PNGs, so the game still shows the plain revision. See [[Assets/UI Overhaul 2026-10-13]].


## UI art uploaded and verified in Studio — 2026-10-13

Uploaded the stud tile, sunburst and icon sheet (IDs in `UITheme.images` and [[Assets/UI Overhaul 2026-10-13]]). Solo Studio Play confirms studs, rays and icons render on the HUD, menu, My Cats, new-cat reveal, Rebirth and Settings. Fixed along the way: menu/HUD overlap, small titles, clipped empty-inventory text, grey button text, opaque cat portraits. Phone layouts and the remaining windows are not yet re-captured.


## My Cats index-style window — 2026-10-13

Rebuilt the My Cats window to follow the user's Pet Index reference (card grid, detail card, action panel, collection bar). Studio-verified on desktop for browsing and Follow; merge completion and phone layouts not yet exercised. See [[Assets/UI Overhaul 2026-10-13]].


## Figma style across the UI — 2026-10-13

Ported the Figma My Cats design to the shared theme and all windows (Montserrat Heavy, thick text outlines, taller headers, squarer corners, stronger card colours) and added the Following column to My Cats. Studio-verified on desktop for seven windows; Rebirth, stations, live battle, merge completion and phone layouts still to check. See [[Assets/UI Overhaul 2026-10-13]].


## Claude Design window style — 2026-10-13

At the user's choice, the whole UI moved to the light Claude Design look (white windows, lavender panels, indigo outlines, pastel rarity cards, coral My Cats header, Fredoka One). See [[Assets/UI Overhaul 2026-10-13]] revision 5.


## UI idle motion — 2026-10-13

Spinning rays, bobbing cat portraits, a wiggling selected card, a pulsing Merge button and press feedback, driven by one shared loop and switched off by Low detail mode. Sampled moving in Studio. See [[Assets/UI Overhaul 2026-10-13]] revision 6.


## Map fixes — 2026-10-13

BUG-029 to BUG-038: baseplate grid and sand flicker, stray spawn, invisible palm fronds and other squashed round parts (`RoundShape`), plot gates now face their avenues with four walls, pads moved clear of entrances, legacy realms moved off the island rim, open sea added. Verified by before/after Studio captures; see [[Bugs/Bug Tracker]].


## HUD and MY PETS from the user's mockup — 2026-10-13

Whole UI moved to the dark mockup look: currency pills, two mirrored columns of frameless icons (Pets, Explore, Battle, Shop / Rewards, Settings, Catpedia, Rebirth), striped purple header, glossy buttons, new MY PETS window with EQUIP BEST and AUTO-MERGE. Expeditions window and guide step removed from the client; the server service remains. Shop and Catpedia are placeholders. Captured in Studio; see [[Assets/UI Overhaul 2026-10-13]] revision 8 for what differs from the mockup and what is unverified.


## Rebirth window, 3% yarn bonus and Owner Panel — 2026-10-13

- REBIRTH rebuilt from the user's second mockup in the MY PETS style, with a two-press confirm. See [[Assets/UI Overhaul 2026-10-13]] revision 9.
- Golden Yarn income bonus lowered from 25% to 3% per yarn (user request).
- Owner Panel (idea J): server-authorised grants of coins, yarn and cats, parade start/end, filtered announcements, kick, timed ban and unban, with an activity log. See [[Systems/Owner Panel]].


## Housekeeping — 2026-10-13

Project root, `design/`, the scratch folder and the vault root were tidied (moves only, nothing deleted). New vault folders `Ideas/` and `History/Legacy Notes/`; Home has a vault map. See [[Technical/Reorganization 2026-10-13]].

## 2026-10-13 — monument leaderboard categories
- Added per-viewer Trophies, Collection and Coins tabs, this-server scope, tied ranks, scrolling rows and five-second updates.
- Track historical unique discoveries and cumulative gameplay earnings; exclude new owner coin/cat grants. Preserve old balances; prior earnings are unavailable and start at zero.
- Added migration/ranking/service regression coverage and saved real Studio previews. [[Systems/Leaderboards]] · [[Assets/Leaderboard Tabs]].


## Login Rewards — 2026-10-13

Seven-day Login Rewards window behind the Rewards button once the starter guide has ended: one claim per 24 hours, missed days keep progress, placeholder reward values. Two temporary owner testing buttons (skip guide, make reward ready). Full week claimed in Studio. See [[Systems/Login Rewards]].


## Follow-up — 2026-10-13

Owner skip-guide button and action removed. Leaderboard tabs (Trophies, Collection, Coins; this server) were completed by Codex and work in solo play. Everything still untested, including the leaderboard with other players, is now listed in [[Testing/Not Yet Tested]].


## Catpedia — 2026-10-14

Catpedia window built from the user's Claude Design artboard: rarity categories with medals, every species as a card (undiscovered ones as silhouettes), search, a locked-cards switch, a spotlight with details, lore, sound and a spin preview. New: a small station-income bonus per species owned, and collection milestones paid by CLAIM REWARDS. Values are placeholders. See [[Systems/Catpedia]].


## Explore = PvE, Battle = PvP (phase 1) — 2026-10-14

Battle now runs friendly duels against other players in the server (invite, accept, both choose each turn, no rewards). Explore is the PvE hub: the Starter Trail and each world's rival fight are opened from it. Later phases (in-world fights, carrier caches, bosses, parties) are planned in [[Systems/Explore and Battle]].

## Late night session — 2026-10-14/15
Working through [[Chat Ideas]], easiest first. Full record: [[Late Night Session]].
- **Explore window** rebuilt from the Claude Design artboard:
  - modes, including Events with the live Cat Parade card;
  - painted world cards and COLLECT REWARDS milestones;
  - World & Party with party circles.
- **Every world has a rival fight**, including the new **Sky Guardians** boss in Cloud Kingdom.
- **Results screen** with a clear next step: play again, next fight, or back.
- **Shop:** four cat carriers (Starter, Cozy, Royal, Starlight) with real odds. See [[Systems/Shop]].
- **Carrier caches** in five worlds: one free cat a day each. A blocked prompt was found and fixed in Studio.
- **Five new species** (Grey Shorthair, Ragdoll Snowpuff, Bengal Ember, Maine Coon Ranger, Aurora Lynx). **Mythic** is now obtainable (0.2% of a plain roll).
- **Catpedia:**
  - a "Best chance" carrier note (a crash in it was fixed);
  - **PIN GOAL**, with a goal chip on the HUD.
- **Pets:**
  - **PRACTICE** against a Training Dummy, with no rewards;
  - **KEEP**: a kept cat is never used up in a merge.
- **Explore:**
  - **team presets** (Solo / Boss / Friends);
  - a **party ready check**, where GO ANYWAY means it never locks the party.
- **Tooling:** `tools/validate_project.py` now also runs a `luau-analyze` unknown-name check. Totals: 844 core and 80 Fight Map assertions pass.
- All reward numbers added tonight are placeholders. Parties, ready check and PvP are tested offline only, because they need two players.

## Early morning session — 2026-10-15
More [[Chat Ideas]], continuing from the late night session. Full record: [[Early Morning Session]].
- **Trading at spawn:**
  - requests over nearby players, an offer window with four cats a side, READY, a 5-second review and CONFIRM;
  - an all-or-nothing two-profile exchange with receipts;
  - a Trade requests ON / FRIENDS ONLY / OFF setting;
  - a **trade journal**: a trade commits through one DataStore record and recovers on the next load after a crash.

  See [[Systems/Trading]].
- **Spawn boss event:**
  - a four-boss rotation every 15 minutes in an arena in the spawn plaza;
  - JOIN, ATTACK (F), marked boss moves to dodge, and double-damage openings;
  - prizes for every eligible trainer, paid once per slot.

  See [[Systems/Boss Event]].
- **Upgrade map** on each cat: Strength, Toughness and Agility, bought with coins. Upgrades carry through merges and trades. See [[Systems/Upgrade Map]].
- **Explore:**
  - rival trainers standing in every rival world;
  - a fight boost chosen before each rival fight;
  - the spawn boss in EVENTS.
- **Leaderboards:** Boss Wins and Team Power tabs, a THIS WEEK view (Monday 00:00 UTC), your own row, and **GLOBAL TOP 50** boards.
- **Security:** a saved owner audit log, and an overall request budget per player.
- **Owner Panel:** the cat grid now scrolls with 15 species.
- Offline totals: **987 core** and 80 Fight Map assertions; 89 files compile; 0 unknown-name problems.

## Cat art pipeline plan — 2026-10-15
A plan for cat icons and 3D models: Blender as the master, 12 body archetypes × coat textures, and icons rendered from the models. There are icon and 3D prompts for all 1,015 cats (15 live, 998 catalog, 2 special), generated from the catalog. See [[Assets/Cat Art Pipeline Plan]]. No art was made.

## Cat art pipeline pilot — 2026-10-15
The Orange Tabby was built in Blender with the planned method: a fused soft-toy body, a baked coat, a rig and Idle clip, an icon rendered from the model, an FBX, and reference design v1. It is **not imported into Roblox** yet. See [[Assets/Orange Tabby Blender Pilot]].

## Cat art: your two styles — 2026-10-15
- **Prompts** for all 1,015 cats were regenerated. Icons are now 2D cartoon chibi; in-game cats are low-poly faceted with real proportions. Your style references are in `design/reference/user-style/`.
- **The Orange Tabby was rebuilt in both styles:** a toon-rendered icon, and a 2,200-triangle in-game model with Idle and Walk clips plus an FBX. It is not imported into Roblox yet. See [[Assets/Orange Tabby Blender Pilot]].
