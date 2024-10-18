require("octo").setup {
  suppress_missing_scope = {
    projects_v2 = true,
  },
}

vim.treesitter.language.register("markdown", "octo")
vim.keymap.set("i", "@", "@<C-x><C-o>", { silent = true, buffer = true })
vim.keymap.set("i", "#", "#<C-x><C-o>", { silent = true, buffer = true })
