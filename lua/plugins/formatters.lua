-- formatters.lua
--
-- Format related plugins
--

return {
  {
    config = function()
      vim.keymap.set('n', '<leader>f', '<cmd>Format<CR>', { desc = 'Format code in file' })
      vim.keymap.set('v', '<leader>f', '<cmd>Format<CR>', { desc = 'Format code in selection' })
    end,
  },
  -- Detect tabstop and shiftwidth automatically
  'hashivim/vim-terraform',
  'tpope/vim-sleuth',
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
}
