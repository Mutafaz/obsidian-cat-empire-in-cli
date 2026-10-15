---
type: ideas
title: Cooperative Battle Worlds
created: 2026-10-14
last_updated: 2026-10-14
status: PROPOSED
tags:
  - ideas
  - multiplayer
  - combat
  - exploration
---

# Cooperative Battle Worlds

Linked from [[Chat Ideas]] and [[Battle Progression Overhaul]]. Written design only. No game code, assets, maps, player data, or Studio state were changed.

## Original request

> I want to add a multiplayer portion fror the battles, also maybe each battle map isnt a map in the UI its actually a "world they teleport to where its designed and thats where they can fight". If they come in with a friend or two game it makes it a bit harder but insentive to bring a friend so maybe not double for two player but 1.5 strength or smtg. do u understnad what im saying or if u have a better suggestion tell me. In this way we can add they can find items or cat carriers on the way aswell

## User direction

- Add multiplayer cooperation to the battle progression idea.
- Battle destinations are actual playable worlds the player travels into, rather than fights existing only as nodes on a UI map.
- Allow solo play or bringing one/two friends.
- Increase difficulty with extra players, but by less than the extra strength those friends contribute. The user's example is about 1.5 strength for two players rather than double.
- Let players discover items and cat carriers while traveling through the world.

Exact combat controls, scaling numbers, item behavior, and run structure below are assistant recommendations, not confirmed implementation decisions.

## How the Explore menu fits

**Confirmed navigation — idea 008 in [[Chat Ideas]]:** Keep **Explore** for PvE destinations and party travel, and **Battle** for PvP. The earlier proposed Worlds/Arena renames were not selected. No game implementation was performed.

The Explore tab becomes a PvE world/party launcher. Choose a destination, see its recommended power and possible rewards, then choose **Play Solo** or **Invite Friends**. Everyone selects their cats and confirms Ready before **Travel**.

Once inside, move through the world rather than selecting each encounter from a menu. Trainers, enemy groups, optional discoveries, and the final boss occupy recognizable locations. The menu still shows unlocked destinations and progress, but it is not the whole adventure.

Suggested first structure: one compact playable route with a few encounters, a side path with a discovery, a checkpoint, and an end boss. The previous eight-encounter chapter layout can inform the route, but its count should not force a world to be long or empty.

Example flow: **Spawn → choose world → form party → travel → explore/fight → find a reward → checkpoint → world boss → results → return to spawn.**

Solo entry remains available. Other players need not be online for a player to progress. The suggested party limit is three trainers total, matching the user's one/two-friend example. This does not change the number of collection/team slots by itself.

## Scaling recommendation

Scale enemy health more strongly than enemy damage, keeping cooperation helpful without causing sudden one-hit defeats.

| Trainers in party | Enemy health | Enemy damage | Each eligible player's coins |
|---|---:|---:|---:|
| 1 | 1.00x | 1.00x | Normal reward |
| 2 | 1.50x | 1.10x | Normal reward +10% |
| 3 | 2.00x | 1.20x | Normal reward +20% |

Illustration: an enemy with 1,000 health and a 100-damage attack becomes 1,500 HP / 110 damage with two players, or 2,000 HP / 120 damage with three. These are prototype values, not balanced or tested stats. They apply to these party worlds, not automatically to the earlier server-boss event.

At equal individual damage output, two players provide roughly twice the damage against 1.5x health, so the fight can be quicker. Three provide about three times the damage against 2x health. Positioning, turn structure, player power differences, and actual encounter mechanics will affect the result. Do not promise exact completion times from these ratios.

The coin bonus is per participating player, not a shared pot divided by party size. It is modest because faster clears already reward cooperation. Keep carrier quality/odds the same for an eligible individual at a given world difficulty; do not require friends to access the best cats.

Choose an appropriate world based on a fixed difficulty/recommended power range. Do not automatically inflate every enemy to match IVY or the strongest party member, which would erase the benefit of getting stronger. Helping a weaker friend in an earlier world can be allowed; its rewards remain the earlier world's rewards.

## Encounters and each player's cats

Each trainer controls their own cats. Suggested presentation: one active cat per trainer, with the rest of their selected team available to switch in. Melman & Julian remain one team slot, and IVY retains her own type/rarity and strongest collectible status.

Entering a 3D world does not by itself decide whether combat is turn-based or real-time. Two options remain open:

- **World exploration plus encounter battles:** players walk together, then enter a focused shared fight when they engage an enemy. If turn-based, every participating trainer gets a meaningful action each round, with a timeout/default action so one idle player cannot block everyone.
- **Real-time world battles:** cats fight in the environment while trainers direct attacks, move, and dodge. This offers continuity but needs a different control and multiplayer design from the previously recommended turn-based fights.

The recommendation for now is to settle this interaction before detailed screen or environment design. Neither option is implemented or approved by this note. Keep PvP challenges separate from cooperative PvE worlds so joining a party is not consent to fight another player.

## Discoveries on the route

Use discoveries to make traveling worthwhile, without adding a separate full survival/crafting game.

- **Items:** possible examples are training supplies or limited battle-use recovery items. Exact item categories, inventory rules, and effects remain undecided.
- **Cat carriers:** occasional visible carriers, an optional encounter reward, or a discoverable cache that awards a carrier. Every carrier contains cats only.
- **Optional side encounters:** a harder group guarding a discovery gives the party a choice to take a detour.

Suggested mix: learnable pickup/encounter locations, with a small number of varied discovery locations or reward rolls each run. Avoid a huge empty map or random rewards so unreliable that exploring feels pointless.

Recommended loot rule: **personal entitlement**. If the party discovers a carrier cache, each eligible participant gets their own carrier or personal reward roll. One player opening it should not take everyone else's prize. Ordinary item pickups can also have an individual collected state. Carrier drops/odds must be defined and visible when appropriate before implementation.

No automatic shared-inventory trade, first-player-wins scramble, or proximity-only reward for an idle account is proposed. Nearby active party members can receive discovery credit without all having to click the object. Participation needs to include exploration and actual support actions if those mechanics exist, rather than only high damage. Do not exclude a weak friend just because their damage is lower.

Record each player's rewarded pickup/encounter for the run, so leaving/rejoining or opening the same object again cannot duplicate rewards. Normal replay rewards can be earned on a fresh legitimate run; one-time chapter/discovery milestones remain one-time.

IVY and Melman & Julian stay outside ordinary world-discovery carrier pools until their special acquisition is separately decided. Coins/items awarded by encounters or caches are separate rewards, never non-cat contents inserted into a carrier.

## Party continuity and progress

- Start with friends who are eligible for the chosen world; show any unlock requirement before Travel. Catch-up visits to an earlier unlocked world remain possible.
- Determine party scaling before an encounter. Do not increase enemy health halfway through because someone reconnects.
- If a friend disconnects, allow a bounded return to the same run and preserve collected rewards. Suggested scaling adjustment, if needed, occurs at the next encounter/checkpoint, not repeatedly during a fight. Exact reconnect timing remains undecided.
- Prevent joining/leaving from repeatedly changing health or creating extra reward entitlements.
- Save each player's qualifying completion individually. A party leader does not own everyone else's progression or rewards.
- A checkpoint can let the party recover and resume after a defeat. Keep already-earned rewards; do not consume cats or require a paid revive. Exact resume/run-failure policy needs a later decision.
- Results show that player's coins, items, carriers, and new unlocks, then **Return to Spawn** and an optional party-ready **Play Again**.

Whether a world is a party-specific run, a shared destination, or a separate Roblox place is a later implementation decision. The user-facing requirement is traveling together into a playable destination; this note does not mandate a teleport/network architecture.

## Relation to existing ideas

- Refines [[Battle Progression Overhaul]]: the progression route moves into playable worlds; Explore selects destinations/teams/party and shows progress, while Battle is reserved for PvP.
- Adds cooperative PvE alongside the already requested player challenges. PvP and the public spawn boss remain distinct activities.
- The earlier chapter counts, sample rewards, and menu-node layouts are historical proposals where they conflict with this newer direction.
- [[Cat Catalog - 1000 Concepts]] still supplies proposed cats, regular rarities, carrier pools, and merge routes. Any encounter/world reward balance must be designed alongside carrier prices and progression.
- [[Owner Admin Revamp and Security Review#Security Review — return-to checkpoint]] must be revisited for party eligibility, reward ownership, encounter scaling, team reservations, reconnects, and duplicate pickups/payouts when implementation is requested.
- The priority in idea 005 remains: decide the UI/gameplay flow first. It is useful to plan real-world gameplay now without beginning map construction or detailed visual polish.

## Decisions to revisit

Combat controls; who can join mid-run; downed/revive behavior; checkpoints; exact item types; carrier discovery frequency; party bonus values; party privacy; and the separation between replay rewards and once-only discoveries. No multiplayer playtest, map generation, reward grants, or runtime security verification was performed.

## Recommended combat direction — 2026-10-14

**User follow-up:**

> what do you think would be the most fun and engaging or even if you have a differennt

**Assistant recommendation, not a confirmed user decision:** Real-time cooperative exploration with simple tactical cat commands. Cats perform basic attacks after being directed to a target. Players choose targets, trigger abilities, command an evasion/recall, and switch their active cat. Everyone acts together while traveling and fighting through the world.

Suggested starting kit per player:

- One active cat, with two reserve collection slots available for switching. The duo is one slot, not an extra independent combat unit.
- A target command that keeps basic attacks going without repeated tapping.
- Two readable ability buttons, an evasion/recall command, and a compact cat-switch strip. Exact avatar movement and how evasion moves the trainer/cat need prototyping; they are not assumed solved.
- Visible enemy attack warnings and clear feedback when a cat is hurt, an ability is cooling down, or a switch is unavailable.

The appeal is participating at the same time as friends: react to danger, help with a difficult enemy, choose an optional detour, and discover a reward together. A player should have meaningful actions beyond watching a damage bar, while basic attacks do not require constant clicking. Phone controls and readable combat are essential constraints.

Use small enemy groups and a compact route with an approximate **8-12 minute** target for a normal run, subject to testing. Interleave short fights, discoveries, a checkpoint, and a boss. Replay variety can come from a few different side-path discoveries and encounter placements rather than immediately promising procedural worlds.

Example moment: the party spots a carrier cache off the main route, chooses to fight its guarding enemies, each eligible player receives their own reward, then the party reaches a boss whose marked pounces/stomps require timed responses. Stronger cats help, while readable attacks and decisions give players something to master.

Use a modest shared library of move templates with meaningful differences between selected cats; the 1,000-entry concept list does not require 1,000 unique move kits. Preserve the required power hierarchy for IVY and the duo. Exact ability assignment and balancing remain future decisions.

For the first prototype, validate one small encounter, movement/targeting, one or two abilities, switching, and a boss warning before expanding to many worlds. Solo, two-player, three-player, and touch play would need actual tests when implementation is requested. Detailed environment art can follow that interaction work.

Turn-based encounters remain an alternative if the user prefers a slower strategic experience. This recommendation updates the assistant's earlier preference because the new shared-world exploration direction places more value on simultaneous action and continuity. Do not build a second combat engine for PvP by default; decide whether the eventual combat controls can be reused there after the core experience is settled.
