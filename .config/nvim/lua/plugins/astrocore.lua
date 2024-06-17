-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["<Tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<S-Tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- Navigate tabs
        ["<C-Tab>"] = { function() vim.cmd.tabnext() end, desc = "Next tab" },
        ["<C-S-Tab>"] = { function() vim.cmd.tabprevious() end, desc = "Previous tab" },

        -- local rename
        ["gR"] = { "gd[{V%::s/<C-R>///gc<left><left><left>", desc = "Rename symbol in scope" },
      },
    },
  },
}
