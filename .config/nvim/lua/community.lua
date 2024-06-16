-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.color.transparent-nvim" },
  { import = "astrocommunity.color.headlines-nvim" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.swift" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.json" },
}
