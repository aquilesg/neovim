require("octo").setup {
  review_diff = {
    toggle_viewed = { lhs = "<leader>tv", desc = "Toggle viewer viewed state" },
  },
  suppress_missing_scope = {
    projects_v2 = true,
  },
}
