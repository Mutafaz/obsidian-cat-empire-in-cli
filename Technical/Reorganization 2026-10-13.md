---
type: record
title: Directory and vault reorganization
created: 2026-10-13
status: DONE
tags:
  - housekeeping
---

# Directory and vault reorganization — 2026-10-13

Requested by the user: "can you organize the directory and the obsidian vault". Files were moved, never deleted, and no file was renamed. To undo a move, move the file back to the path in the left column.

## Where things live now

**Project root** holds only the entry points: `AGENTS.md`, `GEMINI.md`, `README.md`, `default.project.json`, `skills-lock.json`, the generated `sourcemap.json` and `CatEmpire-preview.rbxlx`, and the folders `src/`, `tools/`, `assets/`, `design/`, `Obsidian/`.

**design/**: the four guides and `tokens.current.json` at the top (AGENTS.md points at them there); `originals/` for files exactly as the user supplied them; `ui-mockup-r1/` for the working copies of the mockups; `claude-design/` for icon sets and the Claude Design export; `calico/` for the calico study; `reference/` for the vendored design library.

**Vault root** holds the seven core notes: Home, Master Specification, Development Rules, Workflow, Roadmap, Project Status, Task Backlog. Everything else is in a folder:

| Folder | Contents |
|---|---|
| `Systems/` | one note per game system, including [[Systems/Owner Panel]] |
| `Technical/` | architecture, data, remotes, security, build, continuation guide, audits, this record |
| `Assets/` | asset notes, `Previews/<asset-id>/` captures, `Reference Examples/` (user-supplied reference images) |
| `Ideas/` | brainstorming that is not approved for building: [[Chat Ideas]], [[Cat Catalog - 1000 Concepts]], [[Owner Admin Revamp and Security Review]] |
| `History/` | superseded drafts and `Legacy Notes/` (early notes kept for the record) |
| `Testing/`, `Bugs/`, `Decisions/`, `Releases/` | test records, bug tracker, decision log, changelog |

**.tools/** (ignored by Git): tool folders and backups stay where the tools and notes expect them; 76 loose capture and patch files from earlier sessions are grouped under `.tools/archive/<kind>/`. `core_harness.luau`, `ui_layout_harness.luau`, `validation.json` and the two Rojo logs stay at the top because the tools write them there.

## Moves

| From | To |
|---|---|
| `UI mockup png.jpg` | `design/originals/UI mockup png.jpg` |
| `Colorful storefront icon with striped awning.png` | `design/originals/Colorful storefront icon with striped awning.png` |
| `design/calico-figma-brief.md` | `design/calico/calico-figma-brief.md` |
| `design/calico-figma-build.js` | `design/calico/calico-figma-build.js` |
| `design/calico-front.svg` | `design/calico/calico-front.svg` |
| `design/calico-side.svg` | `design/calico/calico-side.svg` |
| `Obsidian/Cat Empire In CLI/Sample UI.png` | `Obsidian/Cat Empire In CLI/Assets/Reference Examples/UI/Sample UI.png` |
| `Obsidian/Cat Empire In CLI/Sample UI 2.png` | `Obsidian/Cat Empire In CLI/Assets/Reference Examples/UI/Sample UI 2.png` |
| `Obsidian/Cat Empire In CLI/Sample UI 3.png` | `Obsidian/Cat Empire In CLI/Assets/Reference Examples/UI/Sample UI 3.png` |
| `Obsidian/Cat Empire In CLI/Sample UI 4.png` | `Obsidian/Cat Empire In CLI/Assets/Reference Examples/UI/Sample UI 4.png` |
| `Obsidian/Cat Empire In CLI/Sample UI 5.png` | `Obsidian/Cat Empire In CLI/Assets/Reference Examples/UI/Sample UI 5.png` |
| `Obsidian/Cat Empire In CLI/Sample UI 6.png` | `Obsidian/Cat Empire In CLI/Assets/Reference Examples/UI/Sample UI 6.png` |
| `Obsidian/Cat Empire In CLI/Sample UI 7.png` | `Obsidian/Cat Empire In CLI/Assets/Reference Examples/UI/Sample UI 7.png` |
| `Obsidian/Cat Empire In CLI/Pasted image 20261013101158.png` | `Obsidian/Cat Empire In CLI/Assets/Reference Examples/UI/Pasted image 20261013101158.png` |
| `Obsidian/Cat Empire In CLI/Untitled.md` | `Obsidian/Cat Empire In CLI/History/Legacy Notes/Untitled.md` |
| `Obsidian/Cat Empire In CLI/Untitled 1.md` | `Obsidian/Cat Empire In CLI/History/Legacy Notes/Untitled 1.md` |
| `Obsidian/Cat Empire In CLI/Some Rules or smtg idk.md` | `Obsidian/Cat Empire In CLI/History/Legacy Notes/Some Rules or smtg idk.md` |
| `Obsidian/Cat Empire In CLI/Master Game plan.md` | `Obsidian/Cat Empire In CLI/History/Legacy Notes/Master Game plan.md` |
| `Obsidian/Cat Empire In CLI/Chat Ideas.md` | `Obsidian/Cat Empire In CLI/Ideas/Chat Ideas.md` |
| `Obsidian/Cat Empire In CLI/Cat Catalog - 1000 Concepts.md` | `Obsidian/Cat Empire In CLI/Ideas/Cat Catalog - 1000 Concepts.md` |
| `Obsidian/Cat Empire In CLI/Owner Admin Revamp and Security Review.md` | `Obsidian/Cat Empire In CLI/Ideas/Owner Admin Revamp and Security Review.md` |

## Checked afterwards
- Links to the moved notes and images are by file name, which Obsidian resolves wherever the file sits; the four places that named an old path in running text were updated.
- `tools/validate_project.py` passes; [[Technical/File Inventory]] regenerated.
- `Pasted image 20261013101158.png` is byte-identical to `Sample UI 7.png`; `Master Game plan.md` duplicates the Master Specification; `Untitled 1.md` is empty. All three were kept.
- Left alone on purpose: `assets/models/` has both `Cat_OrangeTabby` and `Cat_orange_tabby` files; which one is current was not determined.
- Not done: Obsidian still saves pasted images to the vault root. Setting "Default location for new attachments" to `Assets/Reference Examples/` in Obsidian's Files and links settings would stop that.
