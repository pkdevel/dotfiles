return {
  "nvim-lualine/lualine.nvim",
  optional = true,
  opts = function(_, opts)
    -- remove clock from lualine
    table.remove(opts.sections.lualine_z, 1)
  end,
}
