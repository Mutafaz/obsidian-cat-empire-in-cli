---
type: system
id: SYS-SHOP
title: System Specification — Shop (cat carriers)
created: 2026-10-14
last_updated: 2026-10-15
status: IMPLEMENTED (placeholder names and prices)
dependencies:
  - "[[Systems/Cat Collection]]"
  - "[[Systems/Economy]]"
tags:
  - system
  - economy
  - ui
---

# Shop — cat carriers

## Original request
This comes from [[Chat Ideas]] ("Cats and carriers"), built during the late night session ([[Late Night Session]]). The Chat Ideas wording:
> Buy different types of cat carriers from a little store at spawn … Carriers contain **cats only** … Carrier choices are based on the power of the cats.

## What exists
- The HUD **Shop** button opens a window with four carrier cards. Each card shows drawn carrier art, its price, its rarity floor, the real odds for every rarity it can give, and BUY (or NEED MORE COINS).

  | Carrier | Price (coins) | Gives |
  |---|---|---|
  | Starter | 50 | any cat, the same odds as the adoption box |
  | Cozy | 300 | Uncommon or better |
  | Royal | 1,500 | Rare or better |
  | Starlight | 6,000 | Epic or better |

- **Odds:** each carrier rolls one cat at or above its floor. The rarities above the floor keep their normal odds relative to each other (`CatUtil.rollCatIdAtLeast`, `CatUtil.oddsAtLeast`). Since tonight, Mythic is among them.
- **Server:** `BuyCarrier` charges and gives the cat in one profile transaction, then fires the NEW CAT reveal (`CatAdoptedCeremony`).
- **Placeholders:** the carrier names, prices and colours (`src/shared/CarrierDefinitions.luau`) await the user's decision.
- **Not the store at spawn:** the idea asks for a physical little store at spawn. This is a HUD window only; a 3D shop building is not made.
- The same carriers are rolled by the **carrier caches** in the worlds; see [[Systems/Explore and Battle]].

## Verification
- **Offline:**
  - the price is charged once;
  - too few coins is refused, with no cat given;
  - unknown carriers are refused;
  - each carrier never rolls below its floor;
  - the odds add up.
- **Studio Play, solo, 2026-10-15:** BUY on the Starter Carrier took 100 → 50 coins and gave a Tuxedo Cat with the NEW CAT reveal. The other three showed NEED MORE COINS. The odds text was read from the window.
- **Not verified:** buying the three dearer carriers; phones; several players.

![[Assets/Previews/SHOP/2026-10-14-r1-shop-carriers.png|640]]
![[Assets/Previews/SHOP/2026-10-15-r1-shop-bought-reveal.png|480]]

These are actual Studio Play captures, 1096x635.

## Files
`src/shared/CarrierDefinitions.luau`, `src/server/Services/ShopService.luau`, `src/client/Controllers/ShopController.luau`; `CatUtil` (rarityRank, rollCatIdAtLeast, oddsAtLeast).
