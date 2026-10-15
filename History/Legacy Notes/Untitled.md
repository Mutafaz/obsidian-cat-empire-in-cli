# Cat Empire — Notes & Workflow

> **Note**: This file's contents have been organized into [[Workflow]] and [[Assets/Asset Registry]]. Retained for historical continuity.

Obsidian vault

Stores Markdown notes, asset records, system specifications, and project history.

Authorized connector

Provides Codex with the actual ability to search, read, and optionally write vault files.

## 3. Build an asset registry that can grow with the game

Your registry should eventually include more than cat models.

|Asset category|Example records|
|---|---|
|Cats|Orange Tabby, Robo-Kitten, Cosmic Sphinx|
|Buildings|Catnip Lab, Cardboard Box Factory, Arena|
|Props|Cat beds, feeders, scratching posts|
|UI|Currency icons, cat cards, battle indicators|
|Animation|Idle, walking, merging, attacks|
|Audio|UI sounds, ambience, battle effects|
|Visual effects|Evolution, rewards, abilities|
|Systems|Scripts, modules, remotes, configurations|
## Establish the development loop

Use this process for every significant feature.

01

Retrieve context

Search Obsidian and inspect the current Studio project.

02

Plan changes

Identify scripts, assets, dependencies, and acceptance criteria.

03

Implement

Make focused changes using the existing architecture.

04

Verify

Run available tests and record any remaining manual checks.

05

Update knowledge

Update asset records, system notes, tests, and changelog.

06

Continue

Choose the next task from the verified project backlog.
CatEmpire/
├── AGENTS.md
├── README.md
├── game-design/
│   ├── GAME_DESIGN.md
│   ├── SYSTEMS.md
│   └── ROADMAP.md
├── assets/
│   ├── ASSET_CATALOG.md
│   ├── LICENSES.md
│   ├── references/
│   └── generated/
├── roblox/
│   └── src/
└── tasks/
    └── BACKLOG.md