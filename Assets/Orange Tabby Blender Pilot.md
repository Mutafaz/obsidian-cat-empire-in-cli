---
type: asset
id: CAT-ORANGE-TABBY
title: Orange Tabby — Blender pipeline pilot (archetype A1)
created: 2026-10-15
last_updated: 2026-10-15
status: VERSION 4 (your two styles) BUILT IN BLENDER — not imported into Roblox (needs your go-ahead to upload)
tags:
  - asset
  - cats
  - blender
  - pipeline
---

# Orange Tabby — Blender pipeline pilot (archetype A1)

The first run of [[Assets/Cat Art Pipeline Plan]], on one cat, end to end up to the Roblox upload.

## Original request
> okay try running one design and doing it using the method u wrote

## Expanded brief (written and shown before modelling)
- **Goal:** prove the pipeline on one live cat: Blender master → coat texture → rig with an idle clip → icon rendered from the model → FBX → vault previews.
- **Subject:** Orange Tabby (`orange_tabby`, Common). Archetype **A1 Classic Shorthair**.
- **Look:**
  - the cat's existing palette from `CatArtDefinitions`: fur #E19C56, stripe #A15E30, eyes sage green #6F9371, collar teal #58898F;
  - cream muzzle, chest and paws, a gold bell;
  - the style block from the prompts: chibi head about 55% of height, matte plush, glossy eyes.
- **Specs:** 3,000–6,000 triangles, one coat texture at 1024², a separate face object, an icon on a transparent background.
- **Plan deviations (stated, not hidden):**
  - **No concept step.** No image generator is connected, and the Orange Tabby's design already exists in the game.
  - **The reference design was rendered from this Blender master** instead of drawn first in Claude Design. That image is now the reference for every later prompt.
  - **The icon uses the standing pose.** The plan asks for sitting, which needs the full animation set.
  - **No upload or Studio import.** That creates assets on your Roblox account, so it waits for you.

## How it was made
Everything is scripted and re-runnable with headless Blender 4.5. The Blender MCP connection was down, so Blender was driven from the command line.

| Step | Script | Result |
|---|---|---|
| Build | `assets/models/pipeline/build_a1_orange_tabby.py` | The body is overlapping solids (body, chest, head, cheeks, legs, paws, one tail tube, ear cones), fused by a **voxel remesh**, smoothed and decimated. The face (eyes, nose, smile, inner ears) and the collar and bell sit on the real head surface. The coat is built from procedural stripes and baked to `Coat_orange_tabby.png` (1024²). A 15-bone rig uses automatic weights, with an **Idle** clip (breathing, head bob, tail sway, 60 frames). |
| Render | `assets/models/pipeline/render_cat.py` | One saved camera and light rig for every cat: Cycles, a transparent background, three-quarter icon framing, and front, side, back and top views. |
| Export | `assets/models/pipeline/export_cat.py` | `Cat_orange_tabby.fbx` (mesh, armature, Idle, embedded texture; scaled to about 4 studs long; -Z forward, Y up), plus rig-check renders |
| Sheets | `assets/models/pipeline/make_sheets.py` | Icons at 1024, 512 and 256 (trimmed and re-padded to 10%), `reference_design_v1.png` (the style sheet), and `before_after.png` |

**Outputs** are in `assets/models/orange_tabby_v3/`: `Arch_A1_orange_tabby.blend`, `Cat_orange_tabby.fbx`, `Coat_orange_tabby.png`, `icons/`, `renders/`, and `reference_design_v1.png` (also copied to `design/reference_design_v1.png`).

**Final numbers:** 5,814 triangles (body 3,698 + face 1,708 + collar and bell 408). All 1,851 body vertices are weighted to the rig. FBX 594 KB; 512 icon 143 KB, 256 icon 47 KB.

## Revisions (kept, not replaced)
1. **r1 — metaballs: failed.** The parts never fused, so the tail was loose beads and the ears and eyes floated. The collar was huge and the smile came out as rings. Washed-out colours.
   ![[Assets/Previews/CAT-ORANGE-TABBY/2026-10-15-r1-metaball-icon-FAILED.png|320]]
2. **r2 — overlapping solids + voxel remesh.** One fused body. But stripes leaked onto the head, it was overexposed, and the collar was buried.
   ![[Assets/Previews/CAT-ORANGE-TABBY/2026-10-15-r2-fused-front.png|320]]
3. **r3 — the look settled.** Stripes on the back, sides and tail only; correct exposure; the collar showing; tighter icon framing.
   ![[Assets/Previews/CAT-ORANGE-TABBY/2026-10-15-r3-icon.png|320]]
4. **r4–r5 — the forehead "M".** It first showed as round spots, then dotted lines.
   ![[Assets/Previews/CAT-ORANGE-TABBY/2026-10-15-r4-icon-spot-marks.png|320]]
5. **r6 — final pilot.** Solid tabby forehead and cheek stripes.

**Final icon (512, transparent):**
![[Assets/Previews/CAT-ORANGE-TABBY/2026-10-15-r6-icon-512.png|320]]

**Reference design v1** (attach this to every prompt):
![[Assets/Previews/CAT-ORANGE-TABBY/2026-10-15-r6-reference-design-v1.png|720]]

**Before and after.** The left is a real Studio capture of today's native-part cat in the Catpedia. The right is the pilot icon, **not yet in the game**.
![[Assets/Previews/CAT-ORANGE-TABBY/2026-10-15-r6-before-after.png|720]]

**Rig check** (Idle frame 30, quick Workbench render; the colours look darker because of the preview shading, not the texture):
![[Assets/Previews/CAT-ORANGE-TABBY/2026-10-15-r6-rig-idle-frame30.png|320]]

All images are actual Blender renders (Cycles, 2026-10-15) except the "before" half, which is a Studio capture. **No Roblox render of the new model exists yet.**

## Known flaws
- In the side view, the nose and smile sit slightly in front of the muzzle. They should be pushed back about 0.03 units.
- The gold bell is mostly hidden by the fur at the front.
- The idle clip is very subtle: the tail sways sideways, and the side-view check barely shows it. Walk, sit, attack and the other clips are not made.
- UVs come from Smart UV Project on the remeshed body. That works for one cat, but the plan's "shared UV layout per archetype" (one layout for all 20 coats) is **not** done yet. It needs a hand-made UV layout on a fixed A1 mesh, so the remesh would only be used to make that master once.
- The FBX orientation and scale have not been checked in Roblox's importer.

## Next steps
1. **You decide:** import into Studio? This uploads the mesh and texture as assets on your account. Either you run Studio's 3D Importer on `Cat_orange_tabby.fbx`, or you allow me to do it. After the import it goes in `ReplicatedStorage.CatModels/orange_tabby`, which `CatModelFactory` already loads. Then I can capture it in the game.
2. Fix the known flaws above.
3. Make the A1 master mesh with a fixed hand UV layout, so the other A1 cats (Grey Shorthair, Tuxedo, …) are coat swaps.
4. The 14 other live species.

## Version 4 — rebuilt in your two styles (2026-10-15)
> two things the icon should be based more on this image … this is how the cats also should be in the game so redo it or redo the prompts first and redo it

Done in that order: the prompts first (all 1,015 regenerated with the two styles), then both versions rebuilt. Versions 1–3 above are the superseded soft-toy look, kept as history.

**Icon** (`assets/models/pipeline/build_icon_cat.py` → `assets/models/orange_tabby_v4/icon/`):
- a chibi Orange Tabby sitting upright, the tail curled to the right, front paws together;
- an inverted-hull outline in dark brown; a toon shader with 3 tones;
- eyes, nose, smile and the collar bell;
- vertex-colour coat: cream muzzle, chest and paws; forehead "M"; cheek, back and tail stripes; pink inner ears.

Rendered orthographic in EEVEE at 1024; 512 and 256 made from it.

Revisions:
1. Blotchy shading and spiky cheek tufts.
2. The pupils got hidden inside the irises, and the tufts were lost.
3. The mouth was missing: object origins reset to (0, 0, 0) by `transform_apply`, so the mouth was placed inside the head. Fixed by placing it from the real nose position.
4. Light shadows turned off for clean cel bands; inner ears painted onto the ear faces.

**In-game model** (`assets/models/pipeline/build_lowpoly_cat.py` → `assets/models/orange_tabby_v4/ingame/`):
- **2,200 triangles** (body 1,864 + details 336); all 941 body vertices are weighted.
- Flat shaded, with a ±5% shade change per facet.
- Teal collar and gold bell, green almond eyes, pink nose, three white whiskers per side.
- Coat baked to `Coat_orange_tabby.png` (512, nearest-neighbour).
- Rig with **Idle** and **Walk** clips.
- `Cat_orange_tabby.fbx` is 311 KB, about 4 studs long, -Z forward.

Revisions:
1. The legs were splayed: the Walk clip's pose leaked into the rest pose. Fixed by resetting the bones before each clip.
2. Eyes, nose, collar and whiskers rendered black: a helper's third argument was being read as "use coat colours".
3. The legs were all cream: the chest rule caught them.
4. Bigger eyes and a wider preview camera.

**Previews** (actual Blender renders, 2026-10-15):

![[Assets/Previews/CAT-ORANGE-TABBY/2026-10-15-v4-style-check.png|720]]

Your references (left) beside the rebuild (right).

![[Assets/Previews/CAT-ORANGE-TABBY/2026-10-15-v4-icon-512.png|320]]
![[Assets/Previews/CAT-ORANGE-TABBY/2026-10-15-v4-ingame-preview.png|640]]

The in-game model mid-walk on a grey ground (a Blender render, **not Roblox**).

![[Assets/Previews/CAT-ORANGE-TABBY/2026-10-15-v4-lowpoly-side.png|320]]
![[Assets/Previews/CAT-ORANGE-TABBY/2026-10-15-v4-lowpoly-front.png|320]]
![[Assets/Previews/CAT-ORANGE-TABBY/2026-10-15-v4-lowpoly-r1-pose-leak.png|320]]

The last image is revision 1, with the splayed legs from the pose leak.

**Still not done:**
- the Roblox import: it uploads assets to your account and waits for your OK;
- a sitting pose for the in-game model;
- other clips (run, attack, hit);
- a fixed hand UV layout per body type (Smart UV is used for now);
- the icon's tail stripes are faint.
