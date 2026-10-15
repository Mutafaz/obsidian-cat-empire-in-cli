---
type: technical
id: TECH-ROBLOX-ARCH
title: Technical Specification — Roblox Architecture
last_updated: 2026-10-12
status: ACTIVE
dependencies:
  - "[[Technical/Build and Sync]]"
tags:
  - technical
  - architecture
  - luau
---

# Technical Architecture

## 2026-10-12 Optimization Update

New server Modules folder contains ProfileStore and RequestGuard (not loaded as lifecycle services). New shared modules: EconomyDefinitions, ProductionUtil, PresentationState. PlayerDataService provides DataChanged, IsReady, GetCurrency, small stats/expedition snapshots, structural full sync and currency-only sync. DataController adds ProfileUpdated/InventoryChanged and revision ordering; consumers avoid rebuilding on unrelated income. Existing Rojo folder mapping includes these modules automatically. See [[Technical/Optimization Pass 2026-10-12]].

---


## 2026-10-12 Audit Update

New shared modules: `UITheme.luau` (presentation palette/layout), `CatPreview.luau` (isolated static adoption viewport). New controller: `CloudController.luau` (local whole-cloud movement). These are picked up by existing Rojo folder mappings and controller enumeration. [[Technical/File Inventory]] indexes all files and remotes. Packaging with Rojo does not validate Luau syntax/types; syntax checks are now separate using `tools/validate_project.py`. Studio types/runtime remain unverified.

---

The sections below retain the prior project record. Where prior completion or verification claims conflict with this audit, use the dated audit evidence.


## 1. Directory Structure & Rojo Mapping

```
Cat Empire Project Root/
├── src/
│   ├── shared/               -> ReplicatedStorage.CatEmpireShared
│   │   ├── Types.luau        -> Global type contracts (--!strict)
│   │   ├── CatDefinitions.luau -> 10 species stats & descriptions
│   │   ├── CatModelFactory.luau -> Blender mesh & procedural 3D rig builder
│   │   ├── CatUtil.luau      -> Rarity roll tables & merge math
│   │   ├── CombatUtil.luau   -> Turn-based battle simulation engine
│   │   ├── WorldDefinitions.luau -> 4 canonical realm definitions
│   │   ├── AssetRegistry.luau -> Roblox asset ID hot-swappable registry
│   │   ├── NetworkUtil.luau  -> Safe RemoteEvent & RemoteFunction factory
│   │   └── Signal.luau       -> Fast typed signal pattern
│   ├── server/               -> ServerScriptService.CatEmpireServer
│   │   ├── init.server.luau  -> Modular server bootstrapper (OnInit, OnStart)
│   │   └── Services/
│   │       ├── PlayerDataService.luau -> Authoritative persistence with mock store
│   │       ├── TycoonService.luau     -> 12-plot radial grid, Egyptian stations, wandering AI
│   │       ├── CatService.luau        -> Gacha adoption box, cat merging, pet follow sync
│   │       ├── MapService.luau        -> 1,000-stud Egyptian world, Sphinx, avenues, Nile moat
│   │       ├── WorldService.luau      -> Realm unlocking with Golden Yarn & teleportation
│   │       ├── CombatService.luau     -> 3 arena leagues, matchmaking & trophy progression
│   │       ├── ExpeditionService.luau -> Timed exploration missions & discovery rolls
│   │       ├── PrestigeService.luau   -> Sacred Rebirths, Golden Yarn & permanent multipliers
│   │       ├── ParadeService.luau     -> Server-wide Cat Parade 2x revenue events
│   │       └── LeaderboardService.luau-> 3D SurfaceGui global ranking monument
│   └── client/               -> StarterPlayer.StarterPlayerScripts.CatEmpireClient
│       ├── init.client.luau  -> Client bootstrapper (OnInit, OnStart)
│       └── Controllers/
│           ├── DataController.luau       -> Client state replication & currency change signals
│           ├── HUDController.luau        -> Responsive currency counters & punch animations
│           ├── InventoryController.luau  -> Fullscreen collection drawer, merging & equip
│           ├── StationUIController.luau  -> Station worker assignment modal & boost stats
│           ├── GachaController.luau      -> Dramatic gift-box unboxing sequence & reveal
│           ├── PetFollowController.luau  -> Smooth RenderStepped 3D follower companion lerping
│           ├── WorldController.luau      -> Realm travel browser & Golden Yarn unlocks
│           ├── PrestigeController.luau   -> Sacred Rebirth confirmation & perk analytics
│           ├── CombatController.luau     -> League selection, combat logs & victory fanfares
│           ├── ExpeditionController.luau -> Mission selection, countdown timers & rewards
│           ├── ParadeController.luau     -> Animated top banner for Cat Parade events
│           ├── AudioController.luau      -> Sound pooling, desert BGM, and pitch variance
│           ├── FXController.luau         -> Rising coin popups, celebration bursts, mobile mode
│           └── SettingsController.luau   -> Audio toggles, performance mode & license attribution
└── default.project.json      -> Rojo sync definitions
```

## 2. Service-Controller Lifecycle

Every Service (Server) and Controller (Client) follows a strict two-stage initialization:
1. `Init()`: Create signals, load configurations, construct internal tables. No cross-module method calls should occur here.
2. `Start()`: Connect to events, subscribe to external services, begin heartbeat loops.

## 3. Communication Patterns
- **Server to Client**: `RemoteEvent:FireClient(player, ...)` or `RemoteEvent:FireAllClients(...)`.
- **Client to Server**: `RemoteEvent:FireServer(...)` with strict server verification.
- **Internal Cross-Module**: Pure function calls or FastSignal patterns. Direct BindableEvents are minimized to reduce engine overhead.
