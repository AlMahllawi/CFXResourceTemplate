# CFX Resource Template

> [!NOTE]
> This is a **template resource**. It does nothing useful in-game. It exists to show how to set up a CFX resource for [cfx-lua-definitions](https://github.com/AlMahllawi/cfx-lua-definitions) and [cfx-luals-addon](https://github.com/AlMahllawi/cfx-luals-addon), so you can copy its layout and config into your own resources.

## What it shows

| File | Purpose |
|---|---|
| [fxmanifest.lua](fxmanifest.lua) | Every common manifest field, plus the custom `generate_definition(s)` and `copy_definitions` properties the generator reads. |
| [imports/](imports/), [shared/definitions/](shared/definitions/), [server/classes/](server/classes/) | Annotated Lua (`---@class`, `---@enum`, `---@alias`) that is turned into `.d.lua` definitions, along with the fields and functions of each class. |
| [shared/definitions/utils.lua](shared/definitions/utils.lua) | A global namespace (`Utils`, `Utils.Table`) whose members are generated, and what is left out (assignments inside functions). |
| [server/03-imports.lua](server/03-imports.lua) | Loading the modules in `imports/` and typing them with `--[[@as JobSystem]]`, which gets its members from the generated definitions. |
| [stateBags.d.lua](stateBags.d.lua), [libs/thirdparty/external.d.lua](libs/thirdparty/external.d.lua) | Hand-written definitions that are copied as-is (state bags, third-party stubs). |
| [server/02-exports.lua](server/02-exports.lua) | Defining exports: the patterns the generator can and can't resolve. |
| [shared/02-exports.lua](shared/02-exports.lua) | Calling exports, including this resource's own generated ones. |
| [client/00-events.lua](client/00-events.lua), [server/00-events.lua](server/00-events.lua), [shared/01-events.lua](shared/01-events.lua) | A client → server → client event round trip (including latent events), plus local handlers. |
| [client/](client/), [server/](server/), [shared/](shared/) | Usage of CFX natives, events, NUI, state bags, vectors and promises, type-checked against the CfxLua addon. |
| [shared/05-syntax.lua](shared/05-syntax.lua) | CfxLua syntax extensions: backtick hashes, compound assignment, safe navigation and C-style comments. |
| [lua-definitions.json](lua-definitions.json) | Syncs third-party definitions (here, `oxmysql` from `overextended/ox_types`) into `definitions_vendor/`. |
| [.luarc.json](.luarc.json) | Lua Language Server config: CFX syntax, the CfxLua addon, and the synced definitions. |
| [.github/workflows/generate-definitions.yml](.github/workflows/generate-definitions.yml) | Regenerates `definitions/` on every push using the reusable workflow. |

See the [cfx-lua-definitions README](https://github.com/AlMahllawi/cfx-lua-definitions#readme) for what each manifest property and config field does.

## Setup

### 1. Install the tools

- The [Lua](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) extension for VS Code (Lua Language Server).
- The CFX Lua Definitions extension: download the `.vsix` from the [latest release](https://github.com/AlMahllawi/cfx-lua-definitions/releases/latest) and install it with **Extensions: Install from VSIX...** in the Command Palette. Or use the CLI described in its [README](https://github.com/AlMahllawi/cfx-lua-definitions#readme).

### 2. Set up `CFX_LUALS_ADDON`

[.luarc.json](.luarc.json) loads the CFX natives and runtime (`Citizen`, `exports`, `GlobalState`, `vector3`, etc.) from [cfx-luals-addon](https://github.com/AlMahllawi/cfx-luals-addon). It finds the addon through the `CFX_LUALS_ADDON` environment variable:

```json
"runtime": { "plugin": "${env:CFX_LUALS_ADDON}/plugin.lua" },
"workspace": { "library": ["${env:CFX_LUALS_ADDON}/library", "definitions_vendor"] }
```

Without it, Lua Language Server can't resolve any CFX globals and every native is flagged as undefined.

**Clone the addon** somewhere permanent:

```bash
git clone https://github.com/AlMahllawi/cfx-luals-addon.git ~/cfx-luals-addon
```

**Point `CFX_LUALS_ADDON` at the cloned folder** (the folder that contains `plugin.lua` and `library/`, with no trailing slash):

**Linux / macOS:** add this line to `~/.profile` (or `~/.zprofile` on macOS with zsh), then log out and back in:

```bash
export CFX_LUALS_ADDON="$HOME/cfx-luals-addon"
```

> [!TIP]
> Use `~/.profile` rather than `~/.bashrc`. VS Code started from the desktop or a dock doesn't read `~/.bashrc`, so the variable would only be set when you launch `code` from a terminal.

**Windows (PowerShell):**

```powershell
[Environment]::SetEnvironmentVariable("CFX_LUALS_ADDON", "$env:USERPROFILE\cfx-luals-addon", "User")
```

**Restart VS Code completely** (close every window) so it picks up the new variable. Then check it:

```bash
echo $CFX_LUALS_ADDON        # Linux / macOS
echo $env:CFX_LUALS_ADDON    # Windows PowerShell
```

To update the addon later, run `git pull` inside the cloned folder.

### 3. Sync third-party definitions

`definitions_vendor/` is gitignored, so pull it once after cloning. In VS Code, run **CFX: Sync Lua Definitions** from the Command Palette, or from this folder run:

**Linux / macOS (via curl):**
```bash
curl -sL https://raw.githubusercontent.com/AlMahllawi/cfx-lua-definitions/main/sync.sh | bash
```

**Windows (via PowerShell):**
```powershell
Invoke-Expression (Invoke-WebRequest -Uri "https://raw.githubusercontent.com/AlMahllawi/cfx-lua-definitions/main/sync.ps1" -UseBasicParsing).Content
```

### 4. Generate definitions

Save [fxmanifest.lua](fxmanifest.lua) (or run **CFX: Generate Lua Definitions**) to build `definitions/`. The GitHub workflow does the same on every push and commits the result, so other resources can sync this resource's definitions.

## Using it as a template

1. Copy `.luarc.json`, `lua-definitions.json`, `.gitignore` and `.github/workflows/generate-definitions.yml` into your resource.
2. In the workflow, set `resource-name` to your resource's name.
3. Add the `generate_definitions` / `copy_definitions` entries you need to your `fxmanifest.lua`.
4. Replace the sources in `lua-definitions.json` with the libraries your resource depends on.
