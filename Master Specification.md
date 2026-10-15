# CAT EMPIRE

# MASTER PROJECT SPECIFICATION FOR OPENAI CODEX, ROBLOX STUDIO, AND OBSIDIAN

Document type: Master development specification  
Project: Cat Empire  
Platform: Roblox  
Primary development agent: OpenAI Codex  
Game engine and editor: Roblox Studio  
Persistent project knowledge base: Obsidian  
Primary language: Luau  
Project status: To be determined by initial inspection  
Priority: Build a functional, secure, expandable game with documented systems and a reliable development workflow.

---

# PART 1 — THE MISSION

## 1.1 Your role

You are the primary AI software engineer and technical game designer responsible for developing Cat Empire inside Roblox Studio.

Act as a combination of:

- Senior Roblox developer.
    
- Luau programmer.
    
- Game systems architect.
    
- Gameplay designer.
    
- UI developer.
    
- Multiplayer engineer.
    
- Data and persistence engineer.
    
- Technical artist when appropriate.
    
- Quality assurance engineer.
    
- Project documentation manager.
    

Your responsibility is to turn the Cat Empire design into a functioning Roblox experience, not merely generate example scripts or describe how someone else could build it.

You must understand the existing project before making changes, work in manageable increments, verify your implementations, and maintain the Obsidian knowledge base so that future development can build on previous work.

Use the tools that are actually available in your Codex environment. Inspect their capabilities rather than assuming that every desired operation is possible.

## 1.2 Primary objective

Build a Roblox game in which players:

1. Start with a small cat sanctuary.
    
2. Collect cats and purchase additional kittens.
    
3. Merge compatible cats into stronger forms.
    
4. Assign cats to workstations and production rooms.
    
5. Generate and collect resources.
    
6. Upgrade their cats, rooms, automation, and sanctuary.
    
7. Explore areas and complete expeditions.
    
8. Evolve cats into rare, powerful, and visually distinctive forms.
    
9. Assemble competitive cat teams.
    
10. Compete against other players in cat battles and other multiplayer activities.
    
11. Earn competitive rewards and climb seasonal rankings.
    
12. Prestige for permanent progression bonuses.
    
13. Expand and customize their sanctuary.
    
14. Return later and retain their valid progress.
    

The experience must support both casual idle play and active competitive play.

## 1.3 The three-part development environment

Treat the project as three interconnected systems.

### Roblox Studio: implementation

Roblox Studio contains the actual game:

- Luau scripts.
    
- ModuleScripts.
    
- Models.
    
- Maps.
    
- UI.
    
- Animations.
    
- Sounds.
    
- Remote communication objects.
    
- Game configuration.
    
- Testing environments.
    
- Actual implemented mechanics.
    

### Obsidian: project knowledge

Obsidian contains the organized knowledge needed to develop the game:

- Asset registry.
    
- System documentation.
    
- Game design.
    
- Architecture.
    
- Dependencies.
    
- Approved decisions.
    
- Planned features.
    
- Testing records.
    
- Bugs.
    
- Changelogs.
    
- Development roadmap.
    

### Codex: reasoning and execution

Codex connects these two worlds by:

- Searching project documentation.
    
- Inspecting actual code.
    
- Comparing the intended design with the current implementation.
    
- Planning changes.
    
- Editing scripts.
    
- Running available tests.
    
- Inspecting results.
    
- Updating documentation.
    
- Identifying unfinished work.
    

The intended relationship is:

OBSIDIAN DOCUMENTATION → CODEX PLANNING → ROBLOX IMPLEMENTATION → TESTING → OBSIDIAN UPDATE

The process must be iterative. Do not treat the master specification as a substitute for inspecting the actual game.

## 1.4 Core development principles

Follow these principles in every phase.

1. Inspect before modifying.
    
2. Reuse existing working systems where practical.
    
3. Make small, reversible changes.
    
4. Keep gameplay systems modular.
    
5. Make the server authoritative over valuable game state.
    
6. Keep the economy configurable.
    
7. Keep cat definitions data-driven.
    
8. Test multiplayer behavior explicitly.
    
9. Document decisions and dependencies.
    
10. Never claim that an untested feature works.
    
11. Never silently discard player data.
    
12. Never overwrite important project notes without understanding their purpose.
    
13. Prefer a working, polished vertical slice over a large collection of incomplete features.
    
14. Build the foundation so additional cats, abilities, rooms, and modes can be added without rewriting the core architecture.
    

---

# PART 2 — CODEX WORKSPACE AND OBSIDIAN INTEGRATION

## 2.1 Inspect the available tools first

Before starting implementation, determine which capabilities are available to you.

Inspect:

- The current working directory.
    
- The project repository, if one exists.
    
- The Roblox Studio integration.
    
- Available file-editing tools.
    
- Available shell or terminal tools.
    
- Available test execution tools.
    
- Available MCP servers.
    
- Available Obsidian integrations.
    
- Relevant existing Codex instructions.
    
- Existing project documentation.
    

Do not assume that Codex can automatically read Roblox Studio's live Explorer, click Studio controls, or execute Studio tests. Those capabilities depend on the tools and integrations actually configured.

Record what is accessible and what is not.

## 2.2 Establish an authoritative project root

Identify the primary project directory and the location of the Obsidian vault.

If the Roblox project uses Rojo or another source-controlled workflow, identify the existing configuration and preserve its conventions.

If the project is primarily edited in Studio, determine how scripts and assets are currently organized and how changes can be safely applied.

Do not introduce a new project synchronization architecture until you understand the current workflow.

The project root should contain or reference:

- Source code, where applicable.
    
- Project configuration.
    
- Development instructions.
    
- Tests.
    
- Documentation.
    
- Asset metadata.
    
- Version-control configuration, if used.
    

Do not copy the entire Obsidian vault into the Roblox game or replicate private project notes to clients.

## 2.3 Connect Obsidian through an actual authorized interface

Determine whether the current Codex installation can access the vault through:

- Direct authorized filesystem access.
    
- A supported MCP server.
    
- A compatible Obsidian connector.
    
- Another available, documented integration.
    

Use the simplest reliable method supported by the environment.

If direct file access is available and permitted, Markdown files can be searched and edited as ordinary text files.

If an MCP server is used, inspect its documented tools and permissions before using them.

Verify that the integration can perform the specific operations required:

- List relevant notes.
    
- Search note contents.
    
- Read individual notes.
    
- Follow or resolve links where supported.
    
- Create notes.
    
- Update notes.
    
- Verify that changes were saved.
    

If the integration is read-only, document that limitation and use the authorized write method if one exists.

Never claim the vault is connected until a real read operation succeeds.

## 2.4 Create a dedicated project knowledge area

If the vault already contains Cat Empire notes, inspect and reuse them.

If it does not, establish a dedicated Cat Empire folder without reorganizing unrelated personal notes.

Recommended structure:

Cat Empire/

- Home.md
    
- Master Specification.md
    
- Game Design Document.md
    
- Project Status.md
    
- Roadmap.md
    
- Task Backlog.md
    
- Architecture/
    
- Assets/
    
    - Asset Registry.md
        
    - Cats/
        
    - Buildings/
        
    - Props/
        
    - UI/
        
    - Audio/
        
    - Animation/
        
    - VFX/
        
- Systems/
    
    - Player Data.md
        
    - Cat Collection.md
        
    - Cat Merging.md
        
    - Economy.md
        
    - Production.md
        
    - Sanctuary.md
        
    - Automation.md
        
    - Cat Evolution.md
        
    - Prestige.md
        
    - Expeditions.md
        
    - Combat.md
        
    - Matchmaking.md
        
    - Leaderboards.md
        
    - UI.md
        
- Technical/
    
    - Roblox Architecture.md
        
    - Remotes.md
        
    - Data Schema.md
        
    - Persistence.md
        
    - Security.md
        
    - Performance.md
        
    - Build and Sync.md
        
- Decisions/
    
    - Decision Log.md
        
- Testing/
    
    - Test Plan.md
        
    - Test Results.md
        
    - Multiplayer Tests.md
        
    - Persistence Tests.md
        
- Bugs/
    
    - Bug Tracker.md
        
- Releases/
    
    - Changelog.md
        
    - Release Checklist.md
        
- Ideas/
    
    - Future Features.md
        

This structure is a starting point. Adapt it to existing vault conventions and avoid creating redundant folders.

## 2.5 The Home note

Create a Home note that acts as the knowledge-base entry point.

It should contain links to:

- The master specification.
    
- The game design document.
    
- Current project status.
    
- Current roadmap.
    
- Highest-priority tasks.
    
- Architecture.
    
- Asset registry.
    
- System documentation.
    
- Open bugs.
    
- Decision log.
    
- Latest changelog.
    

The Home note should also record:

- Last verified project state.
    
- Last successful test run.
    
- Current development phase.
    
- Known blocking issues.
    
- Obsidian integration status.
    
- Roblox project integration status.
    

Do not update the verified project state simply because a script was edited.

## 2.6 Establish one source of truth for each kind of information

Use this authority model.

Actual Roblox project:

- Authoritative for whether a script or asset exists.
    
- Authoritative for current implemented code.
    
- Authoritative for actual object names and paths.
    
- Authoritative for tested runtime behavior only when test evidence exists.
    

Obsidian:

- Authoritative for approved design decisions.
    
- Authoritative for intended behavior.
    
- Authoritative for asset catalog metadata.
    
- Authoritative for system relationships.
    
- Authoritative for known issues and development history.
    
- Authoritative for implementation status when backed by evidence.
    

Master specification:

- Defines the intended overall direction.
    
- Does not override verified project constraints without an explicit design decision.
    

When these sources disagree, do not silently choose one.

Record the discrepancy, investigate it, and determine whether the implementation or the design should change.

## 2.7 Use structured Obsidian metadata

Use YAML properties for information that should be machine-readable.

Example asset record:

---

type: asset  
id: CAT-001  
name: Orange Tabby  
category: cat-model  
status: planned  
roblox_path:  
dependencies:

- "[[Cat Definitions]]"
    
- "[[Cat Collection]]"  
    tags:
    
- asset
    
- cat  
    last_verified:
    

---

Use a consistent vocabulary for statuses:

- PLANNED
    
- IN PROGRESS
    
- IMPLEMENTED
    
- TESTED
    
- VERIFIED
    
- BLOCKED
    
- DEPRECATED
    

Definitions:

PLANNED means the feature is documented but not implemented.

IN PROGRESS means work has started but acceptance criteria are incomplete.

IMPLEMENTED means the code or asset has been created, but verification may be incomplete.

TESTED means the feature has undergone the documented tests, with results recorded.

VERIFIED means the required acceptance criteria passed in the relevant environment.

BLOCKED means an unresolved dependency or tool limitation prevents progress.

DEPRECATED means the item should no longer be used, but its record is retained for historical context.

Never use VERIFIED solely because code exists.

## 2.8 Use relationships rather than isolated notes

Create internal links between related records.

For example:

[[Orange Tabby]]  
links to [[Cat Definitions]], [[Cat Collection]], [[Cat Merging]], and [[Combat]].

[[Combat]]  
links to [[Cat Definitions]], [[Battle UI]], [[Matchmaking]], [[Player Data]], and [[Security]].

[[Cat Merging]]  
links to [[Cat Inventory]], [[Economy]], [[Data Schema]], and [[Persistence]].

[[Cardboard Box Factory]]  
links to [[Sanctuary]], [[Production]], [[Room Upgrades]], and its registered model assets.

Where possible, maintain both forward and reverse references so it is easy to determine:

- What a feature depends on.
    
- What depends on that feature.
    
- Where an asset is used.
    
- Which tests cover a system.
    
- Which tasks are blocked by an unresolved decision.
    

## 2.9 Search workflow

Before implementing a feature:

1. Search for the feature name.
    
2. Search for synonyms and related mechanics.
    
3. Open the relevant system notes.
    
4. Inspect linked assets.
    
5. Inspect the architecture notes.
    
6. Read the relevant decision records.
    
7. Read related bug reports.
    
8. Inspect actual Studio code.
    
9. Produce a concise dependency map.
    
10. Identify missing information before modifying anything.
    

Do not assume that a single matching note contains the entire relevant design.

## 2.10 Documentation update workflow

After each meaningful implementation:

1. Update the feature's system note.
    
2. Record changed scripts and assets.
    
3. Update the asset registry if necessary.
    
4. Update dependencies.
    
5. Record test results.
    
6. Update the bug tracker.
    
7. Update the roadmap or task backlog.
    
8. Add an entry to the changelog.
    
9. Update the Home note if the overall project state changed.
    

Do not rewrite the entire vault after each task.

Modify only the relevant notes and keep edits focused.

## 2.11 Protect the vault

Never:

- Delete the vault.
    
- Delete unrelated notes.
    
- Reorganize unrelated personal content.
    
- Replace the entire vault with generated documentation.
    
- Remove historical decisions simply because the design changed.
    
- Overwrite the only copy of important notes without a recovery path.
    

Use version control or backups when available.

For potentially destructive changes, prepare the proposed change and verify its scope before applying it.

---

# PART 3 — CODEX PROJECT INSTRUCTIONS

## 3.1 Establish an AGENTS.md file

If the project root has no AGENTS.md, create one containing the core project instructions.

If an existing AGENTS.md exists, inspect it and integrate these requirements without destroying useful existing instructions.

AGENTS.md should instruct Codex to:

- Read the master specification before substantial work.
    
- Inspect the actual project before editing.
    
- Search Obsidian for relevant design and implementation notes.
    
- Follow the project's architecture and naming conventions.
    
- Keep Luau code modular.
    
- Keep authoritative game state on the server.
    
- Avoid unnecessary dependencies.
    
- Test changes.
    
- Report unverified behavior honestly.
    
- Update Obsidian after meaningful changes.
    
- Avoid destructive modifications without authorization.
    
- Prefer small changes with clear acceptance criteria.
    

Do not put the entire game design document into AGENTS.md. Keep the file focused on instructions that should be followed repeatedly.

## 3.2 Recommended task workflow

For every development task, follow this sequence.

### A. Understand

Read the relevant specification, code, notes, and dependencies.

### B. Plan

Define:

- Intended behavior.
    
- Files to change.
    
- Existing systems involved.
    
- Risks.
    
- Test scenarios.
    
- Documentation to update.
    

### C. Implement

Make the smallest complete implementation that meets the requirements.

### D. Verify

Run available static checks, tests, and Studio validation.

If Studio is not accessible, state which verification remains necessary.

### E. Document

Update Obsidian with actual behavior, code locations, tests, and known limitations.

### F. Report

Summarize:

- What changed.
    
- Why it changed.
    
- Which files were modified.
    
- Which tests ran.
    
- Which tests passed or failed.
    
- What remains incomplete.
    
- Which Obsidian notes were updated.
    

## 3.3 Do not confuse tool availability with tool success

A configured integration does not guarantee that every operation succeeds.

A file editor does not necessarily control Roblox Studio.

A Studio integration does not necessarily provide full filesystem access.

A successful script edit does not prove that the script runs.

A successful local test does not prove that a live multiplayer environment works.

Report actual capabilities and actual results.

---

# PART 4 — GAME DESIGN AND CORE EXPERIENCE

## 4.1 Game identity

Cat Empire is a Roblox cat-collection and empire-building game combining:

- Idle progression.
    
- Pet collection.
    
- Merge mechanics.
    
- Tycoon construction.
    
- Resource production.
    
- Cat training and evolution.
    
- Expeditions.
    
- Sanctuary customization.
    
- Competitive cat battles.
    
- Multiplayer social interaction.
    
- Prestige and long-term progression.
    

The game's identity should be built around the idea that players are growing a living cat empire rather than simply collecting interchangeable stat upgrades.

## 4.2 The main gameplay loop

The primary loop is:

COLLECT → MERGE → ASSIGN → PRODUCE → UPGRADE → EXPLORE → COMPETE → PRESTIGE → EXPAND

Each activity must contribute to at least one longer-term goal.

Collecting unlocks new options.

Merging improves cats and collection progression.

Assigning cats makes the sanctuary productive.

Production funds upgrades.

Upgrades improve production and unlock new features.

Exploration supplies rare materials.

Competition provides mastery, rewards, and status.

Prestige accelerates future progression.

Expansion creates new spaces, activities, and goals.

## 4.3 Three layers of player goals

Short-term goals:

- Collect a resource.
    
- Buy a kitten.
    
- Complete a merge.
    
- Upgrade a room.
    
- Claim an expedition reward.
    
- Complete a battle.
    

Medium-term goals:

- Unlock a new room.
    
- Complete a cat evolution.
    
- Improve a five-cat team.
    
- Reach a new competitive league.
    
- Unlock an additional sanctuary floor.
    

Long-term goals:

- Complete the cat collection.
    
- Obtain rare evolutions.
    
- Reach a high seasonal rank.
    
- Unlock permanent prestige upgrades.
    
- Fully customize the sanctuary.
    
- Master multiple combat strategies.
    

Avoid progression that consists only of increasingly expensive purchases.

New stages should introduce new decisions, mechanics, or meaningful customization.

## 4.4 Player onboarding

Create a tutorial that introduces mechanics in a logical order.

Suggested tutorial:

1. Welcome the player to the sanctuary.
    
2. Introduce their starter kitten.
    
3. Show how to collect Fish Coins.
    
4. Teach the player to purchase a second kitten.
    
5. Explain merging.
    
6. Introduce the first production room.
    
7. Teach cat assignment.
    
8. Show the first room upgrade.
    
9. Introduce the collection screen.
    
10. Preview the arena as a future unlock.
    

The tutorial should be short and skippable where practical.

Persist tutorial progress so it does not repeatedly restart for returning players.

Avoid introducing all currencies and systems at once.

## 4.5 First-session success criteria

During the first session, a player should be able to:

- Understand the main objective.
    
- Obtain and display cats.
    
- Perform at least one merge.
    
- Assign a cat to a production room.
    
- Earn and spend a resource.
    
- See a visible improvement in their sanctuary.
    
- Understand what they can work toward next.
    

The first session should not require lengthy passive waiting before the player can perform meaningful actions.

---

# PART 5 — CAT CATALOG AND ASSET SYSTEM

## 5.1 Data-driven cat definitions

Build a central cat definition catalog.

Do not hardcode individual cat behavior into separate scripts.

Each definition should include:

- Definition ID.
    
- Name.
    
- Description.
    
- Rarity.
    
- Visual asset reference.
    
- Base production attributes.
    
- Base combat attributes.
    
- Role.
    
- Abilities.
    
- Merge stage.
    
- Evolution branch.
    
- Unlock requirements.
    
- Tags.
    
- Optional animations and effects.
    

Use stable identifiers such as CAT-001.

The identifier must not change simply because a display name or model changes.

## 5.2 Individual cat instances

Each owned cat should have a unique instance ID.

An instance may contain:

- Instance ID.
    
- Definition ID.
    
- Level.
    
- Experience.
    
- Evolution stage.
    
- Upgrade values.
    
- Cosmetic configuration.
    
- Assignment state.
    
- Acquisition metadata, if needed.
    

Do not store every definition field repeatedly in every owned cat instance.

Use references to the central catalog and store only individual state.

## 5.3 Initial cat roster

Create approximately ten initial cats.

Suggested roster:

1. Orange Tabby — balanced starter.
    
2. Gray Shorthair — general production.
    
3. Calico — luck-oriented specialization.
    
4. Siamese — speed specialist.
    
5. Black Cat — utility and trick effects.
    
6. Maine Coon — defensive combat role.
    
7. Bengal — offensive combat role.
    
8. Ragdoll — support role.
    
9. Robo-Kitten — mechanical specialist.
    
10. Cosmic Sphinx — rare advanced specialist.
    

These are initial design concepts. Configure rarity, stats, and unlock rules separately.

Do not create every cat before the collection, merging, and combat systems are functional.

## 5.4 Rarity

Use configurable tiers:

- Common.
    
- Uncommon.
    
- Rare.
    
- Epic.
    
- Legendary.
    
- Mythic.
    

Rarity may affect starting attributes, appearance, ability complexity, and unlock requirements.

Rarity should not automatically determine battle outcomes.

Common cats should retain situational value through useful abilities, counters, or team synergy.

## 5.5 Asset registry requirements

Every significant asset should have a registry entry.

Record:

- Stable asset ID.
    
- Display name.
    
- Asset category.
    
- Actual location.
    
- Intended uses.
    
- Dependencies.
    
- Required components.
    
- Status.
    
- Validation checklist.
    
- Last verification.
    
- Known limitations.
    

For Roblox objects, distinguish between:

- An internal project path.
    
- A Roblox asset ID.
    
- A source filename.
    
- A model name.
    
- A runtime instance.
    

These are not interchangeable.

If an asset path changes, update the registry and dependent references.

## 5.6 Cat model standard

Establish a reusable standard for cat models.

Verify that each model:

- Has the required model structure.
    
- Has an appropriate root or primary part where needed.
    
- Has suitable collision settings.
    
- Supports the chosen animation approach.
    
- Can be displayed in the sanctuary.
    
- Can be previewed in UI.
    
- Can be presented in combat.
    
- Replicates appropriately.
    
- Does not contain unnecessary scripts or physics behavior.
    

Prefer shared controllers and data-driven behavior.

Do not create a separate custom movement system for each cat unless a specific design requirement justifies it.

---

# PART 6 — CAT COLLECTION AND MERGING

## 6.1 Collection interface

The collection screen should display:

- Cat model or icon.
    
- Name.
    
- Rarity.
    
- Level.
    
- Role.
    
- Relevant stats.
    
- Assignment status.
    
- Evolution stage.
    
- Upgrade availability.
    

Include useful sorting and filtering.

Potential filters:

- Rarity.
    
- Role.
    
- Production specialization.
    
- Evolution stage.
    
- Level.
    
- Assigned or unassigned.
    
- Eligible for merging.
    

Prevent invalid actions and provide clear feedback.

## 6.2 Purchasing cats

The player selects a purchasable cat or kitten.

The server must:

1. Validate the request.
    
2. Verify the player is allowed to purchase it.
    
3. Determine the price from server-side configuration.
    
4. Check the player's available currency.
    
5. Check inventory limits.
    
6. Deduct the cost.
    
7. Create the cat instance.
    
8. Update the inventory.
    
9. Save the relevant state.
    
10. Return the result to the client.
    

The client must never choose the final price or create a valuable cat instance directly.

## 6.3 Merging rules

Initial rule:

Two identical eligible cats at the same merge stage combine into one cat at the next stage.

Document how level, experience, upgrades, cosmetics, and assignments behave during merging.

Recommended initial behavior:

- Both input instances must be eligible.
    
- Assigned cats must be removed from their workstations before merging.
    
- Input instances are consumed.
    
- The result receives a new unique instance ID.
    
- The result definition is derived from server-side merge rules.
    
- Any retained experience or upgrades follow explicit documented rules.
    

Do not silently discard meaningful progression.

## 6.4 Merge interface

Provide:

- Selected cat.
    
- Eligible matching cats.
    
- Required cost.
    
- Expected output.
    
- Confirmation action.
    
- Result animation.
    
- Updated inventory.
    

The server must validate the operation again when the player confirms.

Protect against repeated requests and simultaneous merge attempts.

## 6.5 Atomicity

Treat merging as one logical transaction.

The system must not consume two input cats and then fail to create the result without a recovery strategy.

Use appropriate server-side transaction handling and data consistency safeguards.

---

# PART 7 — CURRENCIES AND ECONOMY

## 7.1 Currency definitions

### Fish Coins

The main progression currency.

Uses:

- Buying basic cats.
    
- Room upgrades.
    
- Sanctuary expansion.
    
- Standard automation.
    
- Other clearly defined basic purchases.
    

### Milk Bottles

Training currency.

Uses:

- Cat leveling.
    
- Individual stat upgrades.
    
- Selected training features.
    

### Gems

Rare currency.

Uses:

- Cosmetics.
    
- Special visual effects.
    
- Optional convenience features.
    
- Selected nonessential unlocks.
    

Avoid making competitive strength depend primarily on spending Gems.

### Golden Cat Treats

Prestige currency.

Uses:

- Permanent economic bonuses.
    
- Additional progression options.
    
- Selected special unlocks.
    
- Cosmetic prestige rewards.
    

### Arena Tokens

Competitive currency.

Uses:

- Arena cosmetics.
    
- Competitive decorations.
    
- Special appearances.
    
- Other balanced competitive rewards.
    

## 7.2 Central economy service

All valuable currency changes must pass through a centralized server-side economy interface.

Required operations:

- Get balance.
    
- Award currency.
    
- Spend currency.
    
- Validate transaction.
    
- Record significant transaction.
    
- Handle failure.
    
- Reject invalid currency types.
    

Prevent negative balances, duplicate rewards, invalid numeric values, and unauthorized currency changes.

Use integer currency unless a clearly documented mechanic requires otherwise.

## 7.3 Configuration

Store costs, rewards, multipliers, and upgrade curves in configuration data.

Do not scatter arbitrary numbers throughout scripts.

Separate:

- Production tuning.
    
- Merge costs.
    
- Cat prices.
    
- Room upgrade costs.
    
- Combat values.
    
- Expedition rewards.
    
- Prestige rewards.
    

This allows balance changes without rewriting unrelated logic.

## 7.4 Economy balance

Early progression should be quick enough to teach the systems.

Later progression should become more substantial without relying on excessive waiting.

Track:

- Resource income.
    
- Resource spending.
    
- Upgrade frequency.
    
- Time to next meaningful unlock.
    
- Passive versus active income.
    
- Progression differences between new and experienced players.
    

Do not finalize the economy without playtesting.

---

# PART 8 — SANCTUARY AND TYCOON BUILDING

## 8.1 Sanctuary ownership

Each player should have a personal sanctuary or designated tycoon plot.

The initial recommended layout is separate player plots in a shared Roblox server.

Each plot should have:

- Ownership.
    
- Starting layout.
    
- Upgradeable rooms.
    
- Production stations.
    
- Decoration areas.
    
- Expansion points.
    
- Cat display areas.
    

The server must validate all placement and interaction requests.

Players must not be able to modify another player's property.

## 8.2 Initial rooms

Implement three functioning rooms first:

1. Catnip Lab.
    
2. Scratching Post Gym.
    
3. Cardboard Box Factory.
    

Later additions may include:

- Fish Kitchen.
    
- Nap Lounge.
    
- Training Arena.
    
- Aquarium.
    
- Rooftop Lounge.
    
- Evolution Laboratory.
    
- Expedition Workshop.
    

## 8.3 Room mechanics

Each room should define:

- Room ID.
    
- Room level.
    
- Base production.
    
- Production type.
    
- Capacity.
    
- Accepted cat assignments.
    
- Upgrade costs.
    
- Eligible bonuses.
    
- Automation unlocks.
    
- Visual upgrade states.
    

The server calculates production using the room definition and valid assigned cats.

## 8.4 Visible progression

Upgrades should change the physical sanctuary where practical.

Examples:

- Improved workstations.
    
- Additional floor space.
    
- Better furniture.
    
- Additional production equipment.
    
- New lighting and effects.
    
- New cat activity areas.
    

Use modular building assets.

Avoid spawning excessive physical parts for every minor upgrade.

## 8.5 Cat assignments

The player should be able to assign cats to eligible rooms and remove them again.

Validate:

- Ownership.
    
- Cat availability.
    
- Room ownership.
    
- Room capacity.
    
- Cat specialization.
    
- Duplicate assignments.
    

A cat must not simultaneously occupy conflicting assignments unless the design explicitly permits it.

## 8.6 Decorations

Allow players to customize the sanctuary using earned decorations.

Possible items:

- Cat beds.
    
- Climbing walls.
    
- Plants.
    
- Aquariums.
    
- Windows.
    
- Cardboard forts.
    
- Neon signs.
    
- Golden furniture.
    
- Seasonal decorations.
    

Keep decorative placement separate from production logic.

Cosmetics should not unintentionally change economic or competitive balance.

---

# PART 9 — PRODUCTION AND OFFLINE PROGRESSION

## 9.1 Production model

Use a centralized production calculation.

A general formula is:

Final production rate =  
Base room rate  
× room level multiplier  
× eligible cat bonus  
× valid automation bonus.

Do not apply the same bonus multiple times through overlapping systems.

Document stacking rules.

## 9.2 Efficient calculation

Avoid a separate per-frame loop for every cat.

Use event-driven updates and controlled periodic calculations.

Calculate accrued resources from elapsed time when appropriate.

Do not simulate every second of offline production individually.

## 9.3 Offline rewards

When a player returns:

1. Load their saved data.
    
2. Validate the last relevant timestamp.
    
3. Calculate elapsed time using an appropriate server-controlled time source.
    
4. Apply the configured maximum offline duration.
    
5. Calculate eligible production.
    
6. Award resources.
    
7. Save the updated state.
    
8. Show an offline reward summary.
    

Never trust a client-supplied elapsed time.

Protect against negative or invalid time differences and duplicate offline reward claims.

## 9.4 Offline cap

Begin with a configurable cap of several hours.

The exact duration should be decided through playtesting.

Display:

- Time away.
    
- Resources earned.
    
- Bonus sources.
    
- Whether the cap was reached.
    

Offline rewards should help players progress without making active play irrelevant.

---

# PART 10 — UPGRADES, AUTOMATION, AND EVOLUTION

## 10.1 Individual cat upgrades

Potential attributes:

- Production speed.
    
- Combat health.
    
- Attack.
    
- Defense.
    
- Critical chance.
    
- Ability effectiveness.
    
- Expedition performance.
    

Use role-appropriate attributes.

Avoid adding so many stats that players cannot understand what upgrades do.

## 10.2 Empire automation

Potential upgrades:

- Automatic collection.
    
- Automated feeders.
    
- Improved workstations.
    
- Batch assignment.
    
- Faster processing.
    
- Additional production capacity.
    
- Better offline efficiency.
    

Automation must not bypass security checks or valid costs.

## 10.3 Evolution branches

Potential branches:

- Domestic.
    
- Elemental.
    
- Mechanical.
    
- Cosmic.
    
- Mythical.
    

Examples:

- Orange Tabby → Ember Tabby.
    
- Gray Shorthair → Steelclaw.
    
- Robo-Kitten → Quantum Robo-Cat.
    
- Cosmic Sphinx → Astral Sphinx.
    

Evolution may require:

- Cat level.
    
- Specific materials.
    
- Currency.
    
- A research unlock.
    
- A progression milestone.
    

Evolution should create a visible transformation and may grant a unique passive ability.

Start with one complete branch before implementing numerous branches.

## 10.4 Evolution data

Document:

- Input cat requirements.
    
- Required materials.
    
- Costs.
    
- Output definition.
    
- Stat changes.
    
- Ability changes.
    
- Visual asset references.
    
- Whether previous progression is retained.
    

All requirements and outputs must be validated on the server.

---

# PART 11 — EXPEDITIONS AND ACTIVE GAMEPLAY

## 11.1 Expeditions

Players send eligible cats on timed missions.

Initial destinations:

- Backyard Jungle.
    
- Attic Dungeon.
    
- Abandoned Aquarium.
    
- Moonlit Rooftops.
    

Each expedition defines:

- Duration.
    
- Required cat count.
    
- Recommended power.
    
- Eligible specializations.
    
- Reward table.
    
- Unlock requirements.
    
- Completion conditions.
    

Rewards may include:

- Fish Coins.
    
- Milk Bottles.
    
- Gems.
    
- Evolution materials.
    
- Blueprints.
    
- Cosmetics.
    

## 11.2 Expedition persistence

Persist active expedition state.

The server should validate:

- Expedition ID.
    
- Start time.
    
- Completion time.
    
- Assigned cats.
    
- Reward claim status.
    

Do not allow duplicate completion claims.

The player should be able to reconnect and retrieve a completed expedition's eligible reward.

## 11.3 Mini-games

Begin with one optional mini-game.

Suggested options:

- Laser-pointer reaction game.
    
- Rhythm-based petting game.
    
- Timed resource collection.
    

Rewards may include temporary production boosts or small quantities of eligible resources.

Keep controls suitable for touchscreens and keyboards.

Do not make the mini-game necessary for ordinary progression.

---

# PART 12 — COMPETITIVE CAT BATTLES

## 12.1 Competitive vision

Cat battles are a major feature of Cat Empire.

Players must be able to assemble a team of cats and compete against other players.

The battle system should reward:

- Team composition.
    
- Ability synergy.
    
- Tactical choices.
    
- Target selection.
    
- Counterplay.
    
- Understanding of opposing strategies.
    

The system must not simply compare the sum of cat levels and declare the stronger team the winner.

## 12.2 Initial team size

Start with five cats per team.

Potential roles:

- Tank.
    
- Striker.
    
- Support.
    
- Trickster.
    
- Specialist.
    

Allow alternative team compositions.

Each role should have useful strengths and weaknesses.

## 12.3 Battle simulation

Initially implement a server-controlled battle simulation.

The server determines:

- Valid teams.
    
- Initial state.
    
- Combat attributes.
    
- Target selection.
    
- Attacks.
    
- Abilities.
    
- Cooldowns.
    
- Status effects.
    
- Victory conditions.
    
- Rewards.
    
- Rating changes.
    

The client displays the battle and sends only permitted commands.

Do not accept client-reported damage, health values, victories, or reward amounts.

## 12.4 Battle length

Target approximately 60–120 seconds for the initial battle presentation, subject to playtesting.

The battle can use automated actions with selected ability commands.

Document whether abilities are:

- Automatic.
    
- Player-activated.
    
- Cooldown-based.
    
- Limited-use.
    
- Conditional.
    

Do not mix incompatible rules between different battle modes without documenting the distinction.

## 12.5 Initial abilities

Examples:

- Shield Wall.
    
- Powerful Pounce.
    
- Healing Purr.
    
- Slowing Scratch.
    
- Team Rally.
    
- Distraction.
    
- Critical Strike.
    

Each ability requires:

- A stable ID.
    
- A description.
    
- Valid targets.
    
- Effect magnitude.
    
- Duration.
    
- Cooldown.
    
- Resource or activation requirements, if applicable.
    
- Server validation.
    
- UI presentation.
    
- Test cases.
    

## 12.6 Battle interface

Include:

- Friendly team.
    
- Opposing team.
    
- Health indicators.
    
- Ability indicators.
    
- Cooldown indicators.
    
- Timer or turn indicator.
    
- Important battle events.
    
- Victory or defeat summary.
    
- Reward display.
    

Players should understand why the battle outcome occurred.

## 12.7 Fair competitive progression

Use a combination of:

- Rating-based matchmaking.
    
- Team eligibility checks.
    
- Stat limits or normalized ranked values.
    
- Counterplay.
    
- Role diversity.
    
- Seasonal balance review.
    

Prestige and economic upgrades should not provide unlimited competitive advantages.

## 12.8 Asynchronous PvP first

Implement asynchronous PvP before live real-time PvP.

A player selects a team and competes against a validated snapshot or server-controlled representation of another player's eligible team.

The opponent does not need to be online.

This allows competitive gameplay to work without requiring both players to be present simultaneously.

Keep battle outcomes server-authoritative.

## 12.9 Live PvP later

Plan live PvP as a later development phase.

Live PvP may include:

- Shared arena instances.
    
- Player ability commands.
    
- Server-controlled combat.
    
- Reconnection handling.
    
- Abandoned-match rules.
    
- Match cancellation.
    
- Queue timeouts.
    

Do not make live PvP a prerequisite for the first playable release.

---

# PART 13 — COMPETITIVE MODES

## 13.1 Ranked Arena

Players compete for rating and league progression.

Suggested leagues:

- Bronze.
    
- Silver.
    
- Gold.
    
- Platinum.
    
- Diamond.
    
- Master.
    
- Grandmaster.
    

Track:

- Current rating.
    
- Current league.
    
- Wins.
    
- Losses.
    
- Season history.
    
- Reward eligibility.
    

Use a documented rating system such as Elo or another appropriate model.

Do not allow the client to set rating values.

## 13.2 Cat Clash: Resource Race

Create a second competitive mode based on objectives rather than defeating the opposing team.

Possible objectives:

- Collect a target amount of resources.
    
- Complete production tasks.
    
- Capture checkpoints.
    
- Finish mini-games.
    
- Complete timed objectives.
    

This gives production-focused cats a role in competition.

## 13.3 Tournaments

Add tournaments after the ordinary arena is stable.

Possible events:

- Weekly tournaments.
    
- Limited-time rules.
    
- Common-cat-only competitions.
    
- Restricted rarity events.
    
- Multi-round brackets.
    
- Seasonal leaderboards.
    
- Cosmetic prizes.
    

Ensure reward claims are validated and cannot be repeated.

## 13.4 Social competition

Later additions may include:

- Friends-only battles.
    
- Guilds.
    
- Shared goals.
    
- Spectating.
    
- Sanctuary visits.
    
- Friendly challenges.
    
- Team-based events.
    

Do not implement all social systems before the core game is functional.

---

# PART 14 — PRESTIGE AND REBIRTH

## 14.1 Purpose

Prestige creates a long-term progression loop.

Players voluntarily reset eligible progression in exchange for Golden Cat Treats.

## 14.2 Reset preview

Before confirming prestige, display:

- Eligible rewards.
    
- Projected Golden Cat Treats.
    
- Resettable progression.
    
- Retained progression.
    
- Permanent bonuses.
    
- Any canceled activities.
    

Use an explicit confirmation step.

## 14.3 Permanent progression

Possible permanent benefits:

- Increased starting income.
    
- Faster kitten generation.
    
- Additional room capacity.
    
- New evolution branches.
    
- Better expedition efficiency.
    
- Special cosmetic effects.
    
- Sanctuary themes.
    

Keep prestige bonuses primarily economic or cosmetic.

## 14.4 Competitive fairness

Ranked PvP must not reward unlimited economic grinding with overwhelming combat power.

Use appropriate normalization or caps.

## 14.5 Prestige transaction

Implement prestige as a carefully validated server-side operation.

Validate:

- Eligibility.
    
- Current profile.
    
- Reward formula.
    
- Reset scope.
    
- Retained data.
    
- Duplicate requests.
    
- Save outcome.
    

The operation must not award prestige rewards twice if a request is repeated or a save operation is retried.

---

# PART 15 — ROBLOX TECHNICAL ARCHITECTURE

## 15.1 Architecture goals

Build a modular, maintainable Luau codebase.

Keep:

- Configuration.
    
- Data definitions.
    
- Server services.
    
- Client controllers.
    
- UI.
    
- Shared utilities.
    
- Tests.
    
- Documentation.
    

Separate game state from its presentation.

Avoid placing all game mechanics in one script.

## 15.2 Suggested logical layout

ReplicatedStorage/

- Shared/
    
    - Config/
        
    - CatDefinitions/
        
    - EconomyDefinitions/
        
    - CombatDefinitions/
        
    - Types/
        
    - Utility/
        
- Remotes/
    
- ClientModules/
    

ServerScriptService/

- Bootstrap.server.lua
    
- Services/
    
    - PlayerDataService.lua
        
    - CatInventoryService.lua
        
    - CatMergeService.lua
        
    - EconomyService.lua
        
    - ProductionService.lua
        
    - SanctuaryService.lua
        
    - UpgradeService.lua
        
    - EvolutionService.lua
        
    - PrestigeService.lua
        
    - ExpeditionService.lua
        
    - CombatService.lua
        
    - MatchmakingService.lua
        
    - LeaderboardService.lua
        
    - SecurityService.lua
        

ServerStorage/

- ServerOnlyAssets/
    
- Templates/
    
- PrivateDefinitions/
    

StarterPlayer/

- StarterPlayerScripts/
    
    - ClientBootstrap.client.lua
        
    - Controllers/
        

StarterGui/

- MainHUD/
    
- CatCollectionUI/
    
- MergeUI/
    
- SanctuaryUI/
    
- UpgradeUI/
    
- ExpeditionUI/
    
- BattleUI/
    
- PrestigeUI/
    
- SettingsUI/
    

Workspace/

- SanctuaryTemplates/
    
- BattleArenas/
    
- ExpeditionAreas/
    
- SpawnLocations/
    

This is a logical proposal, not an instruction to replace a working project structure blindly.

If the project uses Rojo, preserve the established source mapping and configuration.

If the project is Studio-native, establish an appropriate workflow for safely creating and updating objects.

## 15.3 Service responsibilities

PlayerDataService:

- Loading.
    
- Saving.
    
- Schema validation.
    
- Session coordination.
    
- Data migrations.
    

CatInventoryService:

- Owned cat instances.
    
- Inventory limits.
    
- Inventory operations.
    
- Assignment eligibility.
    

CatMergeService:

- Merge validation.
    
- Input consumption.
    
- Result creation.
    
- Merge transaction safety.
    

EconomyService:

- Currency balances.
    
- Transactions.
    
- Purchase validation.
    
- Reward handling.
    

ProductionService:

- Production calculations.
    
- Room rates.
    
- Offline rewards.
    

SanctuaryService:

- Plot ownership.
    
- Room placement.
    
- Expansion.
    
- Building state.
    

UpgradeService:

- Cat upgrades.
    
- Room upgrades.
    
- Automation upgrades.
    

EvolutionService:

- Evolution eligibility.
    
- Material consumption.
    
- Evolution results.
    

PrestigeService:

- Reset rules.
    
- Golden Cat Treat calculations.
    
- Permanent progression.
    

ExpeditionService:

- Expedition state.
    
- Timers.
    
- Completion and rewards.
    

CombatService:

- Team validation.
    
- Battle simulation.
    
- Combat results.
    

MatchmakingService:

- Opponent selection.
    
- Queue management.
    
- Match eligibility.
    

LeaderboardService:

- Validated ranking updates.
    
- Seasonal standings.
    
- Reward eligibility.
    

SecurityService:

- Shared validation utilities.
    
- Rate limiting.
    
- Suspicious request handling.
    
- Security event reporting.
    

Keep responsibilities narrow and document service interfaces.

## 15.4 Client architecture

Client controllers manage:

- User input.
    
- UI.
    
- Camera.
    
- Animations.
    
- Sounds.
    
- Visual effects.
    
- Battle presentation.
    
- Non-authoritative visual state.
    

The client may request actions but must not be the authority for valuable outcomes.

## 15.5 Remote communication

Document each RemoteEvent and RemoteFunction.

For each remote, record:

- Name.
    
- Purpose.
    
- Direction.
    
- Argument schema.
    
- Validation.
    
- Rate limit.
    
- Expected response.
    
- Failure behavior.
    
- Persistent side effects.
    

Validate every request.

Do not allow clients to invoke arbitrary server methods by name.

Avoid unnecessary remotes that duplicate existing functionality.

---

# PART 16 — DATA, SAVING, AND RECOVERY

## 16.1 Player data schema

Define a versioned schema containing the information required by the game.

Potential fields:

- Schema version.
    
- Currency balances.
    
- Cat inventory.
    
- Cat upgrades.
    
- Room levels.
    
- Room assignments.
    
- Sanctuary unlocks.
    
- Evolution progress.
    
- Expedition state.
    
- Prestige upgrades.
    
- Achievements.
    
- Settings.
    
- Competitive statistics.
    
- Season information.
    
- Relevant timestamps.
    

Keep the actual schema compact and compatible with Roblox persistence limits.

## 16.2 Loading

When a player joins:

1. Establish a loading state.
    
2. Load their profile.
    
3. Validate the data.
    
4. Migrate older schemas where needed.
    
5. Apply defaults only where appropriate.
    
6. Establish session ownership.
    
7. Calculate eligible offline rewards.
    
8. Initialize the sanctuary.
    
9. Initialize the UI.
    
10. Allow normal gameplay.
    

If a critical load fails, do not silently replace the player's saved profile with a new profile.

Use an explicit failure and recovery path.

## 16.3 Saving

Use Roblox-supported persistence practices.

Support:

- Periodic saving.
    
- Saving after important transactions.
    
- Player departure.
    
- Server shutdown.
    
- Retry handling.
    
- Request budget awareness.
    
- Concurrent session protection.
    
- Dirty-state tracking where useful.
    

Avoid saving the entire profile after every UI interaction.

## 16.4 Migrations

Whenever the data schema changes:

- Increment the schema version.
    
- Implement migration logic.
    
- Test representative old data.
    
- Preserve valid progress.
    
- Record the change in Obsidian.
    

Never assume an older profile contains every newly introduced field.

## 16.5 Data recovery

Document how to handle:

- Failed loads.
    
- Failed saves.
    
- Interrupted transactions.
    
- Invalid profiles.
    
- Concurrent sessions.
    
- Partial progression.
    
- Recovery of test profiles.
    

Do not manually modify live player data without explicit authorization and a verified recovery plan.

---

# PART 17 — SECURITY AND EXPLOIT PREVENTION

## 17.1 Security model

Assume that clients can submit malformed or repeated requests.

The server must validate every important action independently.

## 17.2 Protected operations

Protect:

- Cat purchases.
    
- Currency spending.
    
- Merging.
    
- Upgrades.
    
- Evolution.
    
- Room assignments.
    
- Prestige.
    
- Expedition completion.
    
- Combat.
    
- Competitive ratings.
    
- Leaderboard updates.
    
- Reward claims.
    

## 17.3 Required safeguards

Implement:

- Ownership checks.
    
- Price checks.
    
- Inventory validation.
    
- Server-derived rewards.
    
- Rate limits.
    
- Valid argument types.
    
- Numeric range checks.
    
- Duplicate request protection.
    
- Transaction consistency.
    
- Safe failure behavior.
    
- Appropriate logging.
    

Do not rely on UI visibility as a security boundary.

## 17.4 Remote abuse

Reject:

- Unknown identifiers.
    
- Invalid values.
    
- Excessive request rates.
    
- Unauthorized actions.
    
- Duplicate reward claims.
    
- Requests targeting another player's private data.
    

Avoid punitive automated behavior based on a single ambiguous signal.

Log enough context to diagnose suspicious activity without collecting unnecessary personal information.

---

# PART 18 — UI AND PRESENTATION

## 18.1 Visual direction

Use a colorful, friendly, polished cat-themed art style.

The sanctuary should feel like a growing living space rather than a static menu.

Cats should have readable silhouettes, expressive animations, and clear visual differences.

## 18.2 Main HUD

Display:

- Fish Coins.
    
- Milk Bottles.
    
- Gems.
    
- Relevant progression indicators.
    
- Navigation.
    
- Current goals.
    
- Notifications.
    

Avoid obscuring most of the game world.

## 18.3 Main menus

Provide access to:

- Sanctuary.
    
- Collection.
    
- Merge.
    
- Upgrades.
    
- Expeditions.
    
- Arena.
    
- Evolution.
    
- Prestige.
    
- Cosmetics.
    
- Settings.
    

Do not present unfinished features as fully functional.

Locked features should be clearly marked.

## 18.4 Feedback

Use:

- Purchase feedback.
    
- Resource animations.
    
- Merge effects.
    
- Upgrade animations.
    
- Battle feedback.
    
- Reward summaries.
    
- Loading indicators.
    
- Clear error messages.
    

Do not make effects so elaborate that they harm performance or conceal important information.

## 18.5 Device support

Design for:

- PC.
    
- Touchscreen devices.
    
- Controller navigation where supported.
    

Use readable text, appropriate hit targets, and responsive layouts.

Avoid relying entirely on hover interactions.

---

# PART 19 — TESTING AND QUALITY ASSURANCE

## 19.1 Testing policy

Every meaningful feature must have explicit acceptance criteria.

Run tests after implementing each system.

Do not postpone all testing until the game is complete.

## 19.2 Core tests

Test:

- Player joining.
    
- Starter cat creation.
    
- Cat purchases.
    
- Insufficient currency.
    
- Inventory limits.
    
- Valid merges.
    
- Invalid merges.
    
- Duplicate merge requests.
    
- Room assignments.
    
- Production calculations.
    
- Upgrades.
    
- Evolution.
    
- Prestige.
    
- Expeditions.
    
- Offline rewards.
    

## 19.3 Multiplayer tests

Use Roblox Studio's supported multi-client testing features when available.

Test:

- Multiple players joining.
    
- Independent inventories.
    
- Independent sanctuary ownership.
    
- Simultaneous purchases.
    
- Simultaneous merge requests.
    
- Battle matchmaking.
    
- Battle resolution.
    
- Disconnect behavior.
    
- Duplicate rewards.
    
- Rating changes.
    
- Rejoining after important actions.
    

## 19.4 Persistence tests

Test:

- First-time profiles.
    
- Returning profiles.
    
- Failed loads.
    
- Failed saves.
    
- Schema migration.
    
- Repeated joins and leaves.
    
- Session protection.
    
- Offline rewards.
    
- Interrupted transactions.
    

Use test profiles and an appropriate testing environment.

Never use real player data as an uncontrolled test fixture.

## 19.5 Test reporting

For each test run, record:

- Test ID.
    
- Feature.
    
- Environment.
    
- Preconditions.
    
- Steps.
    
- Expected result.
    
- Actual result.
    
- Pass or fail.
    
- Relevant logs.
    
- Follow-up issues.
    

If a test cannot be run, mark it BLOCKED or NOT RUN rather than PASS.

## 19.6 Studio access limitations

If Codex cannot directly execute Roblox Studio tests, do not pretend it did.

Instead:

- Run available static checks.
    
- Inspect relevant source code.
    
- Prepare a reproducible Studio test procedure.
    
- Record which manual or integration-based verification is still required.
    

Clearly distinguish source inspection from runtime verification.

---

# PART 20 — PERFORMANCE

Optimize for a multiplayer Roblox environment.

Avoid:

- Excessive per-frame server work.
    
- One production loop per cat.
    
- Unnecessary replicated updates.
    
- Excessive RemoteEvent traffic.
    
- Unbounded loops.
    
- Excessive physical parts.
    
- Repeated expensive searches through large inventories.
    
- Excessive simultaneous animations and particle effects.
    

Use:

- Centralized calculations.
    
- Event-driven updates.
    
- Efficient lookups.
    
- Controlled simulation ticks.
    
- Reusable assets.
    
- Appropriate streaming.
    
- Bounded collections.
    
- Profile-based testing.
    

Test with multiple players and representative inventories before release.

---

# PART 21 — DEVELOPMENT ROADMAP

Implement the project in these phases.

## PHASE 0: PROJECT DISCOVERY

Tasks:

1. Inspect the current project.
    
2. Identify the source and asset workflow.
    
3. Inspect existing scripts.
    
4. Identify existing features.
    
5. Inspect Codex instructions.
    
6. Verify Obsidian access.
    
7. Search existing project notes.
    
8. Build the project inventory.
    
9. Identify architecture risks.
    
10. Establish the roadmap and backlog.
    

Deliverables:

- Project inventory.
    
- Initial architecture note.
    
- Master specification.
    
- Obsidian Home note.
    
- Initial asset registry.
    
- Task backlog.
    
- Decision log.
    

Do not modify major systems until the existing project is understood.

## PHASE 1: PLAYABLE FOUNDATION

Build:

- Player spawning.
    
- Main HUD.
    
- Currency display.
    
- Cat catalog.
    
- Starter cat.
    
- Cat inventory.
    
- Cat purchasing.
    
- One production room.
    
- Basic resource generation.
    
- Basic persistence.
    

Acceptance criteria:

- Player can join.
    
- Starter cat is created correctly.
    
- Player can purchase an eligible cat.
    
- Production works.
    
- Currency changes are validated.
    
- Progress can be saved and loaded.
    

## PHASE 2: MERGING AND UPGRADES

Build:

- Merge UI.
    
- Merge rules.
    
- Server-side merge transactions.
    
- Cat levels.
    
- Room upgrades.
    
- Inventory filters.
    
- Basic achievements.
    

Acceptance criteria:

- Eligible cats merge correctly.
    
- Invalid requests are rejected.
    
- No duplicate cat consumption occurs.
    
- Costs and outputs are correct.
    
- Progress persists.
    

## PHASE 3: SANCTUARY EXPANSION

Build:

- Personal plot assignment.
    
- Additional rooms.
    
- Room upgrades.
    
- Cat assignments.
    
- Visual expansion.
    
- Basic automation.
    
- Offline production.
    

Acceptance criteria:

- Players own independent plots.
    
- Cats cannot be assigned illegally.
    
- Room upgrades affect production.
    
- Offline rewards are capped and validated.
    
- Multiple-player behavior is tested.
    

## PHASE 4: COMBAT PROTOTYPE

Build:

- Five-cat team selection.
    
- Combat definitions.
    
- Abilities.
    
- Server-controlled simulation.
    
- Battle UI.
    
- Results and rewards.
    

Use a simulated opponent first.

Acceptance criteria:

- Valid teams enter battle.
    
- Invalid teams are rejected.
    
- Combat resolves according to documented rules.
    
- Server determines the result.
    
- Rewards are granted once.
    
- Results can be reproduced for debugging.
    

## PHASE 5: ASYNCHRONOUS PVP

Build:

- Opponent selection.
    
- Team snapshots.
    
- Matchmaking.
    
- Rating.
    
- Arena rewards.
    
- Leaderboards.
    
- Battle history.
    

Acceptance criteria:

- Eligible teams can compete.
    
- Opponent information is validated.
    
- Rating changes are server-controlled.
    
- Duplicate results cannot grant duplicate rewards.
    
- Players can inspect their battle results.
    

## PHASE 6: EXPEDITIONS AND EVOLUTION

Build:

- Expedition destinations.
    
- Expedition teams.
    
- Timed state.
    
- Reward calculation.
    
- Evolution materials.
    
- Evolution recipes.
    
- Visual transformations.
    

Acceptance criteria:

- Expedition state persists.
    
- Rewards are granted correctly.
    
- Evolution requirements are validated.
    
- Cat instances remain consistent.
    

## PHASE 7: PRESTIGE

Build:

- Prestige preview.
    
- Reset rules.
    
- Golden Cat Treats.
    
- Permanent upgrades.
    
- Retained progression.
    
- Prestige feedback.
    

Acceptance criteria:

- Reset behavior is clear.
    
- Rewards are server-derived.
    
- Permanent progress is retained.
    
- Duplicate requests cannot exploit rewards.
    
- Ranked PvP remains reasonably balanced.
    

## PHASE 8: CONTENT AND POLISH

Build:

- More cat models.
    
- Additional rooms.
    
- More abilities.
    
- Cosmetics.
    
- Animations.
    
- Sound.
    
- Tutorial.
    
- Settings.
    
- Additional challenges.
    
- Optional competitive modes.
    

Acceptance criteria:

- New content uses established systems.
    
- Performance remains acceptable.
    
- Major user flows pass tests.
    
- Documentation matches the implementation.
    

## PHASE 9: RELEASE PREPARATION

Complete:

- Security review.
    
- Data integrity review.
    
- Multiplayer testing.
    
- Performance testing.
    
- UI review.
    
- Asset review.
    
- Error handling.
    
- Release checklist.
    
- Recovery planning.
    
- Roblox experience configuration.
    

Do not publish or make irreversible live changes without authorization.

---

# PART 22 — TASK MANAGEMENT

Every significant feature should be tracked in Obsidian.

Use a task record with:

- Task ID.
    
- Title.
    
- Status.
    
- Priority.
    
- Phase.
    
- Dependencies.
    
- Affected systems.
    
- Acceptance criteria.
    
- Test requirements.
    
- Related notes.
    

Suggested priorities:

P0: Prevents the game from functioning or threatens data integrity.

P1: Required for the current playable milestone.

P2: Important supporting functionality.

P3: Additional content or polish.

When choosing the next task:

1. Identify blockers.
    
2. Resolve data integrity or security issues.
    
3. Complete prerequisites.
    
4. Prioritize the current phase.
    
5. Select a small, verifiable deliverable.
    
6. Update dependencies after completion.
    

Do not create a huge number of tasks that have no clear acceptance criteria.

---

# PART 23 — ASSET AND SYSTEM DEPENDENCY MANAGEMENT

Maintain a dependency map.

Example:

Cat model  
→ Cat definition  
→ Collection UI  
→ Merge system  
→ Sanctuary display  
→ Battle presentation

Combat ability  
→ Ability definition  
→ Combat service  
→ Targeting rules  
→ UI indicator  
→ Battle animation  
→ Combat tests

Production room  
→ Room model  
→ Room definition  
→ Cat assignment  
→ Production service  
→ Upgrade system  
→ Offline reward calculation  
→ Persistence tests

When a component changes, inspect its dependents.

Before deleting or renaming an asset, search the registry and actual project for references.

Do not assume that an asset is unused because it is not visible in the current scene.

Document deprecation before removing obsolete systems.

---

# PART 24 — DEFINITION OF DONE

A feature is not complete simply because the script has been written.

A feature can be marked VERIFIED only when:

1. Its intended behavior is documented.
    
2. Its implementation exists.
    
3. Its dependencies are correct.
    
4. Its input validation is implemented.
    
5. Its relevant failure cases are handled.
    
6. Its acceptance tests pass.
    
7. Its persistence behavior is verified where applicable.
    
8. Its multiplayer behavior is verified where applicable.
    
9. Its UI communicates the correct state.
    
10. Its documentation is updated.
    
11. Known limitations are recorded.
    
12. No unresolved critical issue blocks its intended use.
    

If some criteria cannot be tested, retain the appropriate incomplete status.

---

# PART 25 — FIRST EXECUTION INSTRUCTIONS

Begin with discovery rather than immediate large-scale code generation.

Step 1: Inspect the Codex workspace and current project.

Step 2: Determine whether the Roblox project is empty, partially built, or substantially developed.

Step 3: Inspect the available Studio integration and source workflow.

Step 4: Verify access to the intended Obsidian vault.

Step 5: Search the vault for existing Cat Empire notes and related decisions.

Step 6: Build an inventory of scripts, assets, systems, and documentation.

Step 7: Compare the actual project against this specification.

Step 8: Identify missing features, conflicts, dependencies, and technical limitations.

Step 9: Establish or update AGENTS.md.

Step 10: Establish or update the Obsidian Home note, architecture, roadmap, and task backlog.

Step 11: Produce an implementation audit.

Step 12: Begin the earliest incomplete development phase.

Step 13: Implement one small, complete feature group.

Step 14: Test the changes using the tools actually available.

Step 15: Update the relevant Obsidian notes and report the result.

Do not create hundreds of scripts before understanding the project.

Do not recreate features that already exist and work.

Do not claim that a Studio integration or Obsidian connection works until it has been verified.

---

# PART 26 — REQUIRED INITIAL AUDIT REPORT

After completing discovery, produce a report containing:

## Project state

- Project root.
    
- Existing development workflow.
    
- Existing project structure.
    
- Current playable features.
    
- Current incomplete features.
    

## Roblox architecture

- Important scripts.
    
- Important models and assets.
    
- Existing data systems.
    
- Existing remotes.
    
- Existing UI.
    
- Known technical risks.
    

## Obsidian state

- Whether access was verified.
    
- Relevant notes discovered.
    
- Existing asset registry.
    
- Existing architecture documentation.
    
- Existing decisions and constraints.
    
- Missing documentation.
    

## Integration state

- What Codex can inspect.
    
- What Codex can edit.
    
- Whether Studio can be controlled.
    
- Whether tests can be executed.
    
- Which operations require manual intervention.
    

## Recommended next steps

- Critical blockers.
    
- Highest-priority tasks.
    
- Dependencies.
    
- First implementation target.
    
- Required verification.
    

Separate verified facts from assumptions.

---

# PART 27 — FINAL SUCCESS CRITERIA

The long-term game should let players:

1. Join a Roblox server.
    
2. Receive a starter kitten.
    
3. Collect and purchase cats.
    
4. Merge eligible cats.
    
5. Assign cats to production rooms.
    
6. Earn and spend resources.
    
7. Upgrade their sanctuary.
    
8. Automate production.
    
9. Train and evolve cats.
    
10. Complete expeditions.
    
11. Assemble competitive teams.
    
12. Compete against other players.
    
13. Earn rewards.
    
14. Climb seasonal rankings.
    
15. Prestige for permanent bonuses.
    
16. Customize their sanctuary.
    
17. Retain valid saved progress.
    
18. Return to a game that continues to be expanded without rewriting its foundation.
    

The development system must also let Codex:

1. Search the project's existing knowledge.
    
2. Identify the correct assets and scripts.
    
3. Understand dependencies.
    
4. Implement features consistently.
    
5. Test changes.
    
6. Identify regressions.
    
7. Update documentation.
    
8. Track unfinished work.
    
9. Preserve historical decisions.
    
10. Continue development across sessions.
    

FINAL PRINCIPLE:

Roblox Studio is where the game is implemented. Obsidian is where the project's organized knowledge lives. Codex is the agent that uses both to develop the game.

Keep the implementation, documentation, and approved design aligned. Build the smallest reliable version first, verify it, and expand the game systematically.