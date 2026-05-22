--
--
--

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("bufferline").setup({})
    vim.keymap.set("n", "<C-PageUp>",   ":BufferLineCyclePrev<CR>", { silent = true })
    vim.keymap.set("n", "<C-PageDown>", ":BufferLineCycleNext<CR>", { silent = true })
    -- TODO: This does not work
    -- vim.keymap.set("n", "<C-F4>",       ":bd<CR>",                  { silent = true })
  end,
  opts = {
    options = {
      always_show_bufferline = true,
    },
  },
}
