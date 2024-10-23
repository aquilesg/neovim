require("octo").setup {
  suppress_missing_scope = {
    projects_v2 = true,
  },
  colors = {
    white = "#ffffff",
    grey = "#8f95a3",
    black = "#2a2a2a",
    red = "#cf8c92",
    dark_red = "#bf5a5a",
    green = "#889689",
    dark_green = "#659667",
    yellow = "#cfc994",
    dark_yellow = "#cfc136",
    blue = "#7b9ebb",
    dark_blue = "#508ab9",
    purple = "#a17ea7",
  },
}

vim.treesitter.language.register("markdown", "octo")
vim.keymap.set("i", "@", "@<C-x><C-o>", { silent = true, buffer = true })
vim.keymap.set("i", "#", "#<C-x><C-o>", { silent = true, buffer = true })
