---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    sessions = {
      autosave = {
        last = true, -- auto save last session
        cwd = true, -- auto save session for each working directory
      },
      ignore = {
        dirs = { "~/Downloads", "~/Documents", "~/Desktop" }, -- working directories to ignore sessions in
        filetypes = { "gitcommit", "gitrebase" }, -- filetypes to ignore sessions
        buftypes = {}, -- buffer types to ignore sessions
      },
    },
    autocmds = {
      alpha_autostart = false,
      restore_session = {
        {
          event = "VimEnter",
          desc = "Restore previous directory session if neovim opened with no arguments",
          nested = true, -- trigger other autocommands as buffers open
          callback = function()
            -- Only load the session if nvim was started with no args
            if vim.fn.argc(-1) == 0 then
              -- try to load a directory session using the current working directory
              require("resession").load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
            end
          end,
        },
      },
    },
    mappings = {
      n = {
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
