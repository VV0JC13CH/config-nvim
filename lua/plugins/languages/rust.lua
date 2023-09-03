return {
  'rust-lang/rust.vim',
  config = function()
    vim.o.syntax = 'Enable'
    vim.filetype.indend = true
  end,
  ft = { "rust", "toml" }
}
