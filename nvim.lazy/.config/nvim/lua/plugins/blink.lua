return {
  "saghen/blink.cmp",
  optional = true,
  opts = {
    completion = {
      -- Don't select by default, auto insert on selection
      list = { selection = { preselect = false, auto_insert = true } },
    },
    keymap = {
      ["<C-space>"] = { "show", "hide" },
    },
  },
}
