-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "PREV Buffer" })
map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<C-q>", LazyVim.ui.bufremove, { desc = "Next Buffer" })

map({ "n", "i" }, "<M-z>", "<cmd>ZenMode<cr>", { desc = "Zen mode" })
