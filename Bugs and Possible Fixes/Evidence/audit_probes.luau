--!strict
-- Appended to the existing offline core harness. Assertions reproduce defects;
-- after a fix these should fail and be replaced with proper regression checks.
do
    local function profile()
        return Types.createDefaultPlayerData()
    end
    local function cat(id: string, species: string)
        return { uuid = id, catId = species, level = 1, obtainedTimestamp = 1 }
    end
    local function record(id: string)
        return { id = id, at = 1,
            a = { userId = 1, name = "Ann", cats = { cat("a", "tuxedo") } },
            b = { userId = 2, name = "Ben", cats = { cat("b", "calico") } } }
    end
    -- QA-001: third write fails, but the first user's recovery index survives.
    local base = TradeJournal.memoryStore()
    local writes, broken = 0, true
    TradeJournal.setStore({
        GetAsync = function(_self, key) return base:GetAsync(key) end,
        UpdateAsync = function(_self, key, transform)
            writes += 1
            if broken and writes == 3 then error("Injected third-write failure") end
            return base:UpdateAsync(key, transform)
        end,
    })
    assert(not TradeJournal.commit(record("partial")))
    broken = false
    local a, b = profile(), profile()
    a.inventory.a, b.inventory.b = cat("a", "tuxedo"), cat("b", "calico")
    local _, appliedA = TradeJournal.settle(1, a)
    local _, appliedB = TradeJournal.settle(2, b)
    assert(appliedA == 1 and appliedB == 0 and a.inventory.b and b.inventory.b)
    print("AUDIT: QA-001 reproduced: commit=false, recovery A=1/B=0, UUID b held by both profiles")

    -- QA-002: a journal read outage returns a usable pre-trade profile.
    TradeJournal.setStore({ GetAsync = function() error("Injected read outage") end })
    local unresolved = profile()
    local returned, applied = TradeJournal.settle(1, unresolved)
    assert(returned == unresolved and applied == 0)
    print("AUDIT: QA-002 reproduced: failed recovery read returns unchanged profile and 0, no failure signal")

    -- QA-003: idempotence is lost after the display history's 20-receipt limit.
    TradeJournal.setStore(TradeJournal.memoryStore())
    local history = profile()
    assert(TradeJournal.commit(record("old")))
    TradeJournal.apply(history, 1, record("old"))
    history.inventory.b = nil -- consumed in a later merge; no longer an independent cat
    for i = 1, 20 do
        local gift = { id = "new-" .. i, at = i + 1,
            a = { userId = 1, name = "Ann", cats = {} },
            b = { userId = 2, name = "Ben", cats = { cat("later-" .. i, "calico") } } }
        assert(TradeJournal.commit(gift))
        TradeJournal.apply(history, 1, gift)
    end
    assert(#history.tradeHistory == 20)
    local _, replayed = TradeJournal.settle(1, history)
    assert(replayed > 0 and history.inventory.b)
    print("AUDIT: QA-003 reproduced through settle: 20 newer receipts evict old id; rejoin recovery resurrects merged-away UUID b")

    -- QA-004: applying an old record does not require its outgoing cat to exist.
    local missing = profile()
    assert(not missing.inventory.a and TradeJournal.apply(missing, 1, record("missing")) and missing.inventory.b)
    print("AUDIT: QA-004 reproduced: recovery grants incoming cat even when outgoing UUID is absent")

    -- QA-005: a normal target consumes an owner-granted cat without inheriting provenance.
    TradeJournal.setStore(TradeJournal.memoryStore())
    local market = newEnvironment(true, failureStore, false)
    local p = market.player
    local regular = market.cats:GiveCat(p, "tuxedo", 1)
    local granted = market.cats:GiveCat(p, "tuxedo", 1, true)
    RequestGuard.forget(p)
    local merged = market.remotes.MergeCats.OnServerInvoke(p, regular.uuid, granted.uuid)
    assert(merged.success)
    local upgraded = market.data:GetData(p).inventory[regular.uuid]
    assert(upgraded.level == 2 and not upgraded.leaderboardExcluded)
    assert(market.data:GetStatsSnapshot(p).teamPower > 0)
    print("AUDIT: QA-005 reproduced through CatService: owner-granted input becomes eligible level-2 leaderboard power")

    -- QA-006: a removed UI feature retains reachable reward handlers.
    RequestGuard.forget(p)
    assert(market.remotes.StartExpedition.OnServerInvoke(p, "meadow").success)
    market.data:UpdateData(p, function(data) data.expeditions.meadow.finishTimestamp = 0 end)
    RequestGuard.forget(p)
    assert(market.remotes.ClaimExpedition.OnServerInvoke(p, "meadow").success)
    print("AUDIT: QA-006 reproduced through server handlers: disabled expedition UI still permits start and payout")

    -- QA-008: a prior server's positive Team Power is not cleared by a fresh zero.
    local published = { Global_TeamPower = { [tostring(p.UserId)] = 999 } }
    market.data:UpdateData(p, function(data) data.inventory = {}; data.fightMap.team = {} end)
    market.players.GetPlayers = function() return { p } end
    market.globalBoard.storeFor = function(key)
        published[key] = published[key] or {}
        return { SetAsync = function(_self, id, value) published[key][id] = value end }
    end
    market.globalBoard:Publish()
    assert(published.Global_TeamPower[tostring(p.UserId)] == 999)
    print("AUDIT: QA-008 reproduced through GlobalLeaderboardService: current Team Power 0 leaves prior stored 999")

    -- QA-019: load validation accepts an invalid upgrade map.
    local malformed = profile()
    malformed.inventory.bad = cat("bad", "tuxedo")
    malformed.inventory.bad.training = { strength = 10, invented = 2 }
    assert(not TrainingDefinitions.valid(malformed.inventory.bad.training))
    assert(pcall(Types.reconcilePlayerData, malformed))
    print("AUDIT: QA-019 reproduced: load accepts strength=10 and an unknown track, despite stricter upgrade definitions")
end
