# Cat Empire — Codex Development Rules

> **Note**: This file has been organized into [[Development Rules]]. Both files are retained for historical continuity.

## Before every substantial task

1. Read this file.
    
2. Read the Cat Empire master specification.
    
3. Inspect the current project state.
    
4. Search the Obsidian vault for relevant system notes, assets, dependencies, and decisions.
    
5. Inspect the actual scripts and assets involved.
    
6. Prepare a short implementation plan before making significant changes.
    

## Implementation rules

- Use Luau and established Roblox development conventions.
    
- Preserve existing working functionality.
    
- Reuse existing systems and assets when appropriate.
    
- Keep server-authoritative game state on the server.
    
- Keep cat definitions, economy configuration, and combat configuration data-driven.
    
- Validate all client requests that can affect game state.
    
- Do not add unnecessary dependencies.
    
- Do not create duplicate systems without first investigating existing implementations.
    
- Avoid unrelated refactors.
    
- Never claim that a feature works without appropriate verification.
    

## Obsidian rules

- Treat the Obsidian vault as the persistent project knowledge base.
    
- Verify vault access before claiming to have read or updated it.
    
- Search existing notes before creating new ones.
    
- Maintain asset records, system dependencies, decisions, bugs, and implementation status.
    
- Update documentation after meaningful changes.
    
- Distinguish planned, implemented, tested, and verified features.
    
- Preserve historical decisions and unrelated notes.
    
- Never silently overwrite important documentation.
    

## Testing rules

- Define acceptance criteria before implementation.
    
- Run available checks after modifying code.
    
- Test relevant success and failure cases.
    
- Test multiplayer and persistence behavior where applicable.
    
- Report tests that could not be run.
    
- Never label an untested feature as verified.
    

## Completion report

For each substantial task, report:

- What changed.
    
- Files and systems affected.
    
- Tests performed.
    
- Test results.
    
- Known limitations.
    
- Documentation updated.
    
- Remaining work.
    
- Recommended next task.
    

## Development priority

Build a reliable playable foundation first. Expand only after the current systems are implemented, tested, and documented.