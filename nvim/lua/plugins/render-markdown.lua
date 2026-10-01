--
-- NOTE:
--  `:RenderMarkdown toggle`
--

return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = true,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-mini/mini.nvim",
  },
  ft = { "markdown" },
  opts = {},
}
