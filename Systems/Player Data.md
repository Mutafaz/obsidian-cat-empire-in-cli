---
type: system
id: SYS-PLAYER-DATA
title: System Specification — Player Data & Persistence
last_updated: 2026-10-12
status: IMPLEMENTED
dependencies:
  - "[[Technical/Data Schema]]"
  - "[[Technical/Security]]"
tags:
  - system
  - persistence
  - datastore
---

# Player Data & Persistence System

## 2026-10-12 Optimization Update

Current implementation replaces GetAsync/SetAsync with the injectable server-only ProfileStore UpdateAsync adapter. Failed live initialization/loads refuse writable sessions; invalid/future profiles are not reset. Private token/expiry leases are stripped from client data; saves check ownership. Studio defaults to an isolated memory store; UseLiveDataStore=true is deliberate opt-in. Save interval 120s, lease 600s, three retries, shutdown wait budget 25s. Structural transactions abort on false/error; income uses a small currency message. See [[Technical/Optimization Pass 2026-10-12]] for the full contract, unknown-outcome/crash limits, old-server rollout constraint, and offline test evidence. Real API tests remain pending.

---


## 2026-10-12 Audit Update

Source inspection confirms GetAsync/SetAsync and an in-memory fallback, but no cross-server session locking. A failed live read returns defaults that can later be saved over an existing profile (**BUG-006 / P0**). GetDataStore success also does not prove API requests will succeed; mock selection is incomplete for disabled API access. Prior checked verification statements are not new runtime evidence. Next task: fail-closed live loads, explicit Studio-only mock configuration, profile reconciliation, session protection, and failure/reconnect tests. See [[Technical/Project Audit 2026-10-12]].

---

The sections below retain the prior project record. Where prior completion or verification claims conflict with this audit, use the dated audit evidence.


## 1. Overview
Governs player state management, autosaving, session locking, and data migration across servers.

## 2. Core Requirements
1. **Session Locking**: Prevent item duplication and data overwrite when a player hops servers or experiences network disconnects.
2. **Safe Studio Fallback**: When testing in Roblox Studio without DataStore API access enabled, the game must fall back to an in-memory mock store seamlessly.
3. **Graceful Failure**: If DataStore operations fail repeatedly, the player must be locked in a read-only state or kicked with a friendly error message, never allowed to play in a state that could overwrite existing progress with an empty save.

## 3. Schema Structure
```luau
export type PlayerData = {
    fishCoins: number,
    goldenYarn: number,
    inventory: { [string]: PlayerCatInstance },
    tycoonData: TycoonPlotData?,
    unlockedWorlds: { string },
    lastSavedTimestamp: number,
}
```

## 4. Verification Checklist
- [x] Mock store fallback automatically activated when DataStoreService API is restricted.
- [x] Deep-cloning safeguards applied to prevent data pollution.
- [x] Sudden server shutdown (`game:BindToClose`) commits all pending saves.
- [x] Autosave loop runs every 300 seconds (5 minutes) with staggered saving across players.
- [x] Server-to-Client synchronization via RemoteEvent (`SyncPlayerData`) and RemoteFunction (`GetPlayerData`).

## 5. Service API Reference (`PlayerDataService.luau`)
- `:GetData(player: Player): PlayerData?` — Returns cloned copy of player session data.
- `:UpdateData(player: Player, mutator: (PlayerData) -> ()): boolean` — Mutates state and replicates to client.
- `:AddCurrency(player: Player, currency: CurrencyType, amount: number): boolean` — Validates amount and updates balance.
- `:SpendCurrency(player: Player, currency: CurrencyType, amount: number): boolean` — Verifies balance before deduction.
- Signals: `PlayerLoaded(player, data)`, `PlayerUnloading(player, data)`.
