# Realms and turn battles — 2026-10-12

Original request: "can you continue working I also want you to add different realms and also use gratify or whatever its called. I want the battels be like pokemon style." Clarification: Graphify.

Context: Four existing realms, three automatic arena divisions, ten existing cat species. Keep saved species/world IDs and economy. User deferred cat art redesign. Native Roblox only.

Expanded brief: Add Verdant Grove and Frostpeak as distinct walkable procedural realms, with an unobstructed arrival plaza, perimeter barriers, spaced tree/crystal landmarks, a rival interaction, and a return pad. Green forest and pale blue frost palettes distinguish them. Reuse existing cat models. Turn battle UI uses two readable combatant cards with HP, four move buttons, a party switch selector, battle messages, and explicit forfeit. Server owns stats, PP, turn order, type matchups, result, and one-time reward. Closing menus must not create a second session or duplicate rewards. Preserve existing arena tiers and add realm-gated rivals. No imported Pokemon characters, art, music, or branding.

Acceptance: invalid/replayed turn requests rejected, fainted cats do not act, switching spends a turn, PP bounded, no rewards for forfeit, realm purchase atomic, destination safe, native UI fits desktop and phone. Save actual rendered snippets here after Studio verification. Runtime previews pending until available; code/build tests do not prove rendering.

## Delivered revision 1 — 2026-10-12

Native playable prototypes, with existing cat models intentionally preserved. RealmBuilder + RealmLayout provide clear paths, static scenery, safety walls, return prompts and rival prompts. Verdant Grove unlock is free; Frostpeak costs 3 Golden Yarn. CombatController uses existing CatPreview models and shared UITheme. The portrait battle menu reflows; landscape uses a compact two-column arrangement. This is not finished environment art or the full Cat Trainer specification.

Actual Studio Play captures, revision 1, 2026-10-12:

![[Assets/Previews/REALMS-BATTLES/verdant-grove-r1-2026-10-12.jpg|480]]
Verdant Grove overview, camera positioned for inspection. HUD still says Frostpeak because that is the test player's recorded realm; camera movement is not travel. Sources: RealmBuilder, RealmLayout. Verified render of native prototype.

![[Assets/Previews/REALMS-BATTLES/frostpeak-r1-2026-10-12.jpg|480]]
Frostpeak overview, including test player, return pad, rival and perimeter. Source: RealmBuilder. Verified render; crystals/scenery remain simple placeholders.

![[Assets/Previews/REALMS-BATTLES/battle-desktop-r1-2026-10-12.jpg|480]]
Desktop turn-battle screen against Grove Keepers; level 8 is deliberately seeded Studio mock data. Source: CombatController, CatPreview, UITheme. Actual move-button interaction checked separately.

![[Assets/Previews/REALMS-BATTLES/battle-phone-r1-2026-10-12.jpg|320]]
iPhone 17 Pro portrait, 401×778 logical viewport. Test fixture uses level 50; not a new-player reward. Four moves are 164.5×56, switch is 106.3×56, forfeit 337×48. Mobile visual/layout check; physical touch interaction not established.

![[Assets/Previews/REALMS-BATTLES/battle-landscape-r1-2026-10-12.jpg|480]]
Final iPhone landscape revision: four moves visible beside compact fighter cards. Scrolling reaches the lower log and forfeit. Actual native render, no compositing.

See [[Testing/Realms and Turn Battles 2026-10-12]] for failures, fixes, checks and remaining scope.
