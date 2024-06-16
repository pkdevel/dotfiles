---@type LazySpec
return {
  "folke/tokyonight.nvim",
  priority = 1000,
  opts = {
    style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    light_style = "day", -- The theme is used when the background is set to light
  },
}
