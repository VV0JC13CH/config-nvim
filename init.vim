:set clipboard=unnamedplus	" enables the clipboard between Vim/Neovim and other applications.
:set number					" show line number
:set relativenumber			" show line numbers starting from the current one.

" Indent
:set autoindent
:set smartindent
:set smarttab
:set tabstop=4				" number of spaces for tabs
:set softtabstop=4
:set shiftwidth=4
:set expandtab              " spaces instead tabs

" Wrap
:set nowrap

" Update
:set updatetime=50

" Autocompletion of commands
set wildmode=longest,list,full

" Backups / undo
:set backup
:set backupdir=~/.vim/backup//
:set directory=~/.vim/swap//
:set undofile
:set undodir=~/.vim/undodir//

" Search
:set hlsearch
:set incsearch

" Scrolling
:set scrolloff=8            " Always min.8 rows above/below when scrolling up/down
:set mouse=a				" allows the use of the mouse in the editor

" Column
:set signcolumn=yes
:set colorcolumn=80         " Color column after provided No of chars

" Colors
:set background="dark"
:set termguicolors

" keybindings


call plug#begin()
" Appearance
Plug 'https://github.com/vim-airline/vim-airline'	" Status bar
Plug 'nanotech/jellybeans.vim'						" Colors scheme

" Utilities
Plug 'kevinhwang91/rnvimr'                          " ranger in VIM
Plug 'nvim-lua/plenary.nvim'						" Harpoon's requirement
Plug 'ThePrimeagen/harpoon'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'mrk21/yaml-vim' " For hieradata
Plug 'TheLocehiliosan/vim-eyaml' " For hieradata in eyaml
Plug 'rodjek/vim-puppet' " For Puppet syntax highlighting
Plug 'vim-ruby/vim-ruby' " For Facts, Ruby functions, and custom providers

" Diagnostics
Plug 'nvim-tree/nvim-web-devicons'
Plug 'folke/trouble.nvim'
" highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Completion / linters / formatters
Plug 'rust-lang/rust.vim'							" syntax highlighting, formatting, and file detection
Plug 'nathom/filetype.nvim'							" recognize files
" Formatting
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'hashivim/vim-terraform'
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

" Undo history
Plug 'mbbill/undotree'

" Git
Plug 'f-person/git-blame.nvim'                      " Git-blame
let g:gitblame_enabled = 1
Plug 'airblade/vim-gitgutter'						" Shows Git changes in open files

" Autocompletion of commands
if has('nvim')
  function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
  endfunction

  Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
else
  Plug 'gelguy/wilder.nvim'

  " To use Python remote plugin features in Vim, can be skipped
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

colorscheme jellybeans

" keybindings

let mapleader = " "         " map leader to Space
" View history of file
nnoremap <leader>u :UndotreeToggle<CR>

" Format selected or all code:
nnoremap <leader>f :FormatCode<CR>
vnoremap <leader>f :FormatLines<CR>

" Move selected lines up and down by J,K
vnoremap <s-j> :m '>+1<CR>gv=gv
vnoremap <s-k> :m '<-2<CR>gv=gv

" Cursor stays in the middle while jumping up and down
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Cursor stays at the beginning of the line while J action (replace below
" newlines with spaces)
nnoremap <s-j> mzJ`z

" After replacing selected text with copied one, copied one is not replaced
" with selected text
xnoremap <leader>p pgvy
" Start replacing current word under cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Default keys
call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<Tab>',
      \ 'previous_key': '<S-Tab>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ })

call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'fuzzy': 1,
      \       'set_pcre2_pattern': 1,
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': 'fuzzy',
      \     }),
      \   ),
      \ ])

let s:highlighters = [
        \ wilder#pcre2_highlighter(),
        \ wilder#basic_highlighter(),
        \ ]

call wilder#set_option('renderer', wilder#renderer_mux({
      \ ':': wilder#popupmenu_renderer({
      \   'highlighter': s:highlighters,
      \ }),
      \ '/': wilder#wildmenu_renderer({
      \   'highlighter': s:highlighters,
      \ }),
      \ }))

" fzf
nnoremap <A-C-F> :Files<CR>
nnoremap <A-C-G> :GFiles?<CR>
nnoremap <A-C-B> :Buffers<CR>
" nnoremap <A-C-Up> :bprev<CR>
" nnoremap <A-C-Down> :bnext<CR>

" Trouble (Diagnostics)
nnoremap <leader>e <cmd>TroubleToggle<cr>

" Harpoon
nnoremap <leader><leader> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>r :lua require("harpoon.mark").rm_file()<CR>
nnoremap <C-A-Up> :lua require("harpoon.ui").nav_prev()<CR>
nnoremap <C-A-Down> :lua require("harpoon.ui").nav_next()<CR>
nnoremap <C-A-Right> :tabn<CR>
nnoremap <C-A-Left> :tabp<CR>
nnoremap <A-1> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <A-2> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <A-3> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <A-4> :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <A-5> :lua require("harpoon.ui").nav_file(5)<CR>


"Window Navigation with Ctrl-[hjkl]
noremap <A-C-J> <C-W>j
noremap <A-C-K> <C-W>k
noremap <A-C-H> <C-W>h
noremap <A-C-L> <C-W>l

" rnvimr
nnoremap <C-A-r> :RnvimrToggle<CR>
" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_ex = 1


" Rust
let g:rustfmt_autosave = 0
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" --- LUA BEGIN ---
lua <<EOF
--- LSP-ZERO BEGIN ---

-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  'bashls',
  'omnisharp_mono',
  'dotls',
  'gopls',
  'html',
  'jsonls',
  'jdtls',
  'marksman',
  'puppet',
  'pyright',
  'ruby_ls',
  'rust_analyzer',
  'sqlls',
  'taplo',
  'tailwindcss',
  'tsserver',
  'terraformls',
  'lemminx',
  'yamlls',
})
lsp.setup()
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
--- LSP-ZERO END ---
EOF
" --- LUA END ---
