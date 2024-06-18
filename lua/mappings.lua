require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local gitsigns = require "gitsigns"
local custom = require "custom_functions"

map("n", "<leader>jj", "<cmd> Noice dismiss <CR>", { desc = "Dismiss notification" })

-- Obsidian mappings
map("n", "<leader>ot", "<cmd> ObsidianToday <CR>", { desc = "Open today's note" })
map("n", "<leader>ow", "<cmd> ObsidianTomorrow <CR>", { desc = "Open tomorrows's note" })
map("n", "<leader>oy", "<cmd> ObsidianYesterday <CR>", { desc = "Open yesterday's note" })
map("n", "<leader>on", "<cmd> ObsidianNew <CR>", { desc = "Create new Obsidian note" })
map("n", "<leader>os", "<cmd> ObsidianSearch <CR>", { desc = "Search for note" })
map("n", "<leader>oq", "<cmd> ObsidianQuickSwitch <CR>", { desc = "Quick switch to different Note" })

-- GP mappings
map("n", "<leader>n", "<cmd> GpChatNew <CR>", { desc = "New GPT Chat" })
map("n", "<leader>1", "<cmd> GpChatRespond <CR>", { desc = "Respond to GPT Chat" })
map("n", "<leader>2", "<cmd> GpChatToggle <CR>", { desc = "Toggle GPT Chat" })

-- Telescope overrides
map({ "n", "v" }, "<leader>ff", "<cmd> Telescope find_files hidden=true <CR>", { desc = "File Search" })
map({ "n", "v" }, "<leader>fw", function()
  require("telescope").extensions.live_grep_args.live_grep_args()
end, { desc = "Word Search" })

-- Quality of Life mappings
map("n", "<leader>fr", "<cmd> GrugFar <CR>", { desc = "Find and Replace" })
map("n", "<leader>ge", "<cmd> BlameToggle <CR>", { desc = "Toggle git blame" })
map("n", "<leader>dv", "<cmd> DiffviewOpen <CR>", { desc = "Open diffview" })
map("n", "<leader>gl", "<cmd> LazyGit <CR>", { desc = "Open lazygit" })
map("n", "<leader>gn", "<cmd> Neogit <CR>", { desc = "Open Neogit" })
map("n", "<leader>wl", "<cmd> Telescope workspaces <CR>", { desc = "List workspaces" })
map("n", "<leader>ss", "<cmd> SessionsSave <CR>", { desc = "Save current Session" })
map("n", "F1", "<cmd> Octo pr create <CR>", { desc = "Create new PR" })
map("n", "F2", "<cmd> Octo pr list <CR>", { desc = "List PRs for this repo" })
map("n", "F3", "<cmd> Octo pr search <CR>", { desc = "Search for PR" })

-- Custom functions
map("n", "<leader>ts", custom.insert_timestamp, { desc = "Insert timestamp" })
map({ "v", "n" }, "<leader>ft", custom.format_table, { desc = "Format markdown table" })

-- GitSigns mappings
map("n", "<leader>sh", gitsigns.stage_hunk, { desc = "Stage Hunk" })
map("n", "<leader>us", gitsigns.undo_stage_hunk, { desc = "Undo Stage Hunk" })

-- Trouble toggle
map("n", "<leader>tq", "<cmd> TroubleToggle quickfix <CR>", { desc = "Show quickfix list" })
map("n", "<leader>q", "<cmd> TroubleToggle document_diagnostics <CR>", { desc = "Show Document Diagnostics" })
map("n", "<leader>tw", "<cmd> TroubleToggle workspace_diagnostics <CR>", { desc = "Show Workspace Diagnostics" })
