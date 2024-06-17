---@type LazySpec
return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  priority = 1000,
  opts = {
    integrations = {
      nvimtree = false,
      notify = true,
      mason = true,
      telescope = {
        enabled = true,
        style = "",
      },
      which_key = true,
      aerial = true,
    },
  },
}
