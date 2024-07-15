return {
  "nvim-neo-tree/neo-tree.nvim",
  optional = true,
  opts = {
    window = {
      mappings = {
        ["<S-Tab>"] = "prev_source",
        ["<Tab>"] = "next_source",
      },
    },
    filesystem = {
      filtered_items = {
        visible = true, -- when true, they will just be displayed differently than normal items
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}
