-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  lazy = true,
  opts = function(_, config)
    local null_ls = require "null-ls"
    config.sources = {
      null_ls.builtins.formatting.swift_format,
      null_ls.builtins.formatting.shfmt.with {
        filetypes = { "zsh" },
      },
    }
    return config
  end,
}
