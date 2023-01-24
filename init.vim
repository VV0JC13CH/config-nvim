:set clipboard=unnamedplus	" enables the clipboard between Vim/Neovim and other applications.
:set number					" show line number
:set relativenumber			" show line numbers starting from the current one.
:set autoindent
:set expandtab              " spaces instead tabs
:set tabstop=4				" number of spaces for tabs
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a				" allows the use of the mouse in the editor
:set background = "dark"

call plug#begin()

" Appearance
Plug 'https://github.com/vim-airline/vim-airline'	" Status bar
Plug 'nanotech/jellybeans.vim'						" Colors scheme

" Utilities
Plug 'https://github.com/preservim/nerdtree'		" NerdTree
Plug 'nvim-lua/plenary.nvim'						" Harpoon's requirement
Plug 'ThePrimeagen/harpoon'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'mrk21/yaml-vim' " For hieradata
Plug 'TheLocehiliosan/vim-eyaml' " For hieradata in eyaml
Plug 'rodjek/vim-puppet' " For Puppet syntax highlighting
Plug 'vim-ruby/vim-ruby' " For Facts, Ruby functions, and custom providers

" Completion / linters / formatters
Plug 'rust-lang/rust.vim'							" syntax highlighting, formatting, and file detection

" LSP Support
Plug 'neovim/nvim-lspconfig'             " Required
Plug 'williamboman/mason.nvim'           " Optional
Plug 'williamboman/mason-lspconfig.nvim' " Optional

" Autocompletion Engine
Plug 'hrsh7th/nvim-cmp'         " Required
Plug 'hrsh7th/cmp-nvim-lsp'     " Required
Plug 'hrsh7th/cmp-buffer'       " Optional
Plug 'hrsh7th/cmp-path'         " Optional
Plug 'saadparwaiz1/cmp_luasnip' " Optional
Plug 'hrsh7th/cmp-nvim-lua'     " Optional

"  Snippets
Plug 'L3MON4D3/LuaSnip'             " Required
Plug 'rafamadriz/friendly-snippets' " Optional
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}

" Git
Plug 'f-person/git-blame.nvim'                      " Git-blame
let g:gitblame_enabled = 1
Plug 'airblade/vim-gitgutter'						" Shows Git changes in open files

call plug#end()

colorscheme jellybeans
" fzf
nnoremap <A-C-F> :Files<CR>
nnoremap <A-C-G> :GFiles?<CR>
nnoremap <A-C-B> :Buffers<CR>
nnoremap <A-C-Up> :bprev<CR>
nnoremap <A-C-Down> :bnext<CR>


" Harpoon
nnoremap <A-C-H> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <A-C-A> ::lua require("harpoon.mark").add_file()<CR>
nnoremap <A-C-R> ::lua require("harpoon.mark").rm_file()<CR>
nnoremap <A-C-Right> ::lua require("harpoon.ui").nav_next()<CR>
nnoremap <A-C-Left> ::lua require("harpoon.ui").nav_next()<CR>
nnoremap <A-1> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <A-2> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <A-3> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <A-4> :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <A-5> :lua require("harpoon.ui").nav_file(5)<CR>


"Window Navigation with Ctrl-[hjkl]
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" NerdTree
nnoremap <C-t> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let NERDTreeShowHidden=1							"show hidden files by default

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" LSP-ZERO BEGIN
lua <<EOF
-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  'tsserver',
  'eslint',
  'sumneko_lua',
})
lsp.setup()
EOF
" LSP-ZERO END
