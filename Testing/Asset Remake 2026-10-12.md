---
type: implementation-report
status: TESTED
last_updated: 2026-10-12
---

# Clean asset remake — 2026-10-12

User clarified that the task is to remake the actual assets, not provide Figma instructions. This pass replaces current Cat Empire procedural art; it does not claim to complete the separately requested twelve-species Cat Trainer game or its pending Forge setup.

## Plan and acceptance

Inspect actual models, back up the current sources/build, remake the active cats/workstations/props in a coherent soft-toy style, retain gameplay IDs and original assets, compare/render in Studio, verify bounds/part budgets and affected solo interactions, export editable native models, and clean up review objects. Use the project's adapted design guide and sequential hierarchy/rhythm/readability checks. No new paid/imported mesh or texture dependencies.

## Implemented

- Ten current species: rounded body/head/paws, wedge ears (folded for Scottish Fold), layered eyes, cheek/muzzle detail, a segmented curled tail, distinct tabby/calico/tuxedo markings, apron, crown, robot antenna, sphinx headdress, and raised maneki paw. Palettes are data in CatArtDefinitions; geometry is CleanCatBuilder. Existing CatDefinitions/economy/IDs remain unchanged.
- Five stations: layered cushioned bed and bowl, sisal scratching column/perch/toy, tea kiosk/cups/stools/plants, solar play ring, and planted greenhouse. SanctuaryAssetBuilder replaces visual construction only. The runtime starter cat still uses the original spawnCatModel pet/reward path; its Pet prompt was inspected. The exported bed includes a static small display cat.
- Palm: sculpted trunk segments and oval fronds; thirteen static non-interactive parts. Adoption monument: teal egg silhouette, gold belt, ivory paw seal. OasisPropBuilder supplies both; map layout and adoption requests remain unchanged.
- Architecture finish: muted ivory/lapis/teal/gold, cleaner stone surfaces, bounded point-light brightness, paw entrance seals, and rounded sphinx body/head/paws with wedge ears. This is an art treatment of existing geometry, not a replacement world/game mode.
- Purchase/adoption pads have calmer opaque finishes; the adoption pad is circular. Proximity/purchase logic and prices remain intact.
- Inventory: real static species portraits instead of identical cat emoji, at most twelve portrait models per rebuild, taller cards, full-size Close/Follow controls, concise labels, and scrolling/reflow instead of whole-dialog shrinking. CatPreview reframes only on layout changes and disconnects its listener on destruction; no per-frame camera loop.
- Seventeen native model exports, manifest, separate Rojo art-kit project, and original Studio previews saved in assets/native-v2. The old sixteen Blender and sixteen FBX files are unchanged. Legacy builders remain available; UseLegacyAssetArt on factory/map/tycoon provides art rollback.

## Actual verification

- Studio target: CatEmpire, PlaceId 0. Edit inspection confirmed ReplicatedStorage.CatModels was empty; therefore these procedural assets are the active visuals.
- Pre-pass source/build backup: .tools/asset-backup. Original cat builder retained for before/after gallery. All temporary Edit review folders were removed; Play-only reviews disappear on Stop.
- Studio geometry generation/assertions for all ten cats: PrimaryPart Body, positive sizes, anchored/non-colliding/non-touching/non-querying parts, no scripts/emitters, ≤45-part budget. Actual counts: 33–39. Five station templates: 12–46 parts, ≤60 budget; palm 13.
- Before/after cat screenshot and final cat/station galleries inspected. Source changed after captures only for pivot alignment, optional runtime display-cat routing, and subsequent scene finish; core template appearances match the exported models.
- Fresh solo startup: all ten services and fifteen controllers loaded without console errors. Default isolated memory store confirmed; no live save or publishing.
- Actual free-pad ProximityPrompt granted starter and built Sanctuary_v2 station. Pet prompt remains present. Adoption ceremony rendered the remade tabby. Inventory structural update rendered one actual portrait. Petting reward itself was not replay-tested in this pass.
- iPhone 17 Pro portrait viewport 401×778: inventory panel 377×440; Close 44×44, Follow 129×44. Landscape also captured; short-height card content requires scrolling. This is device simulation, not a physical phone test.
- Final map Play confirmed Sanctuary_v2 finish, EggArt marker, and thirteen-part palm; fresh console remained error-free after the later monument finish.
- All seventeen `.rbxmx` exports parsed, non-collision/anchoring/pivot data checked, and separate art-kit Rojo build passed. Exporting the new egg initially encountered a stale editor module cache; fixed by requiring temporary copies of our modules, then destroying them. No supplied Forge module was copied or extracted.
- Local project validation: 48 Luau files compile, six-viewport/seven-modal layout suite plus layer/reflow checks and 81 offline core assertions pass. Rojo builds and source syntax do not establish Roblox type-analysis success.

## Remaining limits

The new cats have more geometry than their predecessors (33–39 versus 16–17 parts). Production roaming caps and portrait limits bound some cost; CPU/GPU/memory measurements, physical mobile performance, large inventories, complete station purchase chain, equipped/follower/worker scenes, and multiplayer remain pending. No claim of a numerical 1000× improvement or fully verified game is made.

Forge agreement/EmitModule setup remains pending and untouched. This user-authorized geometry/asset remake proceeds independently of the earlier full-game build phase; it does not bypass Forge licensing or manufacture effects. UI gamepad/keyboard behavior and the other scaled dialogs still need broader accessibility acceptance.

See [[Assets/Asset Registry]], [[Systems/UI]], [[Technical/Continuation Guide]], and local assets/native-v2/README.md for kit use/rollback.
