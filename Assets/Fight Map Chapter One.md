# Fight Map Chapter One — implementation brief, 2026-10-13

## Original request
> can you do the battle **Fight Map chapter one, server side**: eight prepared fights with different mini battles until boss fight at end (none can be the main boss) overhaul current battle thing the UI will be completed by calude but you can make a basic one under the battle button where its just a map you can scroll through make the battle fights be like dragon legends battle type for PVE

## Verified context and expanded brief
The current CombatService owns turn-based NPC arena sessions; CombatController owns the Battle button. Existing cat catalog, CatPreview and UITheme are available. Chat Ideas/Battle Progression Overhaul proposes sequential prepared fights and first-clear/replay earnings. User now requests a new PvE battle style and a basic UI handoff to Claude.

Build a vertically scrolling Chapter One path with eight connected nodes, selected/locked/cleared states and a distinct chapter boss. Keep current theme and reusable button/modal styling; no new 3D assets. Show fixed enemies, rewards, a 1–3-cat selector, and a resume path. Provide a functional basic turn-based combat screen with portraits, HP, elemental moves, switches and forfeit. The later visual design remains Claude's work.

User clarified the reference: **Dragon City mobile**, superseding the initial Dragon Ball Legends assumption. Use turn-based cat-team combat and elemental attack choices; no real-time card/dodge mechanics. Reuse the tested TurnBattle engine with new prepared opponent patterns. Captain Bramble is a chapter-only calico rival, not the main/server boss. Do not add unbuilt chapters or silently replace the passive-income system as part of this scoped request.

## Acceptance
Eight fixed nodes unlock in order; no main-boss entries. Server owns team validation, immutable combat snapshots, turns, elemental damage, enemy patterns, results and atomic reward+clear mutations. First-clear rewards occur once, replays use smaller rewards; no win on forfeit/disconnect/expiry. Existing collections/balances/history survive migration. No client damage/time/reward input. Reject duplicate, stale, malformed and locked-node requests. Ordinary starter can beat fight one. Scroll/select/start/resume/return work in Studio. Save real preview snippets here; visual status remains pending until captured.
