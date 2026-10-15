---
type: setup-guide
created: 2026-10-15
status: LOCAL IGNORE RULES READY - GITHUB NOT LINKED
---

# GitHub Vault Sync

## Current local state

- Git already exists at `D:\Roblox game project`, on branch `master`.
- This vault is `D:\Roblox game project\Obsidian\Cat Empire In CLI`, inside that repository. There is no independent `.git` inside the vault.
- No Git remote was configured when checked. No remote was created, no commit made and nothing pushed during setup.
- Git for Windows 2.50.1 and the `manager` credential helper are installed. A commit identity is already configured.
- Initial inspection found **120 untracked vault files** and **105 untracked files elsewhere**. The new `.gitignore` and this guide add two more untracked vault files. These counts are a setup snapshot, not a live status.
- Added a portable `.gitignore` at the vault root. It excludes desktop/mobile workspace layouts, caches, trash, plugin installations/local settings and temporary/OS files. Portable appearance/app/core-plugin settings remain eligible for sync.
- `workspace.json` was already tracked. `git rm --cached` removed it from the index; **the local file still exists**. This staged removal will take effect in history when committed. Ignore rules do not erase older history.
- Existing root ignore rules, gameplay source, assets and other pending changes were preserved.

## Choose the repository scope

**Existing repository:** the commands below link the game repository. Newly staged changes are limited to this vault, but Git pushes whole repository history, including already committed game source/assets. A private repository does not turn a push into a folder-only upload.

**Vault-only repository:** use a dedicated checkout with this vault as its repository root for simpler phone use. The user was asked which scope they prefer; no copy, move, nested repository, submodule or parent tracking conversion was performed. If a separate copy is chosen, it must become the actively edited vault or have an explicit reconciliation workflow; two copies do not automatically stay synchronized.

## Commands for the existing repository

Run in PowerShell. This preserves the existing `master` branch. Replace `YOUR_USER` and `YOUR_REPO` below with the empty private repository you create on GitHub. Do not include a token in its URL.

1. On GitHub create a **Private**, empty repository. Leave README, license and gitignore initialization unchecked.
2. Review/stage only this vault, inspect the index and commit:

```powershell
Set-Location -LiteralPath 'D:\Roblox game project'
git status --short
git diff --cached --name-only
git add -- 'Obsidian/Cat Empire In CLI'
git diff --cached --stat
git diff --cached --name-only
git commit -m "chore: prepare Obsidian vault for GitHub sync"
```

The index should contain only intended vault changes, including the staged workspace removal. If another tool stages game changes before you run this, separate those before making a notes commit. Do not use `git add .` or `git commit -a` at the game root for vault-only staging.

3. Link, verify and push:

```powershell
git remote add origin https://github.com/YOUR_USER/YOUR_REPO.git
git remote -v
git push -u origin master
```

The first HTTPS push should allow Git Credential Manager to authenticate through GitHub. No GitHub CLI installation is required. If `origin` has since been added, inspect it before changing anything; do not run `remote add` a second time blindly.

Draft commit message: `chore: prepare Obsidian vault for GitHub sync`. This is the first sync-setup commit, not the first commit in the existing project history.

## Desktop Obsidian Git settings

Install/enable **Git** by Vinzent03 in Settings → Community plugins. Do not run Initialize Repository for the existing game repository. Authenticate once through the terminal first.

Recommended settings:

| Setting | Value |
|---|---|
| Limit file operations to the vault, under Advanced | **ON** for this vault inside the game repo; update the plugin if your version lacks it |
| Auto commit-and-sync interval | **5 minutes** |
| Use separate commit and push intervals | **OFF**, so the normal interval includes synchronization |
| Auto commit-and-sync only staged files | **OFF** for automatic notes staging, after enabling the vault limit |
| Pull on startup | **ON** |
| Push on commit-and-sync | **ON** (older versions call the inverse setting Disable push; leave that **OFF**) |
| Pull on commit-and-sync | **ON** |
| Pull merge strategy | **Merge** for straightforward cross-device use |
| Automatic commit message | `notes: sync {{date}}` |

Run **Git: Commit-and-sync** manually once, verify the commit on GitHub, then rely on the interval. If there is a conflict, resolve it before continuing to edit the same note elsewhere.

**Boundary:** the vault limit restricts file-oriented operations such as status/staging. Push, pull, merge and branch operations still affect the entire repository, and already staged files outside the vault can enter its next commit. If the installed plugin lacks the vault-limit setting, leave automatic commits off for this shared game checkout until updated or isolated. Timers run while Obsidian can execute; they are not an always-on phone background service.

## Access from a phone

For immediate read access, the private GitHub repository can be viewed after signing in through the GitHub app or browser. That is repository browsing, not an Obsidian mobile vault.

For an editable Obsidian phone vault, prefer a vault-only repository. Install Obsidian and Git on the phone, create an empty local vault, set HTTPS identity/authentication, and use **Git: Clone existing remote repo** with `https://github.com/YOUR_USER/YOUR_REPO.git`. Authenticate with a fine-grained GitHub personal access token restricted to this repository; use the plugin's Identity/Secret Storage controls and the current permission requirements in its documentation. Never paste the token into a note or remote URL. Do not combine Git with another tool simultaneously syncing the same live vault files.

The upstream maintainer labels the mobile Git implementation unstable, with memory/clone/pull limitations and no SSH support. A full game repository increases the burden and does not have the vault at its root. Do not assume cloning the game repo into a phone vault automatically preserves the current vault-relative attachment paths. Choose a vault-only setup or verify the platform's nested-vault/repository support first. Start with a small manual pull/edit/commit-and-sync round-trip before enabling timers.

Phone platform-specific instructions can be finalized after choosing repository scope and Android versus iPhone. No paid app or subscription is required by the proposed GitHub/Obsidian/plugin route; successful mobile operation has not been tested on the user's phone.

## Verification performed

`git check-ignore -v` confirms the desktop/mobile workspace files, sample cache, plugin data and trash paths match the new rules. The real workspace file remains on disk; Git reports its staged removal rather than continued layout edits. No gameplay tests were needed for ignore/documentation changes. No plugin installation, GitHub login, real push or phone sync was performed.

## Official references checked

- [Plugin setup, vault inside a larger repository, and mobile limitations](https://github.com/Vinzent03/obsidian-git/blob/master/docs/Getting%20Started.md)
- [Plugin automatic commit-and-sync behavior](https://github.com/Vinzent03/obsidian-git/blob/master/docs/Features.md)
- [Current plugin settings and labels](https://github.com/Vinzent03/obsidian-git/blob/master/src/setting/settings.ts)
- [Plugin Windows authentication](https://github.com/Vinzent03/obsidian-git/blob/master/docs/Authentication.md)
- [Plugin ignore guidance](https://github.com/Vinzent03/obsidian-git/blob/master/docs/Tips-and-Tricks.md)
- [GitHub: adding locally hosted code](https://docs.github.com/en/migrations/importing-source-code/using-the-command-line-to-import-source-code/adding-locally-hosted-code-to-github)
