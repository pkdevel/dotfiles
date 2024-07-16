return {
  {
    "nvim-cmp",
    dependencies = {
      "supermaven-inc/supermaven-nvim",
    },
    opts = function(_, opts)
      table.insert(opts.sources, {
        name = "supermaven",
        group_index = 1,
        priority = 100,
      })
    end,
  },
  {
    "supermaven-inc/supermaven-nvim",
    lazy = false,
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<S-Tab>",
        },
        color = {
          suggestion_color = "#efc777",
          cterm = 117,
        },
      })
    end,
  },
}
