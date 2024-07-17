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
      home = vim.fn.expand("$HOME") .. "/dev/leetcode",
      cache = vim.fn.expand("$HOME") .. "/dev/leetcode/.cache",
    },
    --- TODO: install image support
    image_support = false,
  },
}
