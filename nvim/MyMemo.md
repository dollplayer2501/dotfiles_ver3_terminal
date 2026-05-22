# Roles of Major Plugins

|Function|Role|
|---|---|
|LSP|Completion, Definition Jump, Diagnostics|
|Treesitter|Syntax Analysis|
|conform.nvim|Formatter|
|nvim-lint|Lint|
|blink.cmp / nvim-cmp|Completion UI|
|Mason|LSP/Formatter Installer|
|Telescope|Fuzzy Finder|


# Notes on Lua development with Conky

The following information is unconfirmed as it has not yet been tested.

In the future, when developing with Lua in Conky, the settings will be the same as those for LazyVim's Lua configuration.
Formatting settings are included via conform.nvim, and if StyLua is installed, it will run automatically when saving a .lua file.  
To avoid this, the following is required, disable it for files in a specific directory.

`.config/nvim/lua/autocmds.lua`

```lua
vim.api.setup("BufWritePre", {
  pattern = "/home/yourname/.config/conky/*",
  callback = function()
    vim.b.autoformat = false
  end,
})
```
