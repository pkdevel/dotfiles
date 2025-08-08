return {
  {
    "supermaven-inc/supermaven-nvim",
    optional = true,
    opts = {
      disable_inline_completion = false,
    },
  },

  {
    "zbirenbaum/copilot.lua",
    optional = true,
    opts = {
      suggestion = {
        enabled = true,
        -- hide_during_completion = vim.g.ai_cmp,
        keymap = {
          accept = false, -- handled by nvim-cmp / blink.cmp
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
    },
  },
}
