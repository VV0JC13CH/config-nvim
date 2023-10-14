-- notes.lua
--
-- Wiki/notes related plugins
--
local MyVaults = {}
local MyVaultsMergedConfig = { keys = {}, opts = {} }
local yesterday = os.date("%Y-%m-%d", os.time() - 24 * 60 * 60)
local today = os.date("%Y-%m-%d", os.time())

function NewVault(_opts, _keys)
  -- Check if dir exists
  if os.execute('cd ' .. _opts.dir .. '/.obsidian') == 0 then
    table.insert(MyVaults, { opts = _opts, keys = _keys })
    return { opts = _opts, keys = _keys }
  end
  -- dir doesn't exist, ignore vault
  return { opts = {}, keys = {} }
end

function MergeVaultsConfig()
  -- Iterate through the array of vaults and merge them
  for _, v in ipairs(MyVaults) do
    for key1, value1 in pairs(v) do
      if key1 == 'keys' then
        if next(value1) then
          for _, value2 in pairs(value1) do
            table.insert(MyVaultsMergedConfig['keys'], value2)
          end
        end
      end
      if key1 == 'opts' then
        for key2, value2 in pairs(value1) do
          MyVaultsMergedConfig['opts'][key2] = value2
        end
      end
    end
  end
end

local opts_init = {
  dir = "~/Documents/Obsidian/Workspace", -- no need to call 'vim.fn.expand' here
  mappings = {},

  -- Optional, completion.
  completion = {
    nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
  },

  -- Optional, customize how names/IDs for new notes are created.
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return tostring(os.time()) .. "-" .. suffix
  end,

  -- Optional, set to true if you don't want Obsidian to manage frontmatter.
  disable_frontmatter = false,

  -- Optional, alternatively you can customize the frontmatter data.
  note_frontmatter_func = function(note)
    -- This is equivalent to the default frontmatter function.
    local out = { id = note.id, aliases = note.aliases, tags = note.tags }
    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end
    return out
  end,


  -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
  -- URL it will be ignored but you can customize this behavior here.
  follow_url_func = function(url)
    -- Open the URL in the default web browser.
    vim.fn.jobstart({ "xdg-open", url }) -- linux
  end,

  -- Optional, set to true if you use the Obsidian Advanced URI plugin.
  -- https://github.com/Vinzent03/obsidian-advanced-uri
  use_advanced_uri = true,

  -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
  open_app_foreground = false,

  -- Optional, by default commands like `:ObsidianSearch` will attempt to use
  -- telescope.nvim, fzf-lua, and fzf.nvim (in that order), and use the
  -- first one they find. By setting this option to your preferred
  -- finder you can attempt it first. Note that if the specified finder
  -- is not installed, or if it the command does not support it, the
  -- remaining finders will be attempted in the original order.
  finder = "telescope.nvim",
}

local keys_init = {
  { "<leader>ob",  ":ObsidianBacklinks<CR>",   desc = "Backlinks" },
  { "<leader>oc",  ":ObsidianCheck<CR>",       desc = "Check" },
  { "<leader>of",  ":ObsidianFollowLink<CR>",  desc = "Follow Link" },
  { "<leader>ol",  ":ObsidianLink<CR>",        desc = "Link" },
  { "<leader>onl", ":ObsidianLinkNew<CR>",     desc = "New Link" },
  { "<leader>onn", ":ObsidianNew<CR>",         desc = "New Note" },
  { "<leader>oo",  ":ObsidianOpen<CR>",        desc = "Open Note" },
  { "<leader>oq",  ":ObsidianQuickSwitch<CR>", desc = "Quick Switch" },
  { "<leader>os",  ":ObsidianSearch<CR>",      desc = "Search" },
  { "<leader>ot",  ":ObsidianToday<CR>",       desc = "Today" },
  { "<leader>oy",  ":ObsidianYesterday<CR>",   desc = "Yesterday" },
}

local opts_work = {
  dir = "~/Documents/Obsidian/Workspace",
  notes_subdir = "Notes",
  daily_notes = {
    folder = "Journal",
    date_format = "%Y-%m-%d"
  },
  templates = {
    subdir = "templates",
    date_format = "%Y-%m-%d-%a",
    time_format = "%H:%M",
  },
}

local keys_work = {
  { "<leader>ow", desc = "[Work Notes]" },
  {
    "<leader>own",
    ":edit " ..
    opts_work.dir ..
    "/" ..
    opts_work.notes_subdir ..
    "/" .. today .. ".md<CR>",
    desc = "New Note"
  },
  {
    "<leader>owt",
    ":edit " ..
    opts_work.dir ..
    "/" ..
    opts_work.daily_notes.folder ..
    "/" .. today .. ".md<CR>",
    desc = "Today"
  },
  {
    "<leader>owy",
    ":edit " ..
    opts_work.dir ..
    "/" ..
    opts_work.daily_notes.folder ..
    "/" .. yesterday .. ".md<CR>",
    desc = "Yesterday"
  },
}

local opts_priv = {
  dir = "~/Documents/Obsidian",
  notes_subdir = "Private/Notatki",
  daily_notes = {
    folder = "Private/Dziennik",
    date_format = "%Y-%m-%d"
  },
  templates = {
    subdir = "Private/Szablony",
    date_format = "%Y-%m-%d-%a",
    time_format = "%H:%M",
  },
}

local keys_priv = {
  { "<leader>op", desc = "[Private Notes]" },
  {
    "<leader>opn",
    ":edit " ..
    opts_priv.dir ..
    "/" ..
    opts_priv.notes_subdir ..
    "/" .. today .. ".md<CR>",
    desc = "New Note"
  },
  {
    "<leader>opt",
    ":edit " ..
    opts_priv.dir ..
    "/" ..
    opts_priv.daily_notes.folder ..
    "/" .. today .. ".md<CR>",
    desc = "Today"
  },
  {
    "<leader>opy",
    ":edit " ..
    opts_priv.dir ..
    "/" ..
    opts_priv.daily_notes.folder ..
    "/" .. yesterday .. ".md<CR>",
    desc = "Yesterday"
  },
}

-- From least to most frequently used:
NewVault(opts_init, keys_init)
NewVault(opts_work, keys_work)
NewVault(opts_priv, keys_priv)
MergeVaultsConfig()

return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  event = { "BufReadPre " .. vim.fn.expand "~" .. "/Documents/**.md" },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- Optional, for completion.
    "hrsh7th/nvim-cmp",

    -- Optional, for search and quick-switch functionality.
    "nvim-telescope/telescope.nvim",

    -- Optional, alternative to nvim-treesitter for syntax highlighting.
    "godlygeek/tabular",
    "preservim/vim-markdown",
  },
  opts = MyVaultsMergedConfig.opts,
  keys = MyVaultsMergedConfig.keys,
}
