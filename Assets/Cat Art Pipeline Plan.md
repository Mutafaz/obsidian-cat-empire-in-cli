---
type: asset-plan
id: CAT-ART-PIPELINE
title: Cat Art Pipeline Plan — icons and 3D models
created: 2026-10-15
last_updated: 2026-10-15
status: PLAN — nothing generated, modelled, uploaded or imported yet
tags:
  - assets
  - cats
  - pipeline
  - blender
---

# Cat Art Pipeline Plan — icons and 3D models

## Original request
> Okay now I want you to write me a plan on how we are going to get the best renderings for each car the icon and the actual 3d asset tell me if it should be claude design + figma  or what and write me a plan to for each i believe that there is a list of all different types of cars and stuff and each has a rarity for rarities I say we keep the designs the same for now but different cats have different designs write me the plan and a prompt for each cat that can be sent along with a reference design

**Read as:** "car" means **cat**. "Keep the designs the same for rarities" means rarity keeps today's look in the UI (card colours, rosettes, the Mythic rainbow), and rarity is **not** painted onto the cats. Every cat still gets its own design.

## The short answer: which tools
**Blender is the master for both the 3D model and the icon.** Claude Design and Figma are for steering and reviewing, not for final art.

| Tool | Use it for | Do not use it for |
|---|---|---|
| **Claude Design** | The one-time **reference design** (style sheet), card and icon-frame mockups, review boards | Final cat art or 1,000 icons. It is a UI/design canvas, not a character-art pipeline. |
| **Figma** | Optional review and handoff board (approve/reject per cat, palette swatches). Its connector needs signing in again before Claude can use it. | Anything that ends up in the game |
| **AI image generator + reference** (the icon prompts) | Fast **concept art** per cat, and for hero cats (live species, Legendary, Mythic, IVY, the duo) to settle a look before modelling | Final icons. Generations drift, so the same cat comes out slightly different each time. |
| **AI 3D generator** (e.g. Blender MCP `generate_3d`, from an approved concept) | A head start on unusual hero shapes (Cosmic Sphinx, Robo-Kitten, IVY) | Shipping as-is: the output needs retopology, UVs and a rig to meet Roblox budgets |
| **Blender** | The **12 body archetypes**, coat textures, rigs, animations, **icon renders**, FBX export. A script builds every cat. | — |
| **Roblox Studio** | Import (MeshPart + SurfaceAppearance), in-game checks, captures | Modelling |

**Why render icons from Blender instead of drawing them:**
- The icon then always matches the 3D cat.
- 1,000 icons come out with identical framing and lighting.
- Changing a coat later re-renders the icon automatically.

The icon prompts are still useful, for concepts and for the special cats.

## What exists today (checked 2026-10-15)
- **In the game:** 15 live species, all built from native parts (`CleanCatBuilder` + `CatArtDefinitions` palettes). Portraits are **live 3D ViewportFrames** (`CatPreview`), which is why inventories cap how many 3D portraits they draw.
- **Imported meshes:** `CatModelFactory` already loads a custom mesh model when one exists in `ReplicatedStorage.CatModels/<catId>`. That folder is **empty** in the open place.
- **Early drafts:** `assets/models/` holds `.blend`/`.fbx` files from 2026-10-11 for the first ten species. They were never imported. Treat them as references, not masters.
- **The 1,000-entry catalog** ([[Cat Catalog - 1000 Concepts]]) is a **proposal, not in the game**. It is **50 breed families × 20 coat patterns**, minus two slots reserved for IVY and Melman & Julian. **Rarity follows the coat pattern:**

  | Rarity | Coat patterns |
  |---|---|
  | Common | Ginger, Midnight, Cream, Silver Tabby, Brown Tabby, Snow White |
  | Uncommon | Tuxedo, Tortoiseshell, Calico, Blue Grey, Chocolate |
  | Rare | Amber Tabby, Smoke, Snow Point, Golden Tabby |
  | Epic | Spotted, Marbled, most Blue Bicolor |
  | Legendary | the rest of Blue Bicolor, Silver Harlequin, some Golden Mosaic |
  | Mythic | the rest of Golden Mosaic |

- **Project rules:**
  - since 2026-10-13, new 3D assets are made in Blender and imported (the older native-only lines in `design/Roblox Design Guide.md` and `design/Figma Asset Workflow.md` are out of date on this point);
  - asset uploads need your go-ahead;
  - every revision gets real previews in the vault.

## The key idea: 12 bodies × coats, not 1,000 models
The catalog is built from combinations, so the art should be too.
- **12 archetype base meshes** cover all 50 families. Each is modelled, UV'd, rigged and animated **once**:

  | # | Archetype | Families |
  |---|---|---|
  | A1 | Classic Shorthair | Domestic Shorthair, Domestic Mediumhair, American Shorthair, European Shorthair, Snowshoe |
  | A2 | Cobby Round | British Shorthair, Chartreux, Scottish Straight |
  | A3 | Flat-Face Fluffy | Persian, Exotic Shorthair, British Longhair |
  | A4 | Fluffy Longhair | Domestic Longhair, Ragdoll, Ragamuffin, Birman, Turkish Van, Nebelung |
  | A5 | Big Forest Cat | Maine Coon, Norwegian Forest, Siberian |
  | A6 | Slim Oriental | Siamese, Balinese, Turkish Angora, Russian Blue, Oriental Shorthair, Oriental Longhair |
  | A7 | Wild Athletic | Abyssinian, Somali, Bengal, Savannah, Egyptian Mau, Ocicat, Toyger |
  | A8 | Hairless | Sphynx |
  | A9 | Curly Rex | American Wirehair, Devon Rex, Cornish Rex, Selkirk Rex, LaPerm |
  | A10 | Folded Ears | Scottish Fold, Highlander |
  | A11 | Bobtail | Japanese Bobtail, American Bobtail, Manx, Cymric |
  | A12 | Compact Foreign | Burmese, Tonkinese, Bombay, Korat, Singapura |

- **Family details** are small add-on parts or shape keys on the archetype: ear tufts, ruffs, folded ears, curls, tail length.
- **20 coat patterns** are texture masks painted once per archetype UV layout and coloured from the catalog's visual brief. Patterns that need hand placement (Calico, Tortoiseshell, Harlequin, Mosaic) get a few hand-painted layout variants, so cats sharing a pattern do not all look stamped.
- **Hero cats get bespoke work:**
  - the 15 live species keep their current accessories (apron, crown, antenna, nemes, coin, scarf);
  - IVY and the duo are modelled from your photos;
  - any Mythic you want to stand out more.
- **Rarity:** no rarity effects on models or icons. The UI frame already shows rarity, as you asked.

## Specifications
| | Icon | 3D model |
|---|---|---|
| **Source** | Blender render of the final model, using one saved camera and light rig | Archetype mesh + family add-ons + coat texture |
| **Output** | 1024² master PNG, transparent background; 512² and 256² for upload | FBX + 1024² base colour (optional normal and roughness), `.blend` source |
| **Framing** | Three-quarter front, sitting, centred, about 10% padding, no shadow or frame, readable at 96 px | Standing on all fours for the rig, origin under the feet, facing -Z, about 4 studs long |
| **Budget** | Each icon about 30–80 KB at 512² | 3,000–6,000 triangles, one material, bones shared per archetype |
| **In Roblox** | ImageLabel in grids, cards and the Catpedia | MeshPart + SurfaceAppearance under `ReplicatedStorage.CatModels/<catId>` |
| **Naming** | `icon_<catId>_<size>.png` | `Cat_<catId>.fbx`, `Arch_<A#>.blend` |

**Animations per archetype rig:** idle, walk, run, sit, happy hop, attack, hit, faint, and the lucky-cat wave for Golden Maneki. That makes 12 rigs × 8–9 clips, not 1,000.

## The plan, step by step
**0. Your decisions first** (see the list at the end):
- the first batch;
- whether catalog cats replace or join the live 15;
- permission to upload images and meshes;
- which image generator to use.

**1. Reference design.** This is the "reference" every prompt says to attach.
- Build **one style sheet** in Claude Design, using the Calico (an existing species with a 2026-10-12 Figma study in `design/calico/`) as the subject:
  - front, side and three-quarter views;
  - the face close-up (eye shape, highlight, nose, smile);
  - proportions (head about 55% of height);
  - material notes (matte plush, soft subsurface);
  - a palette strip.
- Save it as a PNG.
- **Acceptance:** you approve it.

**2. Concepts.** Only for hero cats: the live 15, IVY, the duo, and Mythics if wanted.
- Send each cat's **icon prompt** with the reference attached.
- Pick the best result and record it in that cat's asset note.
- Regular catalog cats skip this step; their coat brief is the design.

**3. Archetypes in Blender.** Model A1 first, using the approved reference.
- UV, rig, the 8 clips, a test coat.
- Then A2–A12, reusing the A1 face, eyes and rig wherever possible.
- **Acceptance per archetype:** in the triangle budget; one clean UV layout; the rig deforms without tearing; its silhouette reads at icon size.

**4. Coat textures.**
- Paint the 20 pattern masks on each archetype's UV layout.
- Write the colour tables from the catalog briefs.
- Hand-paint a few layout variants for patchy patterns.

**5. Batch build (a Blender Python script).** For each cat, from `design/cat-prompts/cat_prompts.json`:
1. load its archetype;
2. add the family parts;
3. bake its coat;
4. render the icon (1024/512/256);
5. export the FBX;
6. write a contact sheet for review.

It must be re-runnable, so a coat or lighting change rebuilds everything.

**6. Into Roblox.** Uploading is outward-facing, so **you run or approve it**:
- import meshes and images through Studio's 3D Importer or bulk import, or Open Cloud with your API key;
- put each model in `ReplicatedStorage.CatModels/<catId>`;
- add a `CatIconDefinitions` table (catId → image id) and let `CatPreview` use an ImageLabel when an icon exists, keeping the live 3D view for the big showcase spots.

**7. Check and record.**
- Studio captures per cat: in the world, as a follower, in a battle, on a card.
- Phone-size checks.
- Previews saved under `Assets/Previews/CAT-<id>/`, as the project rules require.

**Suggested order:**
1. the reference design;
2. A1 + Orange Tabby end to end (to prove the whole pipeline);
3. the other 14 live species;
4. one test cat per remaining archetype;
5. the catalog, by rarity tier, in batches you choose.

## The prompts
Every cat has an **icon prompt** and a **3D model prompt**. Send each one **with the reference design attached**.
- **Where they are:**
  - **[[Assets/Cat Prompts/Live Species]]:** the 15 cats in the game now, with their current colours and accessories;
  - **[[Assets/Cat Prompts/Special Cats]]:** IVY and Melman & Julian. These need your photos attached too.
  - **[[Assets/Cat Prompts/Catalog - Common]]** (300), **[[Assets/Cat Prompts/Catalog - Uncommon]]** (250), **[[Assets/Cat Prompts/Catalog - Rare]]** (200), **[[Assets/Cat Prompts/Catalog - Epic]]** (140), **[[Assets/Cat Prompts/Catalog - Legendary]]** (80), **[[Assets/Cat Prompts/Catalog - Mythic]]** (28);
  - **`design/cat-prompts/cat_prompts.json`:** all 1,015 in one file, for batch tools.
- **How they are made:** `tools/build_cat_prompts.py` writes them all from the catalog plus the live species. **Edit the script and re-run it**; don't hand-edit 1,000 pages.
- **What each prompt holds:**
  - the shared style block (matching the reference);
  - the cat's archetype and family traits;
  - its coat and markings;
  - its eyes and accessories;
  - the rarity rule (no rarity effects);
  - the framing or 3D specs;
  - an "avoid" list.

Example (Live Species → Orange Tabby, icon):
> [Attach the reference design.] Create a game icon of one cat. Style: match the attached reference design exactly for style, not coat. Chibi soft-toy proportions … Subject: "Orange Tabby" (Common). Body: Classic Shorthair archetype … Coat and markings: warm orange-ginger coat with darker ginger forehead "M" and flank stripes, cream muzzle. Eyes: sage green eyes. Accessories: teal collar with a small gold bell. Rarity is shown by the game UI frame, not by the cat … Icon: three-quarter front view, sitting …

## Risks and limits
- **AI consistency:** generated images change between runs and can ignore the reference. That is why concepts are steering only, and final icons come from Blender renders.
- **Rights and moderation:** check the terms of whichever image or 3D generator you use. Roblox moderates every uploaded image and mesh. Keep the provenance of each asset in the [[Assets/Asset Registry]].
- **Scale:**
  - 1,000 textures and icons is a lot of uploads and memory;
  - load models on demand (only the cats on screen) and use icons, not live 3D portraits, in grids.
- **IDs:** the catalog's CE IDs are concept IDs, not save IDs. Adding catalog cats to the game is a separate decision; their game IDs must be chosen before upload names are fixed.
- **Old guidance:** two design docs still describe the native-only rule. AGENTS.md and the 2026-10-13 decision (Blender) take precedence.

## Acceptance for the whole pipeline
- Each cat's icon and in-game model visibly match (the icon is rendered from that model).
- Rarity is never shown on the cat itself; the UI frame shows it.
- Every model is within budget, rigged, animated and imported under its `catId`; every icon is uploaded and registered.
- Real Studio previews for each cat are in the vault, with older revisions kept.

## Decisions for you
1. **First batch:** the 15 live species only? Or the live 15 plus one cat per archetype?
2. **Catalog:** will its cats **replace** the live 15, or be **added** beside them, and when?
3. **Reference design:** OK to build it in Claude Design from the Calico?
4. **Image generator** for concepts (which service; its terms apply).
5. **Uploads:** do you upload yourself in Studio, or set up Open Cloud with your own key?
6. **IVY and Melman & Julian:** please share photos when you are ready.

## Pilot run — 2026-10-15
The Orange Tabby was run through steps 1, 3, 5 and 7 (in part) in Blender. See [[Assets/Orange Tabby Blender Pilot]].
- **What it produced:**
  - **reference design v1** (`design/reference_design_v1.png`), now the image to attach to every prompt;
  - a 5,814-triangle rigged model with an Idle clip;
  - the FBX;
  - 1024/512/256 icons.
- **Not done:** the concept step (no image generator connected), the shared A1 UV layout, and the Roblox import (it waits for your go-ahead).

## Style change — 2026-10-15 (your references)
You supplied two style references, saved in `design/reference/user-style/`:
> two things the icon should be based more on this image if you want to put reference I like how the eg made them this is how the cats also should be in the game so redo it or redo the prompts first and redo it

**This replaces the single soft-toy style above with two styles that share each cat's colours:**

| | Icon | In-game 3D |
|---|---|---|
| **Reference** | `icon-style-reference.jpg` | `ingame-3d-style-reference.jpg` |
| **Look** | 2D cartoon chibi, sitting upright, the tail curled at the side; an even dark-brown outline; 3-tone cel shading; cheek fluff; big glossy eyes, pink inner ears | Low-poly faceted, real cat proportions, slim with long legs, the tail raised; flat shading with a slight shade change per facet; thin whiskers; almond eyes |
| **How it's made** | A chibi "icon model" in Blender, rendered with a toon shader (Shader to RGB + a 3-tone ramp) and an inverted-hull outline, orthographic, in EEVEE. It looks 2D but is re-renderable, so all icons stay consistent. | A Skin-modifier skeleton, a low-poly head and ears, faceted; coat painted per face and baked to a 512 texture; rig with Idle and Walk |
| **Budget** | 1024/512/256 PNG, transparent | About 2,200 triangles |

- **What changed in the plan:** the icon no longer comes from the in-game model, because the two looks are deliberately different. Instead, both are built from the **same coat data** (palette and markings), so a cat's icon and model always have the same colours and pattern.
- **Prompts:** regenerated for all 1,015 cats with these two styles. Icon prompts attach the icon reference; 3D prompts attach the in-game reference.
- **Old styles:** the earlier "reference design v1" (soft-toy) is **superseded**. It is kept as history in the pilot note.
- **Pilot:** see [[Assets/Orange Tabby Blender Pilot]] (version 4).
