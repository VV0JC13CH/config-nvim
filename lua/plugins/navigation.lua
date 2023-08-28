-- navigation.lua
--
-- Navigation related plugins
--

return {
  {
    'kevinhwang91/rnvimr',
    config = function()
      vim.keymap.set('n', '<leader>tr', '<cmd>RnvimrToggle<CR>', { desc = 'Toggle Ranger' })
      -- Make Ranger replace Netrw and be the file explorer
      vim.g.rnvimr_enable_ex = 1
    end,
  },
  {
    'ThePrimeagen/harpoon',
    config = function()
      vim.keymap.set('n', '<leader>hh', require('harpoon.ui').toggle_quick_menu, { desc = 'Harpoon' })
      vim.keymap.set('n', '<leader>th', require('harpoon.ui').toggle_quick_menu, { desc = 'Toggle Harpoon' })
      vim.keymap.set('n', '<C-A-Up>', require('harpoon.ui').nav_prev, { desc = 'Previous harpoon' })
      vim.keymap.set('n', '<C-A-Down>', require('harpoon.ui').nav_next, { desc = 'Next harpoon' })
      vim.keymap.set('n', '<leader>h1', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', { desc = '1st harpoon' })
      vim.keymap.set('n', '<leader>h2', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', { desc = '2nd harpoon' })
      vim.keymap.set('n', '<leader>h3', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', { desc = '3rd harpoon' })
      vim.keymap.set('n', '<leader>h4', '<cmd>lua require("harpoon.ui").nav_file(4)<CR>', { desc = '4th harpoon' })

      vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file, { desc = 'Add file to harpoon' })
      vim.keymap.set('n', '<leader>hr', require('harpoon.mark').rm_file, { desc = 'Remove file from harpoon' })
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
      vim.keymap.set('n', '<A-C-F>', '<cmd>Files<CR>', { desc = 'Files' })
      vim.keymap.set('n', '<A-C-G>', '<cmd>GFiles?<CR>', { desc = 'Git files' })
      vim.keymap.set('n', '<A-C-B>', '<cmd>Buffers<CR>', { desc = 'Buffers' })

      pcall(require("telescope").load_extension, 'harpoon')
      -- See `:help telescope.builtin`
      vim.keymap.set('n', '<leader>s/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = 'Search in current buffer' })

      vim.keymap.set('n', '<leader>sG', require('telescope.builtin').git_files, { desc = 'Search Git Files' })
      vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'Search Files' })
      vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Search Help' })
      vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'Search current Word' })
      vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'Search by Grep' })
      vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Search Diagnostics' })
      vim.keymap.set('n', '<leader>so', require('telescope.builtin').oldfiles, { desc = 'Search in Old files' })
    end,
  },
  'junegunn/fzf',
  {
    'junegunn/fzf.vim',
    config = function()
      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
      vim.keymap.set('n', '<A-C-F>', '<cmd>Files<CR>', { desc = 'Search Files' })
      vim.keymap.set('n', '<A-C-G>', '<cmd>GFiles?<CR>', { desc = 'Search Git files' })
      vim.keymap.set('n', '<A-C-B>', '<cmd>Buffers<CR>', { desc = 'Search Buffers' })
    end,

  },
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>tu', '<cmd>UndotreeToggle<CR>', { desc = 'Toggle Undo tree' })
    end,
  }
}
