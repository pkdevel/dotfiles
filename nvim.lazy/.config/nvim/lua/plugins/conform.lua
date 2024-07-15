return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      templ = { "templ" },
    },
    formatters = {
      templ = {
        command = "templ",
        args = { "fmt" },
      },
    },
  },
}
