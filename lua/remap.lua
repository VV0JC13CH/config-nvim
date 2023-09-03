-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<leader>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Tabs navigation
vim.keymap.set('n', '<C-A-Right>', '<CMD>tabn<CR>', { desc = 'Right tab' })
vim.keymap.set('n', '<C-A-Left>', '<CMD>tabp<CR>', { desc = 'Left tab' })

-- Windows navigation with Ctrl-[hjkl]
vim.keymap.set('n', '<A-C-J>', '<C-W>j', { desc = 'Switch to left window' })
vim.keymap.set('n', '<A-C-H>', '<C-W>h', { desc = 'Switch to above window' })
vim.keymap.set('n', '<A-C-K>', '<C-W>k', { desc = 'Switch to right window' })
vim.keymap.set('n', '<A-C-L>', '<C-W>l', { desc = 'Switch to below window' })

-- Move selected lines up and down by J,K
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })

-- Keeps cursor in the middle while <C-d> or <C-u>
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keeps cursor in the middle while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without loosing copied content
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Find and replace word below cursor
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "Rename current word"})
