---@type LazySpec
return {
  "mfussenegger/nvim-dap",
  name = "nvim-dap-swift",
  dependencies = {
    "wojciech-kulik/xcodebuild.nvim",
  },
  ft = "swift",
  config = function()
    local xcodebuild = require "xcodebuild.integrations.dap"
    local codelldbPath = os.getenv "HOME" .. "/.local/share/codelldb"
    xcodebuild.setup(codelldbPath)

    vim.keymap.set("n", "<leader>dd", xcodebuild.build_and_debug, { desc = "Build & Debug" })
    vim.keymap.set("n", "<leader>dr", xcodebuild.debug_without_build, { desc = "Debug Without Building" })
    vim.keymap.set("n", "<leader>dt", xcodebuild.debug_tests, { desc = "Debug Tests" })
    vim.keymap.set("n", "<leader>dT", xcodebuild.debug_class_tests, { desc = "Debug Class Tests" })
    vim.keymap.set("n", "<leader>db", xcodebuild.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>dm", xcodebuild.toggle_message_breakpoint, { desc = "Toggle Message Breakpoint" })
    vim.keymap.set("n", "<leader>dx", xcodebuild.terminate_session, { desc = "Terminate Debugger" })
  end,
}
