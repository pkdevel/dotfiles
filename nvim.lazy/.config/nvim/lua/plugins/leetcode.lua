return {
  "kawre/leetcode.nvim",
  cmd = "Leet",
  event = "BufEnter leetcode*",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- required by telescope
    "MunifTanjim/nui.nvim",
  },
  opts = {
    lang = "java",
    storage = {
      home = vim.fn.stdpath("data") .. "/leetcode",
      cache = vim.fn.stdpath("cache") .. "/leetcode",
    },
    --- TODO: install image support
    image_support = false,
  },
}
