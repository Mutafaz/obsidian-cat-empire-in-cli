---
type: system
id: SYS-CATPEDIA
title: System Specification — Catpedia
created: 2026-10-14
last_updated: 2026-10-15
status: IMPLEMENTED (first version, placeholder bonus and reward values)
dependencies:
  - "[[Systems/Cat Collection]]"
  - "[[Systems/Production]]"
  - "[[Systems/Leaderboards]]"
tags:
  - system
  - collection
  - ui
---

# Catpedia

## Original request
> I have built catpedia in claude design I want you to implement it completley

followed by "can you actually go grab it". The user also pasted a build prompt written for a React component (`src/components/CatpediaModal.tsx`, CSS text strokes, 16 to 20 mock cats, CLAIM REWARDS breaking out of the bottom border, medals overlapping the category pills, hover/press scaling, rotating spotlight rays, Mythic rainbow shimmer).

## Source
The artboard `Catpedia.dc.html` (1920x1080) on the user's Claude Design canvas "Cat Empire – My Cats" (`https://claude.ai/artifact/Mkka7Ht1iViwRFH7Bhfer4`). Saved unchanged to `design/claude-design/catpedia-r1/project/`; a text copy sits beside the previews below. The attached reference image mentioned in the prompt did not arrive and was not used.

## Expanded brief
- Built as Roblox UI in Luau (the prompt's React/CSS wording translated), in the same window shell as MY PETS, Rebirth and Login Rewards, opened from the existing Catpedia side button.
- Layout from the artboard: CATEGORIES column with medal-badged pills on the left; the card grid with title count, search box, "TOTAL DISCOVERED" bar and the locked-cards switch in the middle; CAT DETAILS with a spotlight (turning rays, pulsing glow, golden pedestal, bobbing cat, twinkles), rarity rosette, name, status, description, collection bonus, and PREVIEW ANIMATIONS / LORE / SOUNDS on the right; CLAIM REWARDS hanging below the window frame with a small notch on top.
- Real data instead of the mock list: every species in `CatDefinitions` (ten today), with discovery from the saved record Codex added for the Collection leaderboard (`discoveredCats`) plus any species currently owned.

## Behaviour
- **Cards:** discovered species show the live 3D portrait, rarity label, highest owned level and a corner mark (paw = the species following you, tick = owned, padlock = not owned). Undiscovered species are black silhouettes with "?" and a padlock; their names stay hidden and are not searchable.
- **Categories:** All, Common, Uncommon, Rare, Epic, Legendary, Mythic, Secret. Uncommon was added because the game has that tier and the design did not. Mythic and Secret are empty today and show "No cats found".
- **Search** filters by name (discovered only) or rarity word as you type. **SHOW LOCKED** hides or shows the silhouettes; the design's label said "SHOW UNLOCKED" for the same switch, renamed so the label matches what it does.
- **Details:** STATUS is DISCOVERED (owned now), NOT OWNED (discovered before, none owned now) or UNDISCOVERED. LORE swaps the short description for a longer text and back. SOUNDS plays the existing cat meow. PREVIEW ANIMATIONS spins the 3D cat once on its pedestal with a little hop.
- **Collection bonus (new gameplay):** each species owned right now adds to station income: Common +0.1%, Uncommon +0.2%, Rare +0.3%, Epic +0.5%, Legendary +0.75%, Mythic and Secret +1%. All ten owned today gives +3.7%. Applied in `ProductionUtil.calculateRate`, on top of the yarn and realm multipliers; not applied to battle or petting rewards.
- **CLAIM REWARDS (new gameplay):** milestones for species discovered: 3 → 250 Coins, 5 → 600 Coins, 8 → 1 Golden Yarn, 10 → 3 Golden Yarn. One press pays every milestone reached and not yet paid; the button is green and pulses, and a red "!" shows on the Catpedia icon, only while something is waiting.
- **The bonus values, milestone rewards and the ten lore texts are placeholders** written for this build, in `src/shared/CatpediaDefinitions.luau`, awaiting the user's decision.

## How it works
- `CatpediaDefinitions` (shared, pure): bonus table, milestones, lore, and the discovered/owned/multiplier/pending rules both sides use.
- `CatpediaService`: RemoteFunction `ClaimCatpediaRewards` (no arguments, one request per second). Counts discoveries from the saved profile, pays the due milestones and records `catpediaClaimed` in one profile transaction.
- Saved field `catpediaClaimed` (milestones paid, in order); older saves start at 0; corrupt values are refused.
- `CatpediaController`: the window; reads the replicated profile only. `HUDController`'s Catpedia button opens it.
- `UITheme.springy` gained an optional second argument so a whole card grows and squashes while its invisible click layer receives the input.

## Verification
**Offline (`tools/core_fixture.luau`):** nothing discovered pays nothing; duplicates count once and keep the highest level; the bonus equals the owned species' rates and drops when a species is no longer owned while its discovery stays; first milestone exact and once; several milestones reached together pay together, each once; a completed Catpedia refuses further claims; unknown species in the saved record never count; bonus text formatting; older profiles gain the counter; negative, fractional, NaN, infinite and text counters refused; the three pinned income tests now include the bonus. `tools/validate_project.py`: 70 files compile, 559 core assertions and 80 Fight Map assertions pass.

**Studio Play, solo, 2026-10-14:** window opened from the side button with 0/10 and ten silhouettes; three cats granted through the Owner Panel's remote (Orange Tabby level 2, Calico, Cosmic Sphinx) turned their cards on, count 3/10, "Reward ready!", green button and the "!" badge; selecting Calico updated the details (+0.2%, Uncommon rosette); LORE showed the long text and BACK restored it; SOUNDS pressed; PREVIEW turned the model (yaw sampled -1.69 then -0.69); Legendary filter showed 2 cards, Mythic 0 with "No cats found"; SHOW LOCKED off left the 3 discovered cards; search "cal" left 1; CLAIM paid 250 coins (100 -> 350), the badge went out and a second press answered "Discover 5 cats to earn 600 Coins."; an undiscovered card showed ???, UNDISCOVERED and "(Discover to unlock)". No script errors.

**Not verified:** the NOT OWNED status in Studio (no way to give a cat away; covered offline); the income bonus measured on real station income; phones (the window scales down as one piece, no separate phone layout); several players; a real save and rejoin. Listed in [[Testing/Not Yet Tested]].

## Differences from the design
- 3D cat portraits instead of the artboard's 2D vector cats (the game's cats are 3D models; the design's cats were invented for the mockup).
- Ten real species instead of the 24 mock entries; counts read "n/10", not "45/120".
- The rosette is a twelve-point star built from three turned squares; the artboard draws a 24-point polygon.
- The gem icon on CLAIM REWARDS was left out (no matching art); the notch the prompt asked for is there.
- Uncommon category added; switch label reads SHOW LOCKED.

## Previews
![[Assets/Previews/CATPEDIA/r1-three-discovered-after-claim-studio.png|720]]
![[Assets/Previews/CATPEDIA/r1-lore-studio.png|720]]
![[Assets/Previews/CATPEDIA/r1-legendary-filter-studio.png|480]]
![[Assets/Previews/CATPEDIA/r1-undiscovered-selected-studio.png|480]]
Revision 1, actual Studio Play captures, 2026-10-14, 1096x635 viewport. The first is after the polish pass (bigger cat on the pedestal, rarity word fitted inside the rosette, claim button moved right of the bar text); the other three were taken just before that pass, so their pedestal and claim position differ slightly. Two captures from the same session came back with a black 3D view and empty portraits and were not used; a repeat run rendered normally.

## Implementation location
- `src/shared/CatpediaDefinitions.luau`, `src/server/Services/CatpediaService.luau`, `src/client/Controllers/CatpediaController.luau`
- Changed: `ProductionUtil.luau` (bonus), `Types.luau` (`catpediaClaimed`), `HUDController.luau` (button), `UITheme.luau` (`springy` visual argument)


## Late night session additions (2026-10-14/15)
Original request: "can you try implemetngint as many of the chat ideas as you can start with the easier ones…". See [[Late Night Session]].

### Five new species, including the first Mythic
- **The new species:**
  - Grey Shorthair (Common, Normal);
  - Ragdoll Snowpuff (Uncommon, Ice);
  - Bengal Ember (Rare, Fire);
  - Maine Coon Ranger (Epic, Nature);
  - **Aurora Lynx** (Mythic, Light).
- **Each one has:**
  - a palette (`CatArtDefinitions`);
  - its own markings on the native toy model (`CleanCatBuilder`): white chin, mask patches and bib, rosette spots, ear tufts with mane and scarf, and glowing aurora tufts, stripes and gem;
  - a battle type and skill;
  - lore text.
- **Mythic is now rollable.** Its weight is 20 against Legendary's 100, so it is 0.2% of a plain adoption or Starter Carrier roll and 3.8% of a Starlight Carrier. Before this, the Mythic shimmer could never be seen.
- **Placeholder numbers:**
  - Aurora Lynx income is 150 × 30 (it started at 220 × 40, which gave +8,800/s, about 3.5× the best Legendary, and was lowered);
  - the new Catpedia milestone: 15 species → 5 Golden Yarn.
- **Not built in Blender.** The project rule since 2026-10-13 is to model new 3D assets in Blender. These five reuse the existing native-part builder as palette and marking variants, as a stopgap. Proper models are still to do.

### "Best chance" note
- An undiscovered or unowned cat's detail shows the carrier with the best chance of that exact species, from the real odds, for example "Best chance: Starlight Carrier, 3.8%".
- **Bug fixed 2026-10-14:** the helper was defined below the function that called it. That made it nil at runtime, so opening the Catpedia without owning that cat raised an error. The validator compiles cleanly and so missed it. A `luau-analyze` unknown-name check was added to `tools/validate_project.py` so this kind of bug is caught offline from now on.

### Pin a goal (Chat Ideas 007 #2)
- **PIN GOAL / UNPIN** sits beside PREVIEW ANIMATIONS. Any species can be pinned, found or not. The pinned card gets a gold GOAL tag.
- **The goal chip** sits at the bottom of the HUD:
  - while hunting: "GOAL: a mystery Mythic cat • Best chance: Starlight Carrier, 3.8%" (the name shows once the cat is discovered);
  - once owned: green "GOAL REACHED!";
  - tapping it opens the Catpedia on that cat;
  - it hides while any window is open (new `UITheme.activeModal()`).
- **Server:** `PinCatpediaGoal(catId | false)`, saved as `catpediaPin`.
- **Merge recipe:** the idea's "exact merge recipe" does not apply. Merging here only levels up two of the same species.

### Verification
- **Offline:**
  - every species has a palette, type, lore and a rollable rarity;
  - Mythic odds are above zero and below Legendary;
  - the last milestone does not need more species than exist;
  - pin: unknown or junk values refused, an undiscovered cat can be pinned, the pin moves and clears, and the save format is checked.
- **Studio Play, solo:**
  - 15 cards, and the Aurora Lynx and Bengal Ember details;
  - the Shop's Starlight odds read Epic 77%, Legendary 19%, Mythic 3.8%;
  - pin, the GOAL tag, the chip on the HUD, the chip opening the Catpedia, and GOAL REACHED after the cat was granted.
- **Not verified:** phones; the chip next to mobile controls.

![[Assets/Previews/CAT-SPECIES/2026-10-14-r1-catpedia-aurora-lynx.png|480]]
![[Assets/Previews/CAT-SPECIES/2026-10-14-r1-catpedia-bengal-ember.png|480]]
![[Assets/Previews/CATPEDIA/2026-10-14-r2-pin-goal.png|480]]
![[Assets/Previews/CATPEDIA/2026-10-14-r2-goal-chip-r1.png|480]]
![[Assets/Previews/CATPEDIA/2026-10-14-r2-goal-chip-r2.png|480]]
![[Assets/Previews/CATPEDIA/2026-10-14-r2-goal-reached.png|480]]

These are actual Studio Play captures from 2026-10-14, solo, at 1096x635. Chip r1 is the dark first colour; r2 is the purple fix.
