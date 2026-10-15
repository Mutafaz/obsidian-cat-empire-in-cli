---
type: rules
id: RULES-DEV
title: Cat Empire — Codex & Assistant Development Rules
last_updated: 2026-10-11
status: ACTIVE
tags:
  - rules
  - development
  - guidelines
---

# Cat Empire — Codex Development Rules

> **Origin**: Sourced from `Some Rules or smtg idk.md` (now in `History/Legacy Notes/`).

## 1. Before Every Substantial Task
1. Read this file.
2. Read the [[Master Specification]].
3. Inspect the current project state.
4. Search the Obsidian vault for relevant system notes, assets, dependencies, and decisions.
5. Inspect the actual scripts and assets involved.
6. Prepare a short implementation plan before making significant changes.

## 2. Implementation Rules
- Use **Luau** with `--!strict` and established Roblox development conventions.
- Preserve existing working functionality.
- Reuse existing systems and assets when appropriate.
- Keep server-authoritative game state on the server.
- Keep cat definitions, economy configuration, and combat configuration data-driven.
- Validate all client requests that can affect game state.
- Do not add unnecessary dependencies.
- Do not create duplicate systems without first investigating existing implementations.
- Avoid unrelated refactors.
- **Never claim that a feature works without appropriate verification.**

## 3. Obsidian Rules
- Treat the Obsidian vault as the persistent project knowledge base.
- Verify vault access before claiming to have read or updated it.
- Search existing notes before creating new ones.
- Maintain asset records, system dependencies, decisions, bugs, and implementation status.
- Update documentation after meaningful changes.
- Distinguish between **PLANNED**, **IN PROGRESS**, **IMPLEMENTED**, **TESTED**, and **VERIFIED** features.
- Preserve historical decisions and unrelated notes.
- Never silently overwrite important documentation.

## 4. Testing Rules
- Define acceptance criteria before implementation.
- Run available checks after modifying code.
- Test relevant success and failure cases.
- Test multiplayer and persistence behavior where applicable.
- Report tests that could not be run.
- **Never label an untested feature as verified.**

## 5. Completion Report
For each substantial task, report:
- What changed.
- Files and systems affected.
- Tests performed.
- Test results.
- Known limitations.
- Documentation updated.
- Remaining work.
- Recommended next task.

## 6. Development Priority
Build a reliable, playable foundation first. Expand only after the current systems are implemented, tested, and documented.

## 7. Asset request and preview rule — user requested 2026-10-12
Before any asset implementation, apply `design/Asset Prompt Enhancer.md` to the verbatim user request using inspected project/source context. Show the original request and concise enhanced brief; store the full input/context/output and acceptance checks in an Obsidian asset note. Preserve intent and constraints; no invented gameplay or automatic permissions.

For every meaningful asset revision, save actual render snippets inside `Assets/Previews/<asset-id>/` in this vault and embed them in its note with date, revision, view/device, sources, and truthful status. Preserve older revisions for comparison. If rendering is blocked, record **Preview pending** and the reason; concept art or mockups must be labeled, never substituted as engine verification.

Examples: [[Assets/Calico Asset]], [[Assets/Asset Preview Gallery]]. AGENTS.md carries the same rules for future sessions.
