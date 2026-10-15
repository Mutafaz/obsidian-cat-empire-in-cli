---
type: asset
id: UI-OVERHAUL
status: IMPLEMENTED
last_updated: 2026-10-13
---

# UI overhaul — simulator style (2026-10-13)

## Original request
> First I added a UI reference I want you to overhaul the UI we have and redo

References supplied by the user: [[Assets/Reference Examples/UI]] (seven screenshots, `Sample UI.png` to `Sample UI 7.png`, of a shop, pet index and equip panel from another Roblox game).

## Verified context
All UI is built in Luau by twelve client controllers that share `src/shared/UITheme.luau`. Before this change the theme was lapis/gold "Egyptian" panels with Gotham text. Nine windows call `UITheme.bindModal`; four bottom navigation buttons call `UITheme.bindNavigation`, whose positions are covered by `tools/ui_layout_fixture.luau` (six viewports, jump-button clearance). No image assets can be uploaded from this environment, and Studio was not reachable (the MCP bridge listed zero Studios), so nothing here was rendered.

## Expanded brief
Goal: make every window read like the references — a glossy coloured header bar with slanted shine, a big white outlined title, a red square X, a dark slate body with a thick dark outline, bright gradient cards and chunky green action buttons — without copying that game's artwork or changing gameplay.

Visual specification: Fredoka One for titles, buttons and numbers; white text with a dark outline; 3–4 px dark outlines on panels, cards and buttons; a top-to-bottom gloss gradient on every button and card; one accent colour per window that matches its navigation button (My Cats green, Expeditions blue, Battles orange, Realms purple, Rebirth pink, Guide teal, Settings grey, station workers orange). Cat cards and worker cards are filled with their rarity colour; realm cards with the realm colour. Decorative emoji removed from labels.

Constraints: native Roblox UI objects only (UIGradient, UIStroke, UICorner); the references' stud texture, sunburst rays and picture icons need uploaded images and are not included. Navigation positions, modal sizing/reflow and all remote calls are unchanged. Touch targets stay at 44 px or more for close and primary buttons.

Deliverables and checks: new `UITheme` helpers (`styleButton` accents, `styleCard`, `styleTitle`, `styleClose`, `outline`, header bar in `bindModal`); all twelve controllers updated; offline layout suite still passing; Studio screenshots on desktop and phone before this is called verified.

Assumptions: keeping the bottom navigation and top-left HUD positions (already tested against the mobile jump button) is preferable to the references' left-side buttons, which would sit under the mobile thumbstick.

## Verification
- 55 files compile; UI layout suite (6 viewports, 7 modal sizes) and 149 core assertions pass.
- **Preview pending.** No Studio render exists for this revision: the bridge reported no connected Studio. Needed: enable *Assistant → ⋯ → Manage MCP Servers → Enable Studio as MCP server*, sync, then capture every window on desktop and phone. Colours, text fit, header streaks and card contrast are unverified until then.

## Revision 2 — Blender art kit (2026-10-13)

### Original request
> USE blender to create the UI or figma up to you (unless u wanna combine if u want i don't care) Because the UI doesn't look like references in obsidian at all I also provided you with mcp connection

### Context
Revision 1 used only native gradients, so it lacked the references' stud texture, sunburst cards and picture icons. Blender MCP is connected (Blender 4.5.3); Figma and Roblox Studio are not reachable from this session. The user withdrew the native-only asset rule earlier today (ADR-014).

### Expanded brief
Goal: supply the three image ingredients the references depend on and show the target look before upload. Deliverables in `assets/ui/`: `studs.png` (64 px neutral tile, tinted in-engine), `rays.png` (512 px white sunburst with alpha), `icon_atlas.png` (4×3 grid of 256 px outlined 3D icons: coin, yarn, trophy, cat, map, swords, portal, star, gear, book, lock, paw; singles in `assets/ui/icons/`), source scene `cat_empire_ui_kit.blend`. `UITheme.images` holds the three asset IDs; while they are empty the UI keeps revision 1's plain look. With IDs set: stud tiles on bodies, header bars and cards, rays on cards, icons on the four menu buttons and the coin/yarn counters. Menu buttons move to a left-hand column on screens at least 760×560; phones keep the tested bottom layout. Assumption: one shared cat icon in the mockup stands in for per-species portraits, which the game already renders live.

### Previews
![[Assets/Previews/UI-OVERHAUL/mockup-my-cats-r1-2026-10-13.png|640]]
r2, 2026-10-13. **Concept mockup rendered in Blender, not a Roblox screenshot.** Source: `assets/ui/cat_empire_ui_kit.blend` (scene CatEmpireUIMock). Known flaw: slight ghosting on outlined numbers is a mockup artefact.

![[Assets/Previews/UI-OVERHAUL/icon-atlas-r1-2026-10-13.png|480]]
r1 icon sheet, 2026-10-13. Actual Blender render (EEVEE, 256 px cells, transparent). This is the file to upload.

### Status
Art files rendered and inspected. Not uploaded: the three images have no Roblox asset IDs yet, so the in-game result is **preview pending**. 55 files compile; layout and 149 core assertions pass with the IDs empty.

## Studio renders — 2026-10-13 (plain revision, images not yet uploaded)

Studio MCP connected this session (place "Cat Empire"; the bridge needs a few seconds after start before it lists the Studio). Rojo had already synced all 55 files; a compare found no differences. Solo Play, 1096×635 desktop viewport, no console errors.

![[Assets/Previews/UI-OVERHAUL/studio-expeditions-r1-2026-10-13.png|480]]
![[Assets/Previews/UI-OVERHAUL/studio-realms-r1-2026-10-13.png|480]]
![[Assets/Previews/UI-OVERHAUL/studio-battles-r1-2026-10-13.png|480]]
Actual Studio captures, r1. Fixed after these captures and not yet re-captured: button text looked grey (gloss gradient replaced by a highlight band), free realm button text. Fixed and visible in them: left menu no longer overlaps the HUD, larger titles, inventory empty message. Populated inventory, station, rebirth, settings, phone layouts and the image kit are still unverified.

## Revision 2 in Studio — images uploaded (2026-10-13)

The user approved the upload. Uploaded through Studio MCP `upload_image` from a temporary local server (stopped afterwards):

| File | Asset ID |
|---|---|
| `assets/ui/studs.png` | `rbxassetid://99201455111578` |
| `assets/ui/rays.png` | `rbxassetid://107348139208096` |
| `assets/ui/icon_atlas.png` | `rbxassetid://114885818923461` |

IDs live in `UITheme.images`. Tuning after the first real render: stud layers drawn at 30–40% opacity, rays only on upright cards, button shine as a child band (a gradient greyed the white text), shine stretched across padded menu buttons, gear icon on Settings, transparent cat portraits.

![[Assets/Previews/UI-OVERHAUL/studio-my-cats-r2-2026-10-13.png|480]]
![[Assets/Previews/UI-OVERHAUL/studio-new-cat-r2-2026-10-13.png|480]]
![[Assets/Previews/UI-OVERHAUL/studio-rebirth-r2-2026-10-13.png|480]]
![[Assets/Previews/UI-OVERHAUL/studio-settings-r2-2026-10-13.png|480]]
Actual Studio Play captures, r2, 1096×635 desktop, real starter and adoption flow (starter pad, adoption pad, ceremony, inventory). No script errors in the console. Not yet captured at r2: Expeditions, Realms, Battles, station workers, Guide, phone portrait/landscape, a large inventory. Cat portraits on cards are small (68 px).

## Revision 3 — My Cats rebuilt as an index window (2026-10-13)

### Original request
> Can you use figma for the my cars menu as a test I want you to make it as close to reference as possible

Figma could not be used: its connector is installed but not authorised in this session, so the test was done in-engine against `Sample UI 5.png` (the Pet Index reference).

### Brief
Match the reference's structure: dark inset holding a grid of square rarity cards (name on top, picture filling the card), a large detail card on the right for the chosen cat, a green-framed action box under it, and a progress bar with an overlapping icon along the bottom. Keep the existing server calls (`EquipCat`, `MergeCats`) and the two-tap merge rule. Phones get two compact arrangements instead of the side column.

### What changed
`InventoryController` rewritten: 760×520 window; 108×126 cards sorted by rarity, species and level; tap a card to show it, tap a matching one to arm Merge, tap a non-matching one to switch to it; Follow and Merge moved to the action panel; "Collected: n/10 • n cats" bar; paw icon on the following cat; selection changes no longer rebuild the grid. `_equipRemote` is now a declared local (it was an accidental global).

![[Assets/Previews/UI-OVERHAUL/studio-my-cats-r3-2026-10-13.png|640]]
r3, actual Studio Play capture, 1096×635 desktop, four cats obtained through the real starter and adoption pads.

Verified in Studio: grid, selection switching, detail card, Follow/Unfollow and its paw marker, no console errors. Not exercised in Studio: a completed merge (the random adoptions gave no matching pair in the final run), the two phone arrangements, more than 12 cats. One Rojo sync was missed during this work; a compare showed Studio one edit behind and the file was pushed through MCP. Compare before trusting a playtest.

## Figma test — My Cats (2026-10-13)

The Figma connector became available later in the session. Page "My Cats • Figma test r1" in the project file: https://www.figma.com/design/QKdv8P5JreMGQsftAFRySh?node-id=7-3

![[Assets/Previews/UI-OVERHAUL/figma-my-cats-r1-2026-10-13.png|640]]
**Figma concept, not a Roblox render.** 1920×1080 frame, built against `Sample UI 5.png`. It uses the Blender stud tile, sunburst, cat and paw images. Differences from the in-game r3 window that would need porting: Montserrat Black lettering with heavier outlines and a drop shadow, a taller header, squarer corners, stronger two-tone card colours, a "Following" column on the left, and a cat-count bar under the grid. One cat icon stands in for all species; long names wrap onto the picture.

## Revision 4 — Figma style ported to every window (2026-10-13)

### Original request
> yes rebuild everything

(Answering "Do you want me to rebuild the in-game My Cats window to match this Figma design?")

### What changed
Theme-level, so every window inherits it: Montserrat Heavy lettering (`UITheme.fontFace`, set through `FontFace`), thick text outlines drawn with a `UIStroke` named `TextOutline` that scales with text size (box borders are a separate stroke named `Border`), a taller header that rises 12 px above the window so no content had to move, a 52 px close button, squarer corners, brighter header gradients, deeper two-tone cards, white selection border, more saturated rarity colours in `CatUtil`. My Cats is now 880×540 with a "Following" column showing the cat that follows you.

![[Assets/Previews/UI-OVERHAUL/studio-my-cats-r4-2026-10-13.png|640]]
![[Assets/Previews/UI-OVERHAUL/studio-guide-r4-2026-10-13.png|480]]
![[Assets/Previews/UI-OVERHAUL/studio-expeditions-r4-2026-10-13.png|480]]
![[Assets/Previews/UI-OVERHAUL/studio-realms-r4-2026-10-13.png|480]]
![[Assets/Previews/UI-OVERHAUL/studio-battles-r4-2026-10-13.png|480]]
r4, actual Studio Play captures, 1096×635 desktop. Verified: Guide, new-cat reveal, My Cats (select, Follow, Following column, paw marker), Expeditions, Realms, Battles list, Settings; no script errors. Not verified at r4: Rebirth window, station workers, an in-progress battle, a completed merge, phone portrait/landscape, large inventories.

Testing notes: the Rojo plugin had stopped syncing (17 scripts were stale in Studio), so sources were pushed with the MCP sync script; compare before every playtest. Studio's mouse automation refuses clicks that land under the CoreGui chat area ("hits CoreGUI"); set `GuiService.SelectedObject` and send Return instead. Pre-port source backup: `.tools/backup-2026-10-13/src-before-figma-port`.

## Claude Design test — My Cats (2026-10-13)

The user ran `design/Claude Design UI Prompt.md` in Claude Design. Result: artifact "Cat Empire – My Cats" (https://claude.ai/artifact/Mkka7Ht1iViwRFH7Bhfer4); its artboard source is saved at `design/claude-design/my-cats-r1/project/Main.dc.html`.

![[Assets/Previews/UI-OVERHAUL/claude-design-my-cats-r1-2026-10-13.png|640]]
**Claude Design concept, not a Roblox render.** Captured from a static local render of the artboard (animations off; its star-pattern mask image did not load). Same layout as requested, but a softer look than the references: white window body, coral header, pastel cards, Lilita One lettering. Its strongest part is eight distinct flat-vector cat illustrations drawn as inline SVG. Nothing from it is in the game yet.

## Revision 5 — Claude Design window style (2026-10-13)

### Original request
> I want the window style it gave though so do that I will tell it everything else

### What changed
The user chose the Claude Design look over the dark reference look. Values taken from `design/claude-design/my-cats-r1/project/Main.dc.html`: indigo outline `#1e1b3a`, white window body, lavender inset panels `#f5f0ff`, coral My Cats header, pastel-to-full rarity gradients (Common `#b4bdca`, Uncommon `#3cc46e`, Rare `#3a8bff`, Epic `#9a4dff`, Legendary `#ffab1f`), gold selection border, rounder corners (16/12), soft top band on headers instead of slanted streaks, pill-shaped level tags, a collection bar with a green fill, mint action panel. Stud texture switched off (`UITheme.useStuds = false`). `UITheme.legible` now sweeps every window: pale text without an outline gets one, and small print on the light body turns dark ink.

Not carried over: Lilita One is not a built-in Roblox font, so Fredoka One is used; the design's star pattern needs one more image upload; hard drop shadows under buttons and the window; the 2D cat drawings (cards still show the live 3D cats); idle animations.

![[Assets/Previews/UI-OVERHAUL/studio-my-cats-r5-2026-10-13.png|640]]
![[Assets/Previews/UI-OVERHAUL/studio-expeditions-r5-2026-10-13.png|480]]
![[Assets/Previews/UI-OVERHAUL/studio-battles-r5-2026-10-13.png|480]]
r5, actual Studio Play captures, 1096×635 desktop. Verified: Guide, My Cats (select, Follow), Expeditions, Realms, Battles list, Settings, Rebirth; no script errors. Known rough spot: small outlined captions in the Battles list look thin on the white body. Not verified: station workers, a live battle, merge completion, phone layouts. Pre-change backup: `.tools/backup-2026-10-13/src-before-claude-design-style`.

## Revision 6 — idle motion (2026-10-13)

Request: "okay then rebuild them?" (the animations in the Claude Design artboard). Added to `UITheme`: one shared heartbeat (`UITheme.animate`), `bob`, `pulse`, `setMotion`; sunburst rays turn once every 24 s; styled buttons squash to 95% while held. My Cats: the detail and Following portraits bob, the selected card wiggles ±1.5°, MERGE pulses once two cats are armed. Hidden windows are skipped, and Settings → Low detail mode calls `UITheme.setMotion(false)`.

Studio evidence (solo Play, values sampled 0.7 s apart with My Cats open and a cat selected): rays rotation 10.4° → 20.9°, portrait offset −1 → −3 px, selected card rotation 0.60° → −1.34°, Merge scale 1.000 while not armed; no console errors. Not exercised: the armed Merge pulse, the press squash, the low-detail switch, drifting star pattern (not built; needs the star image). No still preview: motion cannot be shown in a screenshot.

## Revision 7 — user-supplied icon set (2026-10-13)

### Original request
> all icons have been completed add it

Twelve PNGs from `C:\Users\59322\Downloads\individual_icons` (made by the user in Claude Design), copied to `design/claude-design/icons-r2/`. Each is about 1300 px with real transparency. They were trimmed, fitted into 256 px cells and packed as `icon_atlas.png` in the order `UITheme` expects (fish_coin→coin, yarn_ball→yarn, trophy, cat_face→cat, map, crossed_swords→swords, purple_portal→portal, star, gear, magic_book→book, padlock→lock, pink_paw→paw). Uploaded through Studio MCP as `rbxassetid://112124631037513`, replacing the Blender sheet (`114885818923461`, still on Roblox, no longer referenced). An earlier single-sheet version with a baked checkerboard is kept in `icons-r1/` with `tools/cut_icon_sheet.py`; it was never uploaded.

![[Assets/Previews/UI-OVERHAUL/icon-atlas-r2-2026-10-13.png|480]]
![[Assets/Previews/UI-OVERHAUL/studio-hud-r7-icons-2026-10-13.png|480]]
![[Assets/Previews/UI-OVERHAUL/studio-my-cats-r7-icons-2026-10-13.png|480]]
Actual Studio Play captures: menu buttons, coin and yarn counters, settings gear, My Cats bar and paw marker all show the new icons. One capture in this session came back with a black world and empty cat portraits; a repeat was normal, so it is recorded as a capture glitch, not a game fault.


## Revision 7b — frameless icons and screen scaling (2026-10-13)

Request: "you dont need squares around all the icons just make them bigger and easier to see". Menu buttons lost their boxes (picture plus outlined name only) and the whole UI now grows with the screen through `UITheme.screenScale` (1x at 1280x720, up to 1.75x). Seen in Studio on a large viewport; superseded by revision 8 below, which keeps both ideas.

## Revision 8 — HUD and MY PETS rebuilt from the user's mockup (2026-10-13)

### Original request
> I haven't built the UI for this game yet. Look at `ui-mockup.png` in my project root and build this exact HUD and "MY PETS" modal from scratch. [five numbered requirements: real local icons; symmetric frameless side columns of ~80 px icons; chunky outlined font, dark slate `#1e2030` window with purple/gold striped header, glossy 3D buttons, rarity cards in a 4x3 grid; reusable cat placeholders; animations] ... I also added the shop in the directory. Also the expeditions is being removed so you can overhaul it completely.

### Context
The file in the project root was `UI mockup png.jpg` (1024x572; moved to `design/originals/` on 2026-10-13), copied to `design/ui-mockup-r1/mockup.jpg`. The request is worded for a web page (CSS, React, SVG); the project is a Roblox game, so it was built as Roblox UI in Luau. The shop icon (`Colorful storefront icon with striped awning.png`) joined the twelve earlier icons in a 4x4 sheet, `design/claude-design/icons-r2/icon_atlas_v2.png`, uploaded as `rbxassetid://76461036633351`.

### Expanded brief
- HUD: three dark pills top-centre (Fish Coins, Golden Yarn, Trophies) with the real icons overlapping their left ends and gold outlined numbers. Left column Pets / Explore / Battle / Shop, right column Rewards / Settings / Catpedia / Rebirth: frameless, one icon size (76 px at 1280x720), one gap, mirrored.
- Window: dark slate body, thick ink border, purple header with gold diagonal stripes that drift sideways, red X, Fredoka One with a thick black outline.
- MY PETS: Following column with pedestals, "Inventory (n)" with search and a four-column grid of rarity cards padded to three rows with padlocked cells, "Collected: n/10" bar, Pet Details showcase, EQUIP BEST (green) / AUTO-MERGE (blue) / MERGE (gold).
- Motion: scrolling stripes, bobbing follower and showcase cats, twinkling sparks and a turning sunburst behind the showcase cat, rainbow border and label for Mythic/Secret cards, slowly turning Rebirth vortex, 1.05 hover / 0.95 press spring on every button.
- Acceptance: offline suites pass; side columns proven mirrored and evenly spaced on six viewports; Studio capture compared with the mockup; no script errors.

### What changed
- `src/shared/UITheme.luau` rewritten: dark palette, `springy`, `styleInset`, `rainbow`, glossy buttons with a dark lip, striped `CanvasGroup` header, one shared `bindSide` layout behind `bindNavigation` (left) and `bindCorner` (right).
- `HUDController.luau` rewritten (pills, toast, Shop and Catpedia buttons). `InventoryController.luau` rewritten as MY PETS. EQUIP BEST asks the server to make the highest-income cat the follower; AUTO-MERGE sends one ordinary `MergeCats` request per matching pair (0.4 s apart, at most 30); MERGE is the two-tap merge as before. The paw on a card sets that cat as follower. All outcomes stay server-decided.
- Side menu: Explore opens Realms, Rewards opens the starter guide (retitled "Starter Rewards"), Rebirth uses the vortex icon. Parade banner moved under the currency pills.
- Rarity colours nudged toward the mockup (Common grey, Epic purple, Legendary gold) in `CatUtil`.
- Expeditions: the client window and its button are switched off (`ENABLED = false` in `ExpeditionController`), and the "expedition" step left the starter guide (three steps now). `ExpeditionService` and its remotes are still on the server.

### Differences from the mockup (honest list)
- Cats are the game's live 3D portraits (`CatPreview`), not drawn placeholders: Astronaut, King, Galaxy and Ninja are not species in `CatDefinitions`, and no such art was supplied.
- The game has one follower slot, so the column reads "Following (n/1)" with two padlocked pedestals instead of 3/3.
- There is no inventory cap; the title is "Inventory (n)" and the padlocked cells are filler.
- Collection is n/10 because ten species exist.
- Shop and Catpedia have no game system yet; their buttons show a "coming soon" toast.
- The padlock is the user's gold padlock icon; the mockup's is grey.
- No Mythic or Secret cat can be obtained (not in the roll weights), so the rainbow border has not been seen in Studio.

### Previews
![[Assets/Previews/UI-OVERHAUL/r8-mockup-reference.jpg|480]]
The user's mockup (reference image, not a game capture).

![[Assets/Previews/UI-OVERHAUL/r8-mockup-hud-studio.png|640]]
![[Assets/Previews/UI-OVERHAUL/r8-mockup-my-pets-studio.png|640]]
Actual Studio Play captures, 2026-10-13, solo, viewport 2376x1113 (UI scale 1.46). Second capture: three cats adopted through the real pads, EQUIP BEST pressed, first card selected.

### Verification
- `tools/validate_project.py`: 56 files compile; layout suite passes with all eight side icons checked on six viewports (inside the screen, no overlap, one size, mirrored columns, even gaps); 148 core assertions pass.
- Studio Play: side buttons measured at x=14 (left) and 14 px from the right edge, 152x146 each, rows 158 px apart; EQUIP BEST changed the follower; card selection updated Pet Details; no errors in the console.
- Motion sampled 0.7 s apart with MY PETS open: stripes -40.0 -> -29.0 px, vortex 43.2 -> 64.2 deg, spark transparency 0.35 -> 0.95, showcase cat -2 -> 3 px, sunburst 305.3 -> 313.7 deg; pointer over AUTO-MERGE gave scale 1.05.
- Not verified: phone layouts of MY PETS (no small-screen capture), AUTO-MERGE and MERGE completing a merge in Studio (no duplicate pair was rolled), the 0.95 press squash, the Mythic rainbow, the other windows' look under the new dark theme (Battles, Realms, Settings, Rebirth, Starter Rewards, station workers were restyled by the theme but not re-captured).
- Backup before the wiring pass: `.tools/backup-2026-10-13/src-before-mockup-wiring` (taken after `UITheme`, HUD and MY PETS were already rewritten; the last full pre-rebuild copy is `src-before-map-fixes`).


## Revision 9 — REBIRTH window from the user's mockup (2026-10-13)

### Original request
> this is the mockup for the rebirth tab can u make it look like the other one utalize this prompt but priority is having similar stuff as the pet inventory tab

The pasted prompt asked for a React component: striped header, three columns (portal with a pulsing green REBIRTH NOW! button; a 4-wide milestone grid with ticks and padlocks; NEXT REBIRTH REWARDS with a chest, bullet list and gold PRESTIGE REBORN button) and a "Total Rebirth Multiplier" footer. Mockup saved as `design/ui-mockup-r1/rebirth-mockup.webp`.

### Expanded brief
Same shell and parts as MY PETS (striped header, three inset panels, bottom bar, card grid, glossy buttons), built as Roblox UI. Content limited to what the game has: rebirth pays Golden Yarn, each yarn adds a fixed share of coin income, cats are kept, stations and coins reset. Acceptance: offline suites pass, Studio capture, a real rebirth completed through the new buttons.

### What changed
- `PrestigeController.luau` rewritten. Left: turning, floating vortex on a stone pedestal with sparkles, round green button with a gold ring that pulses and glows once 500 coins are held. Middle: twelve Golden Yarn milestone cards (1, 2, 3, 5, 8, 10, 15, 20, 30, 50, 75, 100 yarn) showing the income bonus at that total, green tick when reached, padlock otherwise. Right: yarn showcase, "+N Golden Yarn" badge, three bullets, gold PRESTIGE REBORN. Bottom bar: total multiplier.
- Both buttons send the same `RequestPrestige`. Because a rebirth wipes stations and coins, the first press only arms the button for four seconds ("TAP AGAIN!"); the second press sends the request. The old window sent it on one press.
- `UITheme`: `sparkles` helper (MY PETS now uses it too), `bindActive` (gold sunburst behind a side icon while its window is open; used by Pets and Rebirth), and `animate` now keeps several motions per object (a card that wiggled lost its rainbow before; found while reading, never visible because no Mythic cat exists).
- Economy: the yarn bonus went from 25% to 3% per yarn at the user's request (`EconomyDefinitions.MULTIPLIER_PER_YARN`). Two pinned production tests updated; [[Systems/Prestige]] and [[Systems/Economy]] corrected.

### Differences from the mockup
- "Rebirths: 4" is "Golden Yarn: N": the game stores no rebirth count.
- Milestones are yarn totals with their real coin bonus. Luck, speed, multi-open and equip-slot perks do not exist, so none are shown.
- The showcase is the yarn icon, not a treasure chest (no chest art), and the bullets state the real outcome.
- Sub-text is "Needs 500 Coins" or "n / 500 Coins", not a cost: a rebirth resets coins to 100 rather than charging a price.
- The total multiplier sits in the bottom bar inside the window, as the collection bar does in MY PETS.

### Previews
![[Assets/Previews/UI-OVERHAUL/r9-rebirth-mockup-reference.webp|480]]
The user's mockup (reference image).

![[Assets/Previews/UI-OVERHAUL/r9-rebirth-ready-studio.png|640]]
![[Assets/Previews/UI-OVERHAUL/r9-rebirth-after-studio.png|640]]
Actual Studio Play captures, 2026-10-13, 2376x1113 viewport. First: 2,100 coins held, button ready. Second: after the rebirth, 2 yarn, two milestones reached, +6%. The 3D world is black in these and later captures of the session (the plain HUD capture is black too, with normal lighting values and 3,670 parts in the workspace), so it is recorded as the Studio view not rendering for the capture tool, not as a fault of this window; the UI layer is real.

### Verification
- Offline: 59 files compile, layout suite passes, 201 core assertions pass.
- Studio: not-ready state ("125 / 500 Coins", grey button); ready state (pulse 1.021 -> 1.040, glow on); first press armed both buttons and showed the warning; after six seconds it disarmed by itself; two presses performed the rebirth ("Earned 2 Golden Yarn (+6% permanent yield)"), coins 2,100 -> 100, yarn 0 -> 2, the window closed after two seconds; reopened it showed 2/12 milestones and +6%. Vortex, float and sparkles sampled moving. No script errors.
- Not verified: phone layouts (two extra arrangements exist in code), the gold button's own press, behaviour with very large yarn totals.
- A first attempt to earn the 500 coins by waiting failed twice (the Play session ended early for an unknown reason); the coins for the test above came from the Owner Panel.
