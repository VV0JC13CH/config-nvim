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
    'sbdchd/neoformat',
    keys = {
      { "<leader>cF", "<cmd>Neoformat<CR>", mode = "n", desc = "code: format file (formatter)" },
      { "<leader>cF", "<cmd>Neoformat<CR>", mode = "v", desc = "code: format file (formatter)" },
    },
  }
}
