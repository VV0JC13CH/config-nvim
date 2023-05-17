--[[

=====================================================================
============ init.lua is a place where everything starts ============
============================== lol ==================================

-- [[ Setting appearance ]]
require("appearance")
-- [[ Setting keymap ]]
require("keymap")
-- [[ Setting diagnostic ]]
require("diagnostic")
-- [[ Setting options ]]
require("options")
-- See `:help vim.o`

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where plugins are installed.
require('lazy').setup({
  {
    -- Useful plugin to show you pending keybinds.
    { 'folke/which-key.nvim', opts = {} },
    -- Adds plugins, configuration, etc from `lua/plugins/*.lua`
    { import = 'plugins' },
  } }, {})
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
