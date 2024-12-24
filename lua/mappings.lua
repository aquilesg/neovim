require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set
local del = vim.keymap.del
local custom = require "custom_functions"

-- Remove mappings I don't like
del("n", "<leader>v")
del("n", "<leader>h")
del("n", "<leader>ds")

map("n", "<leader>jj", "<cmd> Noice dismiss <CR>", { desc = "Dismiss Noice notification" })

-- Obsidian mappings
map("n", "<leader>ot", "<cmd> ObsidianToday <CR>", { desc = "Open today's note" })
map("n", "<leader>oy", "<cmd> ObsidianYesterday <CR>", { desc = "Open yesterday's note" })
map("n", "<leader>osn", "<cmd> ObsidianSearch <CR>", { desc = "Obsidian search notes" })
map("n", "<leader>ost", "<cmd> ObsidianTags <CR>", { desc = "Search for tags" })
map("n", "<leader>oq", "<cmd> ObsidianQuickSwitch <CR>", { desc = "Quick switch to different note" })
map("n", "<leader>oo", "<cmd> ObsidianOpen <CR>", { desc = "Open current file in Obsidian" })
map("n", "<leader>op", "<cmd> ObsidianPasteImg <CR>", { desc = "Paste image into Obsidian note" })
map("n", "<leader>on", "<cmd> ObsidianNewFromTemplate <CR>", { desc = "Create new Obsidian note in Research Folder" })

-- AI Mapping
map("n", "<leader>n", "<cmd> CodeCompanionChat <CR>", { desc = "New CodeCompanionChat" })

-- Telescope overrides
map({ "n" }, "<leader>ff", custom.find_files, { desc = "File Search" })
map({ "n" }, "<leader>fw", custom.livegrep, { desc = "Word Search" })

-- Quality of Life mappings
map("n", "<leader>fr", "<cmd> GrugFar <CR>", { desc = "Find and Replace" })
map("n", "<leader>ge", "<cmd> BlameToggle <CR>", { desc = "Toggle git blame" })
map("n", "<leader>dvv", custom.toggle_diffview, { desc = "Toggle Diffview" })
map("n", "<leader>gl", custom.open_lazygit, { desc = "Open lazygit" })
map("n", "<leader>o1", "<cmd> Octo pr create draft <CR>", { desc = "Create new PR" })
map("n", "<leader>o2", "<cmd> Octo pr list <CR>", { desc = "List PRs for this repo" })
map("n", "<leader>o3", "<cmd> Octo pr search <CR>", { desc = "Search for PR" })

-- Custom functions
map("n", "<leader>ts", custom.insert_timestamp, { desc = "Insert timestamp" })

-- Diagnostics
map("n", "<leader>qa", "<cmd> TodoTrouble <CR>", { desc = "Toggle TODO list" })

-- Set dark or light themes
map("n", "<leader>sd", custom.set_dark_theme, { desc = "Set dark theme" })
map("n", "<leader>sl", custom.set_light_theme, { desc = "Set light theme" })

-- Custom Auto-commands
vim.api.nvim_create_user_command("LoadTestSuite", custom.load_test_suite, { desc = "Load test suite" })
