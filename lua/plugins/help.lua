return {
  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        hide = {
          winbar = false,
          tabline = false,
          statusline = false,
        },
        config = {
          week_header = {
            enable = true,
          },
          footer = {
            '',
            ' 🚀 blazingly fast~!',
          },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = '🔍',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = '🕐History',
              group = 'DiagnosticHint',
              action = 'Telescope oldfiles',
              key = 'h',
            },
            {
              icon = '🤠',
              desc = 'Ranger',
              group = 'Number',
              action = 'RnvimrToggle',
              key = 'r',
            },
            {
              icon = '👷',
              desc = 'Mason',
              group = 'Number',
              action = 'Mason',
              key = 'm',
            },
          },
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  }
}
