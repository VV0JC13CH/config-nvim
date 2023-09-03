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
      wk.register({
        ["<leader>c"] = { name = "+code" },
        ["<leader>d"] = { name = "+debug" },
        ["<leader>g"] = { name = "+goto" },
        ["<leader>h"] = { name = "+harpoon" },
        ["<leader>r"] = { name = "+rename" },   -- temp
        ["<leader>p"] = { name = "+previous" }, -- temp
        ["<leader>s"] = { name = "+search" },
        ["<leader>t"] = { name = "+toggle" },
        ["<leader>w"] = { name = "+workspace" },
      })
    end,
    dependencies = { "neovim/nvim-lspconfig", "folke/trouble.nvim", "mfussenegger/nvim-dap" }
  }

}
