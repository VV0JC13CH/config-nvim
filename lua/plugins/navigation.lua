-- navigation.lua
--
-- Navigation related plugins
--

return {
  {
    'kevinhwang91/rnvimr',
    config = function()
      vim.keymap.set('n', '<C-A-r>', '<cmd>RnvimrToggle<CR>', { desc = 'Toggle ranger' })
      -- Make Ranger replace Netrw and be the file explorer
      vim.g.rnvimr_enable_ex = 1
    end,
  },
  {
    'ThePrimeagen/harpoon',
    config = function()
      vim.keymap.set('n', '<leader><leader>', require('harpoon.ui').toggle_quick_menu, { desc = 'Open harpoon' })
      vim.keymap.set('n', '<C-A-Up>', require('harpoon.ui').nav_prev, { desc = 'Previous harpoon' })
      vim.keymap.set('n', '<C-A-Down>', require('harpoon.ui').nav_next, { desc = 'Next harpoon' })
      vim.keymap.set('n', '<A-1>', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', { desc = '1st harpoon' })
      vim.keymap.set('n', '<A-2>', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', { desc = '2nd harpoon' })
      vim.keymap.set('n', '<A-3>', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', { desc = '3rd harpoon' })
      vim.keymap.set('n', '<A-4>', '<cmd>lua require("harpoon.ui").nav_file(4)<CR>', { desc = '4th harpoon' })
      vim.keymap.set('n', '<A-5>', '<cmd>lua require("harpoon.ui").nav_file(5)<CR>', { desc = '5th harpoon' })

      vim.keymap.set('n', '<leader>a', require('harpoon.mark').add_file, { desc = '[A]dd file to harpoon' })
      vim.keymap.set('n', '<leader>r', require('harpoon.mark').rm_file, { desc = '[R]emove file from harpoon' })
    end,
  },
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
    ,
    config = function()
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
      }
    end,
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
    config = function()
      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
      vim.keymap.set('n', '<A-C-F>', '<cmd>Files<CR>', { desc = '[F]iles' })
      vim.keymap.set('n', '<A-C-G>', '<cmd>GFiles?<CR>', { desc = '[G]it files' })
      vim.keymap.set('n', '<A-C-B>', '<cmd>Buffers<CR>', { desc = '[B]uffers' })

      pcall(require("telescope").load_extension, 'harpoon')
      -- See `:help telescope.builtin`
      vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
      --     vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
      vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
    end,
  },
  'junegunn/fzf',
  {
    'junegunn/fzf.vim',
    config = function()
      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
      vim.keymap.set('n', '<A-C-F>', '<cmd>Files<CR>', { desc = '[F]iles' })
      vim.keymap.set('n', '<A-C-G>', '<cmd>GFiles?<CR>', { desc = '[G]it files' })
      vim.keymap.set('n', '<A-C-B>', '<cmd>Buffers<CR>', { desc = '[B]uffers' })
    end,

  }
}
