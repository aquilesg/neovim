require("octo").setup {
  enable_builtin = true,
  users = "assignable",
  default_to_projects_v2 = false,
  ui = {
    use_signcolumn = true,
    use_signstatus = true,
  },
  colors = {
    white = "#ffffff",
    grey = "#2A354C",
    black = "#000000",
    red = "#fdb8c0",
    dark_red = "#da3633",
    green = "#acf2bd",
    dark_green = "#238636",
    yellow = "#d3c846",
    dark_yellow = "#735c0f",
    blue = "#58A6FF",
    dark_blue = "#0366d6",
    purple = "#6f42c1",
  },
}

vim.treesitter.language.register("markdown", "octo")
vim.keymap.set("i", "@", "@<C-x><C-o>", { silent = true, buffer = true })
vim.keymap.set("i", "#", "#<C-x><C-o>", { silent = true, buffer = true })
