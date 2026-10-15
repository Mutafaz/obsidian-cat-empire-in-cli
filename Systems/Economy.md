---
type: system
status: IMPLEMENTED
last_updated: 2026-10-12
---

# Economy

## 2026-10-12 Optimization Update

Existing adoption/prestige/max-level/roaming tuning is now shared in EconomyDefinitions; client/server prestige math uses the same helpers. ProductionUtil caches station × worker × prestige × world rate, with parade applied on each tick. Adoption/purchases/expedition claims commit currency with their related state atomically, and finite nonnegative totals are checked. No costs or reward curves were retuned; battle requests now have a ten-second cooldown. See [[Technical/Optimization Pass 2026-10-12]].

---


Current currencies are FishCoins and GoldenYarn; battleTrophies is a separate
profile counter. PlayerDataService:AddCurrency/SpendCurrency provide basic positive
finite amount checks and balance mutation. Some services mutate balances directly
through UpdateData. There is no EconomyService or EconomyUtil file despite an
earlier checked backlog item referring to EconomyUtil.

- Starter balance: 100 Fish Coins; adoption: 50 coins.
- Station costs/yields: 0/1, 25/3, 100/12, 250/30, 600/75.
- Income: station yield × worker × prestige × parade × current realm multiplier,
  floored with minimum 1, on a roughly one-second server tick.
- Prestige: at least 500 coins; floor(sqrt(coins/500)) yarn, minimum 1.
  Current yarn balance yields +3% income per yarn (25% until 2026-10-13) and can be spent on realms.
- Combat/expedition reward tables live inside their services.

Economy numbers are partly scattered/duplicated rather than fully shared configuration.
No transaction journal, offline accrual, Gems/Milk/ArenaTokens, inventory cap, or
common request limiter exists. Fix [[Systems/Player Data]]/BUG-006 before release and
BUG-008 before treating combat rewards as exploit resistant. See [[Systems/Production]]
and [[Technical/Project Audit 2026-10-12]].


## 2026-10-14 — Catpedia
New coin and yarn sources: Catpedia milestones (250 and 600 Coins, then 1 and 3 Golden Yarn at 3/5/8/10 species), and a passive income bonus of up to +3.7% for owning every species. Placeholder values; see [[Systems/Catpedia]].
