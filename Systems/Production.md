---
type: system
status: IMPLEMENTED
last_updated: 2026-10-12
---

# Production

## 2026-10-12 Optimization Update

ProductionUtil calculates a derived rate cached on profile/worker/yarn/world changes. Income ticks apply the current parade multiplier and award coins without full profile/inventory cloning. Plot assignment is gated on data readiness; starter grants are idempotent; station purchases commit cost/ownership together. Four roaming cats per plot are rendered, retaining all inventory, and server walking/stationary animation runs about 10 Hz. Existing five-station costs/yields and rounding remain unchanged. Reconnect, visual animation, and measured mobile performance still need Studio. See [[Technical/Optimization Pass 2026-10-12]].

---


Current implementation lives in TycoonService, not a separate ProductionService.
Five sequentially purchased stations generate income. Built station IDs and assigned
workers are saved; visual shells/stations are generated in server code. See
[[Systems/Workstations]], [[Systems/Economy]], and [[Technical/Data Schema]].

Each player is processed by a centralized loop after task.wait(1). The sum of
base station yield multiplied by each valid worker's CatUtil multiplier is scaled
by prestige, parade, and current realm multipliers. The final floor/minimum award
is applied through PlayerDataService:AddCurrency. This loop does not compensate
for actual tick duration or award offline production.

Acceptance remains incomplete: joining before profile readiness can lose station
restoration; rebuilding the starter station can grant extra starter inventory;
assignment visuals need cleanup when workers move; merging assigned cats can leave
references invalid. These findings are in [[Bugs/Bug Tracker]]. The physical
Egyptian station art was preserved in the current [[Systems/UI]] visual pass.


## 2026-10-14 — Catpedia collection bonus
Station income is now also multiplied by the Catpedia collection bonus: 1 plus a small rate for each species currently owned (+0.1% Common up to +1% Mythic/Secret; +3.7% with all ten current species). Values are placeholders. See [[Systems/Catpedia]].
