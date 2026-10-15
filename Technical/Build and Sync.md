---
type: technical
status: TESTED
last_updated: 2026-10-12
---

# Build and Sync

`default.project.json` is the existing Rojo source mapping. Shared modules map to
`ReplicatedStorage.CatEmpireShared`, server code to `ServerScriptService.CatEmpireServer`,
and client code to `StarterPlayerScripts.CatEmpireClient`. The bootstrap scripts
own their Services/Controllers folders. `ReplicatedStorage.CatModels` is an empty
folder in the source mapping; Blender/FBX files need a separate Studio import workflow.

Rojo 7.7.1 was confirmed responding as CatEmpire on localhost:34872 on 2026-10-12.
Reuse a running server for this project. If absent, run from the workspace root:

```powershell
rojo serve default.project.json --port 34872
rojo build default.project.json --output CatEmpire-preview.rbxlx
rojo sourcemap default.project.json --output sourcemap.json
```

Connect the Studio Rojo plugin and review the sync diff. An HTTP response from
Rojo does not establish that Studio is connected. A play session should be stopped
and restarted for cached ModuleScripts and generated world state to reload.

Build/sourcemap generation passed on 2026-10-12. Rojo packages/maps instances;
it does not compile Luau or prove the game runs. `tools/validate_project.py` performs
syntax compilation and mock layout checks separately. Studio Script Analysis and
Play/Local Server checks remain required. Builds, sourcemaps, and validation tools
are ignored by Git. Nothing was published. See [[Technical/Continuation Guide]]
for executable paths and [[Testing/Visual Polish Checks]] for acceptance steps.


## Latest local server state — 2026-10-12

The previously recorded server was no longer accepting connections at the start of the optimization pass. A hidden local Rojo process was started with `--address 127.0.0.1 --port 34872`, serving this workspace's default.project.json. Logs are in ignored `.tools/rojo.stdout.log` / `.tools/rojo.stderr.log`; startup reports it is listening. Recheck HTTP status and Studio plugin attachment; neither starting the server nor a build proves a passing playtest.


## Official Studio MCP registration

The built-in Studio bridge has been registered locally in Codex as roblox_studio. Rojo responds, but Studio MCP currently exposes zero tools; enablement/connection is not verified. See [[Technical/Roblox Studio MCP]] for the pending Studio switch and diagnostic commands.
