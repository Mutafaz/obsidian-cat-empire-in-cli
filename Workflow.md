---
type: guide
id: GUIDE-WORKFLOW
title: Cat Empire — Development Workflow
last_updated: 2026-10-11
status: ACTIVE
tags:
  - workflow
  - loop
  - processes
---

# Cat Empire — Development Workflow

> **Origin**: Consolidated from `Untitled.md`.

## The 6-Step Feature Development Loop

```
01 RETRIEVE CONTEXT
   └── Search Obsidian and inspect the current Studio project.

02 PLAN CHANGES
   └── Identify scripts, assets, dependencies, and acceptance criteria.

03 IMPLEMENT
   └── Make focused changes using the existing architecture.

04 VERIFY
   └── Run available tests and record any remaining manual checks.

05 UPDATE KNOWLEDGE
   └── Update asset records, system notes, tests, and changelog.

06 CONTINUE
   └── Choose the next task from the verified project backlog.
```

---

## Asset Registry Growth Categories

Your registry should eventually include more than cat models:

| Asset Category | Example Records | Target Location in Vault |
|---|---|---|
| **Cats** | Orange Tabby, Robo-Kitten, Cosmic Sphinx | `Assets/Cats/` |
| **Buildings** | Catnip Lab, Cardboard Box Factory, Arena | `Assets/Buildings/` |
| **Props** | Cat beds, feeders, scratching posts | `Assets/Props/` |
| **UI** | Currency icons, cat cards, battle indicators | `Assets/UI/` |
| **Animation** | Idle, walking, merging, attacks | `Assets/Animation/` |
| **Audio** | UI sounds, ambience, battle effects | `Assets/Audio/` |
| **Visual Effects** | Evolution, rewards, abilities | `Assets/VFX/` |
| **Systems** | Scripts, modules, remotes, configurations | `Systems/` |

---

## Authority Model

- **Roblox Studio / Workspace Scripts**: Authoritative for whether code/assets exist and current runtime implementation.
- **Obsidian Vault**: Authoritative for approved design decisions, intended behavior, asset metadata, system relationships, and historical context.
- **[[Master Specification]]**: Defines overall project vision and direction.
