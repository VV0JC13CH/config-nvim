-- lsp.lua
-- NOTE: This is where your plugins related to LSP can be installed.
--  The configuration is done below. Search for lspconfig to find it below.
return {
  -- Display lightbuld when code action available
  {
    'kosayoda/nvim-lightbulb',
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = { enabled = true }
      })
    end,
    dependencies = { "neovim/nvim-lspconfig" }
  }, {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
    -- GDscript support
    'Scony/godot-gdscript-toolkit',
    'habamax/vim-godot',
  },
  config = function()
    -- LSP settings.
    --  This function gets run when an LSP connects to a particular buffer.
    local on_attach = function(_, bufnr)
      -- NOTE: Remember that lua is a real programming language, and as such it is possible
      -- to define small helper and utility functions so you don't have to repeat yourself
      -- many times.
      --
      -- In this case, we create a function that lets us more easily define mappings specific
      -- for LSP related items. It sets the mode, buffer and description for us each time.
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<leader>cr', vim.lsp.buf.rename, 'Code: Rename')
      nmap('<leader>ca', vim.lsp.buf.code_action, 'Code: Action')
      vim.keymap.set('n', '<leader>cf', '<cmd>Format<CR>', { desc = 'Code: Format File (lsp)' })
      vim.keymap.set('v', '<leader>cf', '<cmd>Format<CR>', { desc = 'Code: Format Selection (lsp)' })


      nmap('<leader>gd', vim.lsp.buf.definition, 'Go to Definition')
      nmap('<leader>gr', require('telescope.builtin').lsp_references, 'Go to References')
      nmap('<leader>gi', vim.lsp.buf.implementation, 'Go to Implementation')
      nmap('<leader>gt', vim.lsp.buf.type_definition, 'Go to Type definition')
      nmap('<leader>gs', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
      nmap('<leader>gw', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')

      -- See `:help K` for why this keymap
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

      -- Lesser used LSP functionality
      nmap('<leader>gD', vim.lsp.buf.declaration, 'Go to Declaration')
      nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Workspace Add Folder')
      nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove Folder')
      nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, 'Workspace List Folders')

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end

    -- Enable the following language servers
    --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    --
    --  Add any additional override configuration in the following tables. They will be passed to
    --  the `settings` field of the server config. You must look up that documentation yourself.
    local servers = {
      bashls = {},
      clangd = {},
      omnisharp_mono = {},
      dotls = {},
      gopls = {},
      html = {},
      jsonls = {},
      jdtls = {},
      marksman = {},
      puppet = {},
      pyright = {},
      --ruby_ls = {},
      rust_analyzer = {},
      sqlls = {},
      taplo = {},
      tailwindcss = {},
      tsserver = {},
      terraformls = {},
      lemminx = {},
      yamlls = {},


      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }

    -- Setup neovim lua configuration
    require('neodev').setup()


    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }
    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
        }
      end,
    }
  end,
} }
