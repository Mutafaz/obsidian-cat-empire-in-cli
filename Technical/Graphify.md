# Graphify — local project graph

2026-10-12: user asked to use Graphify. Installed `graphifyy` 0.9.88 in the isolated project environment `.tools/graphify-env`. No hosted service, API key, source upload, global skill registration or AGENTS.md rewrite was used.

Upstream: https://github.com/Graphify-Labs/graphify and https://docs.graphify.com/quickstart. Code-only extraction runs locally. The assistant used `explain` on the TurnBattle node to inspect extracted functions/imports, then CombatService.

Run `./tools/graphify_project.ps1` from PowerShell. It extracts `src` with `--code-only --no-cluster --max-workers 1` and creates the graph/tree under `.tools/project-graph/graphify-out/`. Snapshot copies live in `Technical/Graphify/graph.json` and `Technical/Graphify/GRAPH_TREE.html`. The HTML tree uses the upstream browser visualization; CLI explanation works locally without opening it.

Query example:
```powershell
& '.tools/graphify-env/Scripts/python.exe' -m graphify explain shared_turnbattle --graph '.tools/project-graph/graphify-out/graph.json'
```

The bundled Lua parser only partially handles Luau types/syntax. The initial extraction warned about 35 partially parsed files; RealmLayout contains data and yielded no symbols. `WaitForChild` and `script.Parent` imports can remain unresolved graph nodes. Treat graph links as navigation evidence, never as proof of exhaustive dependencies or type correctness. Actual source inspection, Luau compilation, runtime tests and offline assertions remain required.

If this local environment is missing, use the bundled Python to create `.tools/graphify-env` and install `graphifyy` into that interpreter. The first `venv` command failed during ensurepip; installation succeeded using the bundled Python's `pip --python .tools/graphify-env/Scripts/python.exe install graphifyy`. No package installation is necessary inside Roblox.
