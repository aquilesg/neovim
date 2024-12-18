require("obsidian").setup {
  workspaces = {
    {
      name = "Work",
      path = "~/Documents/Work",
      overrides = {
        daily_notes = {
          folder = "DailyNotes",
          template = "daily.md",
        },
        templates = {
          subdir = "Templates",
          substitutions = {
            pretty_date = function()
              return os.date "%B %d, %Y"
            end,
          },
        },
      },
    },
  },
  ui = {
    enable = false,
  },
  use_advanced_uri = true,
  suppress_missing_scope = {
    projects_v2 = true,
  },
  --- Trigger URLS to open
  ---@param url string
  follow_url_func = function(url)
    vim.fn.jobstart { "open", url }
  end,
}
