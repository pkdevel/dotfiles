return {
  {
    "nvim-cmp",
    dependencies = {
      "supermaven-inc/supermaven-nvim",
    },
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "supermaven",
        group_index = 1,
        priority = 100,
      })
    end,
  },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        color = {
          suggestion_color = "#cfc9c2",
          cterm = 244,
        },
      })
    end,
  },
}
