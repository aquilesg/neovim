require("gitsigns").setup {}

-- Mappings
local gitsigns = require "gitsigns"
local map = vim.keymap.set
map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage hunk" })
map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk" })
map("v", "<leader>hs", function()
  gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "Stage visual section" })
map("v", "<leader>hr", function()
  gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "Reset visual section" })
map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage buffer" })
map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "Undo stage hunk" })
map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset buffer" })
map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk" })
map("n", "<leader>hb", function()
  gitsigns.blame_line { full = true }
end, { desc = "Blame line" })
map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle blame line" })
map("n", "<leader>hd", gitsigns.diffthis, { desc = "Diff this" })
map("n", "<leader>hD", function()
  gitsigns.diffthis "~"
end, { desc = "Diff this ~" })
map("n", "<leader>td", gitsigns.toggle_deleted, { desc = "Toggle deleted" })
