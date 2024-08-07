return {
  "f-person/auto-dark-mode.nvim",
  priority = 1000,
  opts = {
    update_interval = 1000,
    set_dark_mode = function() vim.api.nvim_set_option_value("background", "dark", {}) end,
    set_light_mode = function() vim.api.nvim_set_option_value("background", "light", {}) end,
  },
  enabled = function()
    if vim.fn.has "osx" then return true end
    return false
  end,
}
