---
type: bug-audit
created: 2026-10-15
status: REVIEW COMPLETE - NO GAME FIXES APPLIED
tags: [bugs, audit, suggestions]
---

# Bugs and Possible Fixes

Read-only review requested by the user: go through the different things the game does, document bugs and possible fixes, and suggest UI improvements. **No game code, game assets, configuration, existing notes, or Studio state were changed.** Everything authored for this review is in this folder. Running the existing validator regenerated its ignored `.tools` reports/harnesses.

This is a broad source and integration review, with eight additional offline defect probes. It is **not** a complete gameplay certification. Studio was inspected in Edit mode; no fresh Play session, live save, real trade, multiplayer test, asset upload, or publication was performed.

## Read these notes

| Note | Contents |
|---|---|
| [[Bugs and Possible Fixes/01 - Trading and Recovery]] | Three critical recovery defects; disconnect and long-write risks |
| [[Bugs and Possible Fixes/02 - Collection Economy and Leaderboards]] | Merge provenance, hidden expedition rewards, rankings, misleading income label |
| [[Bugs and Possible Fixes/03 - Battles Explore and Events]] | Boss encounter conflicts, payout failures, combat and party acceptance checks |
| [[Bugs and Possible Fixes/04 - UI Bugs and Better UI Suggestions]] | Phone sizing defects, small buttons, error feedback, screen-by-screen suggestions |
| [[Bugs and Possible Fixes/05 - Persistence Security Performance and Assets]] | Upgrade validation, unguarded reads, startup reporting, performance risks, audio gaps |
| [[Bugs and Possible Fixes/06 - System Coverage and Playtest Checklist]] | Every current service and player-facing area, review depth, remaining tests |
| [[Bugs and Possible Fixes/07 - Evidence and Handoff]] | Commands, results, limitations, source preservation, next review order |

## Meaning of the labels

- **OFFLINE REPRODUCED:** current production modules executed in the existing test mocks demonstrate the defect. Roblox scheduling and live DataStores remain untested.
- **SOURCE CONFIRMED:** a concrete mismatch or failure path is present in current source; the described Studio interaction was not run this session.
- **SOURCE + SIZE CALCULATION:** dimensions and scaling produce the stated result mathematically; no fresh phone screenshot is implied.
- **RISK / NEEDS REPRO:** plausible timing, integration, or performance concern with source evidence, still awaiting a targeted experiment.
- **SUGGESTION / CONTENT GAP:** improvement or missing content, not a claim that working gameplay is broken.

P0 = stop live trading/release until addressed; P1 = high-impact integrity or player outcome; P2 = usability, correctness or reliability; P3 = polish. Proposed fixes are advice only. No item was fixed here.

## Prioritized findings

| ID | Priority | Finding | Evidence | Detail |
|---|---|---|---|---|
| QA-001 | P0 | Partial journal commit can duplicate a cat across two profiles | Offline reproduced | [[01 - Trading and Recovery#QA-001 - A failed commit can still recover only one side]] |
| QA-002 | P0 | Failed journal recovery reads allow unresolved profiles to play | Offline reproduced + load path | [[01 - Trading and Recovery#QA-002 - Recovery fails open]] |
| QA-003 | P0 | Trimming trade history destroys recovery idempotence | Offline reproduced | [[01 - Trading and Recovery#QA-003 - Old trades can apply again after twenty newer trades]] |
| QA-004 | P1 | Recovery grants incoming cats even if outgoing cats disappeared | Offline reproduced; real interleaving pending | [[01 - Trading and Recovery#QA-004 - Recovery does not validate outgoing ownership]] |
| QA-005 | P1 | Merge can turn an owner-granted cat into eligible leaderboard power | Offline reproduced through CatService | [[02 - Collection Economy and Leaderboards#QA-005 - Merging loses owner-grant provenance]] |
| QA-006 | P1 | Removed expedition UI leaves reward-bearing server endpoints active | Offline reproduced through server handlers | [[02 - Collection Economy and Leaderboards#QA-006 - Hidden expeditions still pay rewards]] |
| QA-007 | P1 | Departure publication can miss a player's final leaderboard score | Risk / needs lifecycle test | [[02 - Collection Economy and Leaderboards#QA-007 - Final global scores can be missed on leaving]] |
| QA-008 | P2 | Fresh-server zero Team Power fails to clear an old positive global score | Offline reproduced | [[02 - Collection Economy and Leaderboards#QA-008 - Zero Team Power leaves an old global score]] |
| QA-009 | P2 | Global tabs can display rows belonging to a different category | Source confirmed; latency test pending | [[02 - Collection Economy and Leaderboards#QA-009 - Global tab results are not tied to the selected tab]] |
| QA-010 | P1 | Disconnect can say a trade was cancelled while its commit continues | Source confirmed; timing test pending | [[01 - Trading and Recovery#QA-010 - Leaving during commit gives a false cancellation message]] |
| QA-011 | P1 | Trade inventory locks expire while a slow journal write can continue | Risk / needs slow-store test | [[01 - Trading and Recovery#QA-011 - A slow commit can outlive its inventory locks]] |
| QA-012 | P2 | Boss attacks ignore other encounter reservations and use a changing team | Source confirmed; intended policy needs decision | [[03 - Battles Explore and Events#QA-012 - Boss combat bypasses the shared encounter lock]] |
| QA-013 | P1 | Boss payout refusal is mislabeled as already paid and has no retry | Source confirmed; injected failure test pending | [[03 - Battles Explore and Events#QA-013 - Failed boss payout has no recovery path]] |
| QA-014 | P2 | Desktop-sized modals shrink phone controls below useful touch size | Source + size calculation | [[04 - UI Bugs and Better UI Suggestions#QA-014 - Whole-window scaling makes phone controls tiny]] |
| QA-015 | P2 | Trade popup, trade receipt and boss receipt exceed narrow phone width | Source + size calculation | [[04 - UI Bugs and Better UI Suggestions#QA-015 - Fixed-width popups extend beyond narrow screens]] |
| QA-016 | P2 | Important pet and station actions have undersized touch targets | Source confirmed | [[04 - UI Bugs and Better UI Suggestions#QA-016 - Pet and station controls are too short for touch]] |
| QA-017 | P2 | Pet Details advertises a Coins/s value that is not actual income | Source confirmed | [[02 - Collection Economy and Leaderboards#QA-017 - Pet income label does not match the production system]] |
| QA-018 | P2 | Station assignment silently ignores refusals and unhandled remote errors | Source confirmed | [[04 - UI Bugs and Better UI Suggestions#QA-018 - Station assignment has silent failure paths]] |
| QA-019 | P2 | Save validation accepts unknown and over-cap upgrade tracks | Offline reproduced | [[05 - Persistence Security Performance and Assets#QA-019 - Upgrade save validation disagrees with upgrade rules]] |
| QA-020 | P2 | Event and expedition status reads bypass the overall request budget | Source confirmed | [[05 - Persistence Security Performance and Assets#QA-020 - Some read endpoints bypass the overall request budget]] |
| QA-021 | P2 | Configured home music and several feedback sounds have no asset | Source confirmed content gap | [[05 - Persistence Security Performance and Assets#QA-021 - Missing sound assets leave important feedback silent]] |
| QA-022 | P2 | Bootstrap reports success even after lifecycle failures | Source confirmed | [[05 - Persistence Security Performance and Assets#QA-022 - Startup success logging does not mean successful initialization]] |

Eight findings have additional offline reproductions: QA-001, 002, 003, 004, 005, 006, 008 and 019. The remaining labels deliberately distinguish source evidence from engine verification.

## Recommended order

First repair and fault-test trade recovery (QA-001 through QA-004), then protect commit lifetime and messages. Next resolve leaderboard provenance, hidden expeditions and boss payout handling. Then run real two-player acceptance before expanding these systems. Phone reflow and clear income/error feedback are the highest-value UI work.

Historical trackers are preserved: [[Bugs/Bug Tracker]], [[Testing/Not Yet Tested]], [[Early Morning Session]]. Their older statements of crash safety or completed testing must be read with the new evidence here; this folder does not silently rewrite them.
