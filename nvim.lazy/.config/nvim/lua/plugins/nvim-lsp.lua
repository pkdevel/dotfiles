return {
  {
    "neovim/nvim-lspconfig",
    optional = true,
    ---@class PluginLspOpts
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        html = {
          filetypes = { "html", "templ" },
        },
        htmx = {
          filetypes = { "html", "templ" },
        },
        templ = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "html",
        "templ",
      })
    end,
  },
}
