---
type: system
status: IMPLEMENTED
last_updated: 2026-10-12
dependencies:
  - "[[Systems/Player Data]]"
  - "[[Systems/Cat Collection]]"
  - "[[Systems/Worlds]]"
---

# UI and Visual Presentation

The visual direction retains the Egyptian sanctuary: deep lapis panels, ivory text,
muted gold outlines, turquoise gain feedback, and warm sandstone world geometry.
Shared helpers live in `src/shared/UITheme.luau`; no economy or progression logic
was moved into presentation code.

- HUD: one sanctuary card, real loading state, comma-grouped balances, yarn,
  inventory count, trophy count, and current realm identity. Gain animation changes
  text color without stretching the whole UI.
- Navigation: four centered desktop buttons; two rows on safe-area widths below
  760 pixels. Existing controller handlers remain attached.
- Dialogs: inventory, expedition, combat, worlds, rebirth, settings, and worker
  assignment retain their internal layouts with a centered fitting UIScale.
  Scaling fits screens but can reduce text/control sizes; touch readability is NOT VERIFIED.
- Adoption: whole ceremony scales within the safe area. `CatPreview.luau` renders
  one static ViewportFrame using CatModelFactory, including species colors and
  accessories. The viewport has a private WorldModel/camera and no animation loop.
  It is destroyed with the reveal card; no imported asset upload is required.
- Parade: shorter wrapped event text and safe-area positioning clear the HUD.
- Map: 88 narrow gold ring segments instead of two filled disks, 24 turquoise
  avenue-edge strips, and 24 gold lane diamonds. All 136 inlays are non-colliding,
  non-touching, non-querying, and shadow-free.
- Clouds: fourteen atomic three-part groups move together on the client; low-detail
  mode reduces cloud update frequency. The former server part movement loop is removed.
- Lighting: reduced bloom, sunray intensity, and saturation; golden-hour lighting remains.

The existing `CozyMeadow` save identifier remains unchanged; its visible definition
is now Sacred Egyptian Oasis. New visuals are native Roblox geometry/UI; no external
bitmap or paid asset dependencies were added.

[[Testing/Visual Polish Checks]] records test evidence and outstanding Studio checks.
See [[Technical/Continuation Guide]] to resume and [[Technical/Project Audit 2026-10-12]]
for gameplay risks found during discovery.


## Studio overlap fixes — 2026-10-12

Open dialogs now use DisplayOrder 20 with panel ZIndex at least 10; closing restores the prior ScreenGui order and listeners disconnect on destruction. Adoption remains at 100. Compact portrait navigation reserves 120 pixels at the bottom to clear the native jump button. Actual iPhone 17 Pro landscape/portrait inventory captures confirm the title is no longer behind HUD/parade and portrait navigation clears jump by 30 pixels. Whole-panel scaling still shrinks text and close controls; full touch acceptance remains pending. See [[Testing/Studio Runtime Checks 2026-10-12]].


## Remade asset presentation — 2026-10-12

Inventory now displays actual CatPreview models on the first twelve cards per rebuild; further cards use labeled initials to bound geometry. Portrait camera fits projected bounds on resize and disconnects on destruction. Inventory alone uses bindModal reflow=true with full-size controls, taller scrolling cards and concise labels. Real iPhone simulation measured Close 44×44 and Follow 129×44. Other dialogs retain prior fitting behavior. [[Testing/Asset Remake 2026-10-12]].


## 2026-10-12 — Readability and navigation revision
UITheme uses white panel base under blue gradient (fixes dark-on-dark multiplication), rounded buttons, reuses existing gradients, closes a previous shared modal when another opens. Guide is permanently pageable. Arena now reflows portrait and compact landscape rather than uniformly shrinking. World cards use full-width48px buttons, descriptions and request/error feedback. Native assets preserved. Actual preview embeds and test detail: [[Assets/UI Navigation Revision]], [[Assets/Realm and Battle Brief]], [[Testing/Realms and Turn Battles 2026-10-12]].


## 2026-10-13 — Simulator-style overhaul
The lapis/gold look above is superseded. Current theme and rules: [[Assets/UI Overhaul 2026-10-13]]. Layout behaviour (navigation positions, modal fitting, exclusive modals) is unchanged. Not yet rendered in Studio.

## 2026-10-13 — mockup rebuild

Current look and layout are described in [[Assets/UI Overhaul 2026-10-13]] revision 8: dark slate windows with a striped purple header, three currency pills, and two mirrored columns of four frameless icons. Earlier descriptions in this note are historical.
