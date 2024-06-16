-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = nil,
      automatic_installation = true,
    },
  },
}
