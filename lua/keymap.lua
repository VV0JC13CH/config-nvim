-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Tabs navigation
vim.keymap.set('n', '<C-A-Right>', '<CMD>tabn<CR>', { desc = '[R]ight tab' })
vim.keymap.set('n', '<C-A-Left>', '<CMD>tabp<CR>', { desc = '[L]eft tab' })

-- Windows navigation with Ctrl-[hjkl]
vim.keymap.set('n', '<A-C-J>', '<C-W>j', { desc = 'Switch to left window' })
vim.keymap.set('n', '<A-C-H>', '<C-W>h', { desc = 'Switch to above window' })
vim.keymap.set('n', '<A-C-K>', '<C-W>k', { desc = 'Switch to right window' })
vim.keymap.set('n', '<A-C-L>', '<C-W>l', { desc = 'Switch to below window' })
