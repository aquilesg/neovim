require("snacks").setup {
  indent = {
    only_scope = true,
  },
  quickfile = { enabled = true },
  dashboard = {
    enabled = true,
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
      function()
        local Snacks = require "snacks"
        Snacks.scroll.enable()
        local in_git = Snacks.git.get_root() ~= nil
        local cmds = {
          {
            icon = " ",
            title = "Open PRs",
            cmd = "gh pr list -L 3",
            height = 7,
          },
          {
            icon = " ",
            title = "Git Status",
            cmd = "hub --no-pager diff --stat -B -M -C",
            height = 10,
          },
        }
        return vim.tbl_map(function(cmd)
          return vim.tbl_extend("force", {
            pane = 2,
            section = "terminal",
            enabled = in_git,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          }, cmd)
        end, cmds)
      end,
      { section = "startup" },
    },
  },
}
