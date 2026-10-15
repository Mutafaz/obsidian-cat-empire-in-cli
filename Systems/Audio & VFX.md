---
type: system
id: SYS-AUDIO-VFX
title: System Specification — Audio, Visual Effects & Settings
last_updated: 2026-10-12
status: IMPLEMENTED
dependencies:
  - "[[Systems/Worlds]]"
  - "[[Systems/Combat]]"
  - "[[Systems/Cat Collection]]"
tags:
  - system
  - audio
  - sfx
  - vfx
  - settings
---

# Audio, Visual Effects & Performance Settings System

## 2026-10-12 Optimization Update

Low-detail mode now reversibly suppresses particles/trails/beams under managed game folders plus bloom/sunrays in Lighting, handling later emitters and preserving originally disabled/unrelated effects. CloudController already reduces cloud updates. HUD balance patches avoid full inventory/count refresh; income SFX/delta signals remain. Offline state restoration checks pass; real visuals/device profiling still need Studio. See [[Technical/Optimization Pass 2026-10-12]].

---


## 2026-10-12 Audit Update

HUD gain feedback now briefly tints the coin amount turquoise instead of stretching currency pills. CloudController moves complete groups locally and reduces update frequency in low-detail mode. The existing FX low-detail setting still does **not** disable all world emitters; the older claim that it instantly silences scene particles is not supported by current source. No new audio IDs were introduced or verified. See [[Systems/UI]] and [[Testing/Visual Polish Checks]].

---

The sections below retain the prior project record. Where prior completion or verification claims conflict with this audit, use the dated audit evidence.


## 1. Overview
The Audio & VFX architecture enhances player immersion through tactile audio feedback, realm ambient soundtrack cross-fades, particle pooling, floating coin indicators, and a mobile-friendly low-detail mode.

## 2. Audio System Architecture (`AudioController.luau`)
- **Sound Pooling**: 12 pre-allocated `Sound` instances under `SoundService.CatEmpireSFX` with randomized $\pm 5\%$ pitch variation to prevent acoustic fatigue.
- **Background Music Management**: Seamless linear cross-fading when traversing between distinct realms:
  - *Cozy Meadow (Egyptian Oasis Sanctuary)*: Mystical desert percussion, authentic Egyptian flute, and ambient drums (`rbxassetid://9043886567`, mapped to `BGM_AncientTemple`)
  - *Neon Cyber Cat City*: Driving synthwave track (`rbxassetid://9043887413`)
  - *Ancient Feline Temple*: Desert percussion and wind instruments (`rbxassetid://9043886567`)
  - *Celestial Cloud Kingdom*: Ethereal harp and choral ambient (`rbxassetid://9043887720`)
- **Tactile Sound Cues**:
  - `SFX_UIClick`: Crisp button press
  - `SFX_CoinPickup`: Income ticker and petting collection (throttled and delta-gated to only trigger on positive gains)
  - `SFX_CatMeow`: Petting interaction and adoption fanfare
  - `SFX_MergeAscend`: Ascending chimes on cat level merge
  - `SFX_PrestigeRebirth`: Deep celestial gong on sacred rebirth
  - `SFX_PortalWhoosh`: Realm portal warp transition
  - `SFX_CombatHit`: Physical attack strike impact in arena battles

## 3. Visual Effects System (`FXController.luau` & `HUDController.luau`)
- **HUD Punch Scale Animations**: Reactive `UIScale` spring bounce punch on currency pills when coins or golden yarn increment.
- **Floating Text Popups**: Rising, fading billboards emitting `+N 🐟` from the player's character whenever coins are gathered.
- **Celebration Particle Bursts**: Confetti and sparkle emitters on adoption, merge, and rebirth events.
- **Mobile Low Detail Mode**: Instantly silences heavy particle emitters on lower-end devices to maintain a solid 60 FPS target.

## 4. Game Settings Interface (`SettingsController.luau`)
- Modal accessible via the top-right gear icon (`⚙️ Settings`).
- User toggles:
  - Background Music (`ENABLED` / `MUTED`)
  - Sound Effects (`ENABLED` / `MUTED`)
  - Mobile Performance Mode (`ENABLED` / `MUTED`)
- Displays legal attribution credits for Kenney CC0 assets and Google Fredoka One open typography.


## Studio audio audit — 2026-10-12

Eight configured asset IDs were rejected by playback or identified as non-audio by Marketplace metadata. AssetRegistry now leaves those keys nil pending correct replacements, preserving old IDs in comments. Main Egyptian music is currently unavailable. Missing uiclick.mp3 uses installed volume_slider.ogg instead; ContentProvider preload succeeded in Studio. Audio metadata for the retained meadow/coin assets does not prove permissions or artistic suitability. Exact IDs/evidence: [[Testing/Studio Runtime Checks 2026-10-12]].
