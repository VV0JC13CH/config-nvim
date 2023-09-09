return {
  {
    'rust-lang/rust.vim',
    config = function()
      vim.o.syntax = 'Enable'
      vim.filetype.indend = true
    end,
    ft = { "rust", "toml" },
    dependecies = {
      {
        "simrat39/rust-tools.nvim",
        dependecies = {
          'neovim/nvim-lspconfig',
          'nvim-lua/plenary.nvim',
          'mfussenegger/nvim-dap',
        },
      },
      {
        "Saecki/crates.nvim",
        dependecies = {
          "nvim-lua/plenary.nvim"
        },
        ft = { "toml" }
      },
      {
        "williamboman/mason.nvim",
        optional = true,
        opts = function(_, opts)
          if type(opts.ensure_installed) == "table" then
            vim.list_extend(opts.ensure_installed, { "codelldb" })
          end
        end,
      }
    }
  }
}
