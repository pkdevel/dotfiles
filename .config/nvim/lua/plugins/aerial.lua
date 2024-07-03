---@type LazySpec
return {
  "stevearc/aerial.nvim",
  opts = function()
    local opts = {
      open_automatic = function(bufnr)
        -- Enforce a minimum line count
        return vim.api.nvim_buf_line_count(bufnr) > 80
      end,
      close_automatic_events = { "unsupported" },
    }
    return opts
  end,
}
