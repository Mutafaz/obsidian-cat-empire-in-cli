---
type: testing
status: TESTED
last_updated: 2026-10-12
---

# Visual Polish Checks

## Acceptance criteria set before implementation

Preserve Egyptian identity and existing action handlers; create cohesive UI with
small-screen fitting; make balances follow server state; preserve saved realm IDs;
remove filled-disk plaza inlays and detached cloud puffs; keep new decoration
non-colliding; build/compile successfully; record unavailable runtime checks honestly.

## Local evidence

| Check | Environment | Result | Limits |
|---|---|---|---|
| All source begins `--!strict` and syntax compiles | Official Luau 0.742 CLI, `tools/validate_project.py` | PASS | Not Roblox type checking |
| Four actual navigation helpers fit and do not overlap | Actual UITheme source in offline instance mocks; 320x568, 390x844, 768x1024, 844x326, 1280x720, 1920x1080 | PASS | Does not model Roblox rendering/CoreGui or mobile joystick |
| Seven actual modal helpers fit, resize on rotation, disconnect on destruction | Same fixture, all six viewports plus rotated dimensions | PASS | Scaling may reduce control/text readability |
| HUD balance grouping: 0, 999, 1000, 1 million, 123456789 | Actual formatBalance function with Luau runtime | PASS | UI clipping/contrast require viewport review |
| Rojo source mapping and local place build | Rojo 7.7.1 | PASS | Rojo packaging does not parse/type-check game scripts |
| Whitespace/error-marker check | `git diff --check` | PASS | Source check only |
| Local Rojo server responds as CatEmpire on 34872 | Read-only HTTP status | PASS | Connected Studio plugin not established |
| Studio solo, two players, saves/reconnect, asset rendering, performance | Roblox Studio | NOT RUN | No live Studio test/viewport integration available |

Re-run `python tools/validate_project.py`, `rojo build default.project.json --output
CatEmpire-preview.rbxlx`, `rojo sourcemap default.project.json --output sourcemap.json`,
and `git diff --check`. Compiler/runtime executables stay in ignored `.tools/luau`.

## Studio review procedure — NOT RUN

1. In an unpublished local place, sync the existing Rojo connection and restart Play.
   Use disposable test data. Review Output and Script Analysis for errors.
2. At desktop and mobile/emulator sizes, inspect currency hierarchy and exact balances,
   wait for a profile, then gain/spend coins. Check yarn, cat count, trophies, and realm
   display update on authoritative sync. Confirm compact rebirth/settings do not collide.
3. Open each of the seven dialogs; check clipping, scrolling, text readability, touch
   targets, existing close buttons and every action. Rotate during an open dialog.
   Specifically check mobile joystick/jump controls against bottom navigation.
4. Adopt a cat: ceremony stays on-screen; model faces camera; ears/tail/crown fit;
   collect closes the reveal and removes blur. Try several species/custom imported models.
5. Walk around the Sphinx: sandstone remains visible inside gold borders; no floor
   flicker; new avenue markings align with plots and block no walking/prompt interaction.
6. Observe clouds for a minute and across their wrap boundary: all three puffs stay
   together. Toggle low-detail mode. Check streaming behavior if enabled in Studio.
7. With two players, check separate plots, UI, pets, cloud appearance, travel, and
   interactions. Profile added geometry and the one adoption portrait on mobile.
8. Record screenshots/logs and results here. Mark visual acceptance VERIFIED only
   after these checks pass. Persistence/security blockers remain separate release gates.
