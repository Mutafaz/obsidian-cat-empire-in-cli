---
type: technical
id: TECH-SECURITY
title: Technical Specification — Security & Anti-Exploit
last_updated: 2026-10-11
status: ACTIVE
tags:
  - technical
  - security
  - anti-exploit
---

# Security & Anti-Exploit Specification

## 2026-10-12 Optimization Update

Selected valuable operations now use RequestGuard spacing and server-side proximity/ownership checks, structural transaction rollback, profile leases, and merge-reference validation. BUG-008 mitigation is partial: remaining world/status/common aggregate request budgets, team reservations and actual multiplayer/adversarial engine tests remain open. No claim of a complete security certification. See [[Technical/Optimization Pass 2026-10-12]].

---


## 1. Zero-Trust Architecture
All client network packets are treated as potentially adversarial:
1. **Never Trust Client Numbers**: A client must never pass currency values, station costs, or level values. The client only sends intentions (e.g., `RequestBuyStation(stationId)`).
2. **Proximity Validation**: When a player interacts with a 3D world object (e.g. Tycoon button or Rescue box), verify that `(character.PrimaryPart.Position - target.Position).Magnitude <= MAX_INTERACTION_DISTANCE`.
3. **Type & Range Sanitization**:
   - Ensure numbers are positive, finite, and not `NaN`.
   - Ensure strings are trimmed and within length bounds.
4. **Rate Limiting**: RemoteEvent triggers are debounced per player (e.g., maximum 5 adoption calls per second) using token-bucket checks.


## Owner Panel — 2026-10-13

A privileged remote now exists (`AdminRequest`). It is closed to everyone but owners by a server-side UserId check; amounts, targets and durations are bounded in `AdminConfig`; owners cannot be kicked or banned through it; every attempt is logged. Details and the list of unverified cases: [[Systems/Owner Panel]]. `TRUST_STUDIO_TESTERS` only applies inside Roblox Studio.
