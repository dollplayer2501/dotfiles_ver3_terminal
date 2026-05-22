--
--
--

return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    -- NOTE: Prevent Fish shell scripts from automatically changing format when saving.
    opts.formatters_by_ft.fish = {}
  end,
}
