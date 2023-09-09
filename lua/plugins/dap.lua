-- dap.lua

return {
  {
    'folke/trouble.nvim',
    config = function()
      vim.keymap.set('n', '<leader>te', '<cmd>TroubleToggle<cr>', { desc = "Toggle Errors" })
      vim.keymap.set('n', '<leader>dd', '<cmd>TroubleToggle<cr>', { desc = "Toggle Debugger" })
    end,
  },
  {
    'mfussenegger/nvim-dap',
    -- NOTE: And you can specify dependencies as well
    dependencies = {
      -- Creates a beautiful debugger UI
      'rcarriga/nvim-dap-ui',
      --  adds virtual text support to nvim-dap
      { "theHamsta/nvim-dap-virtual-text" },
      -- integration for nvim-dap with telescope.nvim
      { "nvim-telescope/telescope-dap.nvim" },
      -- a debug adapter for the Neovim Lua language
      { "jbyuki/one-small-step-for-vimkind" },

      -- Installs the debug adapters for you
      'williamboman/mason.nvim',
      'nvim-tree/nvim-web-devicons',
      'jay-babu/mason-nvim-dap.nvim',
    },
    keys = {
      {
        "<leader>dR",
        function() require("dap").run_to_cursor() end,
        desc =
        "Run to Cursor",
      },
      {
        "<leader>dE",
        function() require("dapui").eval(vim.fn.input "[Expression] > ") end,
        desc =
        "Evaluate Input",
      },
      {
        "<leader>dC",
        function() require("dap").set_breakpoint(vim.fn.input "[Condition] > ") end,
        desc =
        "Conditional Breakpoint",
      },
      {
        "<leader>dU",
        function() require("dapui").toggle() end,
        desc =
        "Toggle UI",
      },
      {
        "<F7>",
        function() require("dapui").toggle() end,
        desc =
        "Toggle UI",
      },
      {
        "<leader>td",
        function() require("dapui").toggle() end,
        desc =
        "Toggle Debug",
      },
      {
        "<leader>db",
        function() require("dap").step_back() end,
        desc =
        "Step Back",
      },


      {
        "<F5>",
        function() require("dap").continue() end,
        desc =
        "Continue",
      },
      {
        "<F1>",
        function() require("dap").step_into() end,
        desc =
        "Step Into",
      },
      {
        "<leader>di",
        function() require("dap").step_into() end,
        desc =
        "Step Into",
      },
      {
        "<F2>",
        function() require("dap").step_over() end,
        desc =
        "Step Over",
      },
      {
        "<leader>do",
        function() require("dap").step_over() end,
        desc =
        "Step Over",
      },
      {
        "<F3>",
        function() require("dap").step_out() end,
        desc =
        "Step Out",
      },
      {
        "<leader>du",
        function() require("dap").step_out() end,
        desc =
        "Step Out",
      },
      {
        "<leader>dt",
        function() require("dap").toggle_breakpoint() end,
        desc =
        "Toggle Breakpoint",
      },
      {
        "<leader>dB",
        function() require("dap").set_breakpoint(vim.fn.input 'Breakpoint condition: ') end,
        desc =
        "Breakpoint condition",
      },

      {
        "<leader>dc",
        function() require("dap").continue() end,
        desc =
        "Continue",
      },
      {
        "<leader>dd",
        function() require("dap").disconnect() end,
        desc =
        "Disconnect",
      },
      {
        "<leader>de",
        function() require("dapui").eval() end,
        mode = { "n", "v" },
        desc =
        "Evaluate",
      },
      { "<leader>dg", function() require("dap").session() end,           desc = "Get Session", },
      {
        "<leader>dh",
        function() require("dap.ui.widgets").hover() end,
        desc =
        "Hover Variables",
      },
      { "<leader>dS", function() require("dap.ui.widgets").scopes() end, desc = "Scopes", },
      { "<leader>dp", function() require("dap").pause.toggle() end,      desc = "Pause", },
      { "<leader>dq", function() require("dap").close() end,             desc = "Quit", },
      { "<leader>dr", function() require("dap").repl.toggle() end,       desc = "Toggle REPL", },
      { "<leader>ds", function() require("dap").continue() end,          desc = "Start", },
      { "<leader>dx", function() require("dap").terminate() end,         desc = "Terminate", },
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      require('mason-nvim-dap').setup {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_setup = true,
        automatic_installation = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {},

        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          -- Update this to ensure that you have the debuggers for the langs you want
          'delve',
        },
      }


      -- Dap UI setup
      -- For more information, see |:help nvim-dap-ui|
      dapui.setup {
        -- Set icons to characters that are more likely to work in every terminal.
        --    Feel free to remove or use ones that you like more! :)
        --    Don't feel like these are good choices.
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = "⏏",
          },
        },
      }

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close
    end,
  } }
