return {
  -- Useful plugin to show you pending keybinds.
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    config = function()
      local wk = require("which-key")
      wk.setup()
      wk.add({
    { "<leader>O", group = "obsidian" },
    { "<leader>c", group = "code" },
    { "<leader>d", group = "debug" },
    { "<leader>g", group = "goto" },
    { "<leader>h", group = "harpoon" },
    { "<leader>p", group = "previous" },
    { "<leader>r", group = "rename" },
    { "<leader>s", group = "search" },
    { "<leader>t", group = "toggle" },
    { "<leader>w", group = "workspace" },
  }
)
    end,
    dependencies = { "neovim/nvim-lspconfig", "folke/trouble.nvim", "mfussenegger/nvim-dap" }
  },
  {
    "preservim/tagbar",
    keys = {
      { "<leader>tv", ":TagbarToggle<CR>", desc = "Toggle Tagbar View" },
    },

  }
}
