vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Spaces instead tabs
vim.opt.expandtab = true

vim.opt.smarttab = true
vim.opt.smartindent = true

-- Enable break indent
vim.o.breakindent = true

-- Turn off wrap
vim.opt.wrap = false

-- Turn off swap, but in case it's enabled keep it in proper catalog
vim.opt.swapfile = false
vim.opt.directory = os.getenv("HOME") .. "/.vim/swapfiles"

-- Turn on backup
vim.opt.backup = true
vim.opt.backupdir = os.getenv("HOME") .. "/.vim/undodir"

-- Save undo history
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Highlight search results
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Always min.8 rows above/below when scrolling up/down
vim.opt.scrolloff = 8


vim.opt.isfname:append("@-@")

-- Decrease update time
vim.o.updatetime = 50
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

-- Make line numbers default
vim.wo.number = true
vim.opt.nu = true
vim.opt.relativenumber = true

-- Enable mouse mode (moving, selection and scrolling)
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Autocompletion of commands
vim.o.wildignorecase = true
vim.o.wildmode = "longest,list:longest,full"

