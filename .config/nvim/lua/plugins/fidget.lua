---@type LazySpec
return {
  "j-hui/fidget.nvim",
  event = "VeryLazy",
  config = function()
    local fidget = require "fidget"
    fidget.setup {
      notification = {
        -- Options related to how notifications are rendered as text
        view = {
          stack_upwards = true, -- Display notification items from bottom to top
          icon_separator = " ", -- Separator between group name and icon
          group_separator = "---", -- Separator between notification groups
          -- Highlight group used for group separator
          group_separator_hl = "Comment",
          -- How to render notification messages
          render_message = function(msg, cnt) return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg) end,
        },

        window = {
          normal_hl = "String", -- Base highlight group in the notification window
          winblend = 0, -- Background color opacity in the notification window
          border = "none", -- Border around the notification window
          zindex = 45, -- Stacking priority of the notification window
          max_width = 0, -- Maximum width of the notification window
          max_height = 0, -- Maximum height of the notification window
          x_padding = 1, -- Padding from right edge of window boundary
          y_padding = 1, -- Padding from bottom edge of window boundary
          align = "bottom", -- How to align the notification window
          relative = "editor", -- What the notification window position is relative to
        },
      },
      -- Options related to integrating with other plugins
      integration = {
        ["xcodebuild-nvim"] = {
          enable = true, -- Integrate with wojciech-kulik/xcodebuild.nvim (if installed)
        },
      },
    }
  end,
}
