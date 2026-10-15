---
type: asset
id: CAT-CALICO
status: TESTED
last_updated: 2026-10-12
---

# Calico asset — prompt expansion example

## Original request

> Make a calico cat assest

This is the user's example input, retained verbatim. Spelling is normalized only in the expanded brief.

## Verified project context

- Existing species ID: calico. Its gameplay definition is already in CatDefinitions; do not duplicate or alter it.
- Active procedural renderer: CleanCatBuilder with CatArtDefinitions palettes, used through CatModelFactory. Body is the root; Head, paws and tail names matter to consumers.
- Existing soft-toy art: rounded native parts, wedge ears, four paws, curled segmented tail, layered face. Source calico colors: fur RGB 245/232/209, ginger 214/143/85, blue-green eyes 112/154/169, collar 86/134/139. The builder uses charcoal RGB 36/43/53 for dark details.
- Desktop/mobile, native Roblox assets only, no external textures/meshes. Cat models target at most 45 parts; baseline calico has 35.
- Current exported snapshot: assets/native-v2/Cat_calico.rbxmx. Current source and original Blender/FBX assets must be preserved appropriately.

## Prompt applied

The reusable prompt is in design/Asset Prompt Enhancer.md. Its USER_REQUEST is the original sentence above and its PROJECT_CONTEXT is the verified context above.

## Enhanced output

### Goal

Create/refine a clean, cute procedural calico cat for the existing game. Reuse species calico and the established soft-toy asset family. The cat must read as calico at portrait size and in the world.

### Visual specification

Use a warm ivory coat with clearly visible, asymmetric ginger and charcoal patches. Carry the three-color identity through the ears, forehead/flank, selected paws, and tail tip so the cat remains recognizable from more than one side. Give it a rounded body, slightly oversized head, two wedge ears with pink inner ears, four soft paws, and a curved segmented tail. Keep blue-green eyes with small highlights, a pink nose, soft muzzle, and restrained teal collar. Avoid saturated neon, noisy textures, cluttered accessories, or markings that hide the face.

Match the existing family proportions rather than inventing an unrelated body rig: base body 1.75×1.4×2.15 studs and head 2.05×1.75×1.65, scaled consistently through the renderer. Individual surface marking sizes can be adjusted for clarity.

### Implementation constraints

Refine CleanCatBuilder/CatArtDefinitions in place; preserve other species and the existing calico gameplay definition. Retain PrimaryPart Body and existing named model structure. Use anchored, non-colliding/non-touching/non-querying native geometry with no embedded scripts, textures, emitters, or new animation loops. Keep the part count at or below 45 and confirm the pivot/scale and factory integration. Back up the current renderer and generated calico export before replacement.

### Deliverables and checks

Deliver the revised generator appearance, editable Cat_calico.rbxmx snapshot and updated kit manifest. Save actual before/after front/three-quarter snippets inside Assets/Previews/CAT-CALICO and embed them here. Check the render for clear three-color identity, face visibility, clipping/floating markings, and family consistency. Check geometry/part budget and actual Studio generation; record separately what was not tested. No fabricated render or automatic upload/publish.

### Assumptions

Use the project's current soft-toy style and palette. This request concerns appearance, not rarity, stats, acquisition, combat, or evolution. A separate full-game expansion remains outside this small asset example.

## Preview record

### Before — r1, 2026-10-12

![[Assets/Previews/CAT-CALICO/calico-r1-three-quarter-2026-10-12.jpg|480]]

Actual Studio Edit render of the saved pre-refinement source, re-rendered in the same elevated review scene/camera as r2. Source backup: .tools/asset-backup/calico-before-prompt-demo.luau. Baseline: 35 native parts. Earlier captures at ground height were partly occluded by the existing spawn platform, so the retained comparison uses the elevated scene instead.

### After — r2, 2026-10-12

![[Assets/Previews/CAT-CALICO/calico-r2-three-quarter-2026-10-12.jpg|480]]

Actual Studio Edit three-quarter render from the revised CleanCatBuilder. Ginger/charcoal ears and selected paws, charcoal tail tip, and a small additional face patch carry the three-color identity beyond the old two patches. Existing proportions, palette, species ID and gameplay remain unchanged.

### Rear three-quarter — r2, 2026-10-12

![[Assets/Previews/CAT-CALICO/calico-r2-rear-2026-10-12.jpg|480]]

Actual alternate Studio view; helps inspect the tail/flank and the same model from another angle. No image editing or generated concept substitution was used.

## Verification and limits

Actual Studio generation: 36 native parts, Body primary part, anchored and non-colliding/non-touching/non-querying, under the 45-part budget. Temporary render modules are removed after require; the review folder is removed after capture. Source syntax/UI/core checks and native model export/build checks pass. This revision was rendered in Edit mode; its Play-mode follower/worker/mobile appearance and physical-device performance were not retested.

The updated native export and manifest are in assets/native-v2. The global gallery is an older baseline and is labeled accordingly in [[Assets/Asset Preview Gallery]]. Full-game Cat Trainer and Forge setup remain separate pending work.


## Figma redesign brief — r3 concept

# Calico Figma study — 2026-10-12

Original request: "continue the calico design in figma"

Context: calico is an existing Cat Empire species. CleanCatBuilder uses native parts and CatArtDefinitions palettes: ivory #F5E8D1, ginger #D68F55, charcoal #242B35, eyes #709AA9, collar #56868B. The user rejected the r2 visual quality. The existing renderer has oversized wedge ears, small layered eyes, separate spherical paws and raised patch geometry. The new Figma connection created file QKdv8P5JreMGQsftAFRySh. Runtime native-only constraints remain active. This deliverable is a design reference, not a 3D model or gameplay change.

Enhanced output:

- Goal: produce an editable calico concept sheet that resolves the current silhouette, face and patch problems before another Roblox rebuild.
- Visual specification: compact soft-toy silhouette, smaller rounded triangular ears rooted in the head, larger readable blue-green eyes, ivory muzzle and pink nose, integrated paws, rounded tail. Broad asymmetric ginger and charcoal coat areas follow the silhouette; avoid raised dots and floating patch pieces. Front and side drawings use the same palette and identity. Show a portrait-size face check and a labeled coat palette.
- Constraints: retain species/gameplay and original files. No runtime image uploads, mesh imports, paid generation, or external artwork. Use editable Figma vector layers with live captions. Native implementation must preserve Body root and animation consumers, and target at most 45 parts; the drawing alone does not prove that budget can reproduce curved markings.
- Deliverables/checks: editable Figma file with front/side reference, portrait check and handoff notes; retain SVG source; inspect actual Figma screenshot for silhouette, face readability, overlap, alignment and text clipping. Save screenshots under the vault Assets/Previews/CAT-CALICO and embed with date/revision/view/source and concept status. Record Roblox reconstruction pending.
- Assumptions: refine the current warm palette, omit extra accessories beyond a restrained teal collar, use Nunito for the reference sheet. Front/side concept is sufficient to settle silhouette; three-quarter engine verification follows during implementation.

Acceptance: drawings are editable vectors, labels are live text, no clipping or detached-looking paws, three coat colors visible, clear concept-only status, previews saved in the vault. User acceptance of art remains pending.


The user rejected r2 art quality. Earlier TESTED status describes technical checks only; it does not establish visual acceptance. Figma concept preview is pending creation/render. Runtime rebuilding and Studio verification are pending.

## Figma r3 concept — rendered 2026-10-12

[Figma editable design sheet](https://www.figma.com/design/QKdv8P5JreMGQsftAFRySh?node-id=2-2).

![[Assets/Previews/CAT-CALICO/calico-r3-figma-sheet-2026-10-12.png|720]]

Actual Figma render, concept r3, front/side drawings and 128px portrait check. Source: design/calico/calico-front.svg, design/calico/calico-side.svg and design/calico-figma-build.js; full brief: design/calico-figma-brief.md. Sheet node 2:2, file QKdv8P5JreMGQsftAFRySh; rendered 1168×1291. Contains 93 editable vector nodes and live Nunito text. This is a 2D design reference, not a Roblox screenshot or implemented 3D asset.

Review: checked face readability at portrait size, continuous paw/body silhouette, three coat colors, text hierarchy, alignment and clipping. Fixed initial horizontal rows whose fixed heights clipped the cat drawings/notes; corrected screenshot inspected. Initial capture is preserved as calico-r3-figma-initial-2026-10-12.png for history. Decorative concept sheet has no interactive controls; interaction state checks are not applicable. Current palette deliberately reused; do not infer full WCAG certification. Upstream design guidance adapted to an editable character sheet, not web UI.

Current status: CONCEPT RENDERED / USER VISUAL ACCEPTANCE PENDING. Previous r2 technical tests do not establish visual acceptance; the user rejected its quality. Existing Roblox art remains r2. Native 3D reconstruction, marking feasibility under 45 parts, three-quarter Studio render, follower/worker animations and mobile in-game acceptance remain pending. No game art uploaded or published, no gameplay changes.
