return {
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
}
