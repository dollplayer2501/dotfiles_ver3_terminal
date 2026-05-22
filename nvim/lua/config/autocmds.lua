-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

--
-- Applying after colorscheme load prevents reversion to defaults.
--
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "TodoBgTODO",   { fg = "#1e1e2e", bg = "#89b4fa", bold = true })
    vim.api.nvim_set_hl(0, "TodoFgTODO",   { fg = "#89b4fa" })
    vim.api.nvim_set_hl(0, "TodoSignTODO", { fg = "#89b4fa" })

    vim.api.nvim_set_hl(0, "TodoBgFIX",   { fg = "#1e1e2e", bg = "#f38ba8", bold = true })
    vim.api.nvim_set_hl(0, "TodoFgFIX",   { fg = "#f38ba8" })
    vim.api.nvim_set_hl(0, "TodoSignFIX", { fg = "#f38ba8" })

    vim.api.nvim_set_hl(0, "TodoBgNOTE",   { fg = "#1e1e2e", bg = "#a6e3a1", bold = true })
    vim.api.nvim_set_hl(0, "TodoFgNOTE",   { fg = "#a6e3a1" })
    vim.api.nvim_set_hl(0, "TodoSignNOTE", { fg = "#a6e3a1" })

    vim.api.nvim_set_hl(0, "TodoBgHACK",   { fg = "#1e1e2e", bg = "#fab387", bold = true })
    vim.api.nvim_set_hl(0, "TodoFgHACK",   { fg = "#fab387" })
    vim.api.nvim_set_hl(0, "TodoSignHACK", { fg = "#fab387" })

    vim.api.nvim_set_hl(0, "TodoBgWARN",   { fg = "#1e1e2e", bg = "#f9e2af", bold = true })
    vim.api.nvim_set_hl(0, "TodoFgWARN",   { fg = "#f9e2af" })
    vim.api.nvim_set_hl(0, "TodoSignWARN", { fg = "#f9e2af" })
  end,
})

--

vim.api.nvim_create_autocmd("FileType", {
  pattern = "fish",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})
