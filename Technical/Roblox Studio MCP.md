---
type: integration
status: VERIFIED
last_updated: 2026-10-12
---

# Roblox Studio MCP

Rojo is running on localhost:34872 and responds HTTP 200. RobloxStudioBeta is
running. These checks do not prove the Rojo plugin is connected to this place.

The official built-in Studio MCP executable was found in the installed Roblox
version, with its launcher at `C:\Users\59322\AppData\Local\Roblox\mcp.bat`.
No third-party Studio plugin or server was installed.

The `roblox_studio` stdio MCP entry was added through the Codex CLI to
`C:\Users\59322\.codex\config.toml`, preserving the existing node_repl configuration.
It launches `cmd.exe /c C:/Users/59322/AppData/Local/Roblox/mcp.bat`, with a
45-second startup timeout and 120-second tool timeout. TOML and CLI registration
checks pass. The existing chat may need its MCP connections refreshed; future
client sessions can load the saved entry.

Direct protocol checks initialized the official bridge as RobloxStudio 1.0.0.
However, `tools/list` returned an empty list, including after a bounded discovery
wait. No Studio hierarchy, script, screenshot, playtest or engine test was claimed.

## Studio-side action still required

In Studio, open **Assistant → ⋯ → Manage MCP Servers**, then turn on
**Enable Studio as MCP server**. A status question was presented to the user;
enablement has not been confirmed. If already enabled, inspect its connection
indicator and retry discovery before diagnosing another cause.

This menu path comes from [Roblox's official Studio MCP guide](https://create.roblox.com/docs/studio/mcp).
Client registration follows [OpenAI's MCP configuration guide](https://developers.openai.com/codex/mcp).

## Local diagnostic fallback

`tools/studio_mcp.py` is a small Python stdio client for the official installed
bridge. It has no third-party dependencies and does not enable the Studio switch,
edit the game, or publish merely by starting. Inspect discovered tool schemas first:

```powershell
python tools/studio_mcp.py --list
python tools/studio_mcp.py --call TOOL_NAME --args path-to-arguments.json
```

Use only tool names and argument schemas actually returned by discovery. Follow
Studio targeting/read-before-write requirements. Do not print image base64 payloads;
use a connected tool's native image output when available. The script's generic
JSON output is intended for diagnostics/text tools.

Once connected, first list/identify Studio instances, inspect edit/play state and
actual scripts, then test the local disposable Cat Empire place. Keep Studio's
memory-save default. No publishing, live-save tests, or play-session interruption
has happened during this setup. See [[Technical/Continuation Guide]] and
[[Technical/Optimization Pass 2026-10-12]] for pending engine acceptance.


## Connection verified — 2026-10-12

After the user enabled Studio as MCP server, tool discovery and list_roblox_studios succeeded for CatEmpire. execute_luau, actual console reads, native captures, local play/stop, device simulation, and input calls returned results. The earlier empty-tools/setup-pending sections are historical. See [[Testing/Studio Runtime Checks 2026-10-12]]. The direct helper saves native image results to ignored .tools/studio-captures rather than printing base64. Inspect fresh tool schemas and Studio IDs each session.
