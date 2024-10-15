require("octo").setup {
  suppress_missing_scope = {
    projects_v2 = true,
  },
}

vim.treesitter.language.register("markdown", "octo")
