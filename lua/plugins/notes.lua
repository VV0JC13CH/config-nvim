-- notes.lua
--
-- Wiki/notes related plugins
--
function Choose_vault( priv_vault, work_vault )
if os.execute( 'cd ' .. priv_vault ) == 0 then
    return priv_vault
end
return work_vault
end

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
  opts = {
    dir = Choose_vault("~/Documents/Obsidian/Private", "~/Documents/Obsidian/DevOps"),  -- no need to call 'vim.fn.expand' here
        mappings = {},

    -- Optional, if you keep notes in a specific subdirectory of your vault.
    notes_subdir = "Notes",

    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "Journal",
      -- Optional, if you want to change the date format for daily notes.
      date_format = "%Y-%m-%d"
    },

    -- Optional, completion.
    completion = {
      nvim_cmp = true,  -- if using nvim-cmp, otherwise set to false
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

    -- Optional, for templates (see below).
    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },

    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      vim.fn.jobstart({"xdg-open", url})  -- linux
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
  },
      keys = {
      { "<leader>ob", ":ObsidianBacklinks<CR>", desc = "Backlinks" },
      { "<leader>oc", ":ObsidianCheck<CR>", desc = "Check" },
      { "<leader>of", ":ObsidianFollowLink<CR>", desc = "Follow Link" },
      { "<leader>ol", ":ObsidianLink<CR>", desc = "Link" },
      { "<leader>onl", ":ObsidianLinkNew<CR>", desc = "New Link" },
      { "<leader>onn", ":ObsidianNew<CR>", desc = "New Note" },
      { "<leader>oo", ":ObsidianOpen<CR>", desc = "Open Note" },
      { "<leader>oq", ":ObsidianQuickSwitch<CR>", desc = "Quick Switch" },
      { "<leader>os", ":ObsidianSearch<CR>", desc = "Search" },
      { "<leader>ot", ":ObsidianToday<CR>", desc = "Today" },
      { "<leader>oy", ":ObsidianYesterday<CR>", desc = "Yesterday" },
    },
}
