-- formatters.lua
--
-- Format related plugins
--

return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- "gc" to comment visual regions/lines
  -- "gb" to comment visual regions/lines (block comment)
  { 'numToStr/Comment.nvim', opts = {} },
  {
    'sbdchd/neoformat', config = function()
      vim.keymap.set('n', '<leader>cF', '<cmd>Neoformat<CR>', { desc = 'Code: Format File (formatter)' })
      vim.keymap.set('v', '<leader>cF', '<cmd>Neoformat<CR>', { desc = 'Code: Format Selection (formatter)' })
    end
  }
}
