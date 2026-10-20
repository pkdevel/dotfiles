return {
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
  -- {
  --   "olimorris/codecompanion.nvim",
  --   optional = true,
  --   keys = {
  --     { "<leader>aa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
  --     { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "CodeCompanion Chat" },
  --   },
  --   opts = {
  --     interactions = {
  --       chat = {
  --         adapter = {
  --           name = "ollama_chat",
  --           model = "qwen3.5",
  --         },
  --       },
  --       inline = {
  --         adapter = {
  --           name = "ollama_comp",
  --           model = "qwen3-coder",
  --         },
  --       },
  --     },
  --     adapters = {
  --       http = {
  --         ollama_chat = function()
  --           return require("codecompanion.adapters").extend("ollama", {
  --             env = {
  --               url = "http://localhost:11434",
  --             },
  --             headers = {
  --               ["Content-Type"] = "application/json",
  --             },
  --           })
  --         end,
  --         ollama_comp = function()
  --           return require("codecompanion.adapters").extend("ollama", {
  --             env = {
  --               url = "http://localhost:11435",
  --             },
  --             headers = {
  --               ["Content-Type"] = "application/json",
  --             },
  --           })
  --         end,
  --       },
  --     },
  --   },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  -- },
}
