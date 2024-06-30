return {
  {
    'rust-lang/rust.vim',
    config = function()
      vim.o.syntax = 'Enable'
      vim.filetype.indend = true
    end,
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
    },
    {
      "simrat39/rust-tools.nvim",
      config = function()
        local dap = require("dap")

        dap.adapters.codelldb = {
          type = 'server',
          port = "${port}",
          executable = {
            -- Change this to your path!
            command = 'codelldb',
            args = { "--port", "${port}" },
          }
        }

        dap.configurations.rust = {
          {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
          },
        }

        require("dapui").setup()
      end
    },
    {
      "Saecki/crates.nvim",
      dependencies = {
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
