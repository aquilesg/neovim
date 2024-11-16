require("trouble").setup {
  focus = true,
}

local map = vim.keymap.set

-- Diagnostics
map("n", "<leader>qt", "<cmd> Trouble diagnostics toggle <CR>", { desc = "Toggle Trouble over workspace" })
map("n", "<leader>qb", "<cmd> Trouble diagnostics toggle filter.buf=0 <CR>", { desc = "Toggle buffer diagnostics" })

-- Document symbols
map(
  "n",
  "go",
  "<cmd> Trouble symbols toggle focus=true pinned=true results.win.relative=win results.win.position=right <CR>",
  { desc = "Show outline" }
)
