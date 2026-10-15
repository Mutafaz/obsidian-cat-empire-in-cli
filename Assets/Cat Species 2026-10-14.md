---
type: asset
id: CAT-SPECIES
title: Five new cat species (CAT-011 to CAT-015)
created: 2026-10-15
last_updated: 2026-10-15
status: IMPLEMENTED AS NATIVE-PART STOPGAP — Blender models pending
tags:
  - asset
  - cats
---

# Five new cat species (CAT-011 to CAT-015)

> **Workflow note, stated plainly:** the asset prompt-enhancer step in `design/Asset Prompt Enhancer.md` was **not** run before these cats were made. The brief below was written afterwards, on 2026-10-15, from what was built. It is a record, not a plan that was followed. See [[Late Night Session]].

## Original request
> can you try implemetngint as many of the chat ideas as you can start with the easier ones until you run out of usage …

This asset came from the Chat Ideas line "Cats have different rarities, and different rarities have different powers", and from the empty Mythic tier. No specific cats were requested. [[Cat Catalog - 1000 Concepts]] is the user's larger concept list; these five do not use its CE identifiers.

## Brief, written afterwards
- **Goal:** fill each rarity from Common to Epic with one more species and make the first obtainable Mythic, so the Mythic shimmer, odds and Catpedia slots can actually be seen.
- **Visual specification:** reuse the existing soft-toy native model (`CleanCatBuilder`). Each new cat gets its own palette (`CatArtDefinitions`: fur, patch, eye, collar) and at least one distinctive marking:

  | Species | Markings |
  |---|---|
  | Grey Shorthair | White chin |
  | Ragdoll Snowpuff | Pale fur, brown mask patches, a fluffy bib |
  | Bengal Ember | Ginger fur with five dark rosette spots |
  | Maine Coon Ranger | Brown fur, ear tufts, mane ruff, green ranger scarf |
  | Aurora Lynx | Ice-blue fur, glowing (Neon) mint ear tufts, violet flank stripes, and a forehead gem |

- **Constraints:** no new scripts or emitters on the model; anchored and non-colliding parts as before; saved species ids are new and do not change existing ones.
- **Deliverables:** catalog entries, palettes, markings, a battle type and skill, lore, and Studio previews.
- **Assumptions:** the names, numbers and looks are the assistant's own placeholders for the user to change.

## Rules conflict
Since 2026-10-13 the project rule is to model new 3D assets in Blender (`assets/models/`) and import them. These five break that rule: they are colour and marking variants on the native builder, chosen so the gameplay (Mythic tier, Catpedia, Shop odds) could be tested tonight. **Blender models are still to do.** Until then, treat these as stand-ins.

## Gameplay numbers (placeholders)

| Species | Rarity | Type | Income (rate × multiplier) |
|---|---|---|---|
| Grey Shorthair | Common | Normal | 1.1 × 1.05 |
| Ragdoll Snowpuff | Uncommon | Ice | 2.7 × 1.8 |
| Bengal Ember | Rare | Fire | 6.0 × 2.8 |
| Maine Coon Ranger | Epic | Nature | 18 × 6.2 |
| Aurora Lynx | Mythic | Light | 150 × 30, lowered from 220 × 40 after Studio showed +8,800/s |

Mythic roll weight: 20 (Legendary 100).

## Previews

![[Assets/Previews/CAT-SPECIES/2026-10-14-r1-catpedia-aurora-lynx.png|480]]

Revision 1, 2026-10-14, Catpedia detail, Studio Play 1096x635. Aurora Lynx with the Mythic rosette. Actual render.

![[Assets/Previews/CAT-SPECIES/2026-10-14-r1-catpedia-bengal-ember.png|480]]

Revision 1, 2026-10-14, Catpedia detail, Studio Play. Bengal Ember with rosette spots. Actual render.

![[Assets/Previews/CAT-SPECIES/2026-10-14-r1-shop-mythic-odds.png|480]]

Revision 1, 2026-10-14, Shop, Studio Play. The Mythic row appears in each carrier's odds.

![[Assets/Previews/PETS/2026-10-14-r2-practice-button-fixed.png|480]]

2026-10-14, MY PETS, Studio Play. Aurora Lynx, Maine Coon Ranger and Bengal Ember cards (the Mythic rainbow border).

![[Assets/Previews/EXPLORE-BATTLE/2026-10-15-r4-cache-opened.png|480]]

2026-10-15, NEW CAT reveal, Studio Play. Grey Shorthair from the Verdant Grove cache.

**Not captured:** Ragdoll Snowpuff close up; front and three-quarter views of each model; any of the five in the world as a follower.

## Verification
- **Offline:** every species has a palette, a battle type, lore and a rollable rarity. Mythic odds are above zero and below Legendary.
- **Studio:** all five granted through the Owner Panel remote and rendered in the Catpedia, MY PETS and the reveal. No script errors.
