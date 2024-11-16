require "nvchad.mappings"
local custom_functions = require "custom_functions"

-- add yours here
local map = vim.keymap.set
local del = vim.keymap.del
local custom = require "custom_functions"

-- Remove mappings I don't like
del("n", "<leader>v")
del("n", "<leader>h")
del("n", "<leader>ds")

-- Obsidian mappings
map("n", "<leader>ot", "<cmd> ObsidianToday <CR>", { desc = "Open today's note" })
map("n", "<leader>ou", "<cmd> ObsidianTomorrow <CR>", { desc = "Open tomorrow's note" })
map("n", "<leader>oy", "<cmd> ObsidianYesterday <CR>", { desc = "Open yesterday's note" })
map("n", "<leader>osn", "<cmd> ObsidianSearch <CR>", { desc = "Obsidian search" })
map("n", "<leader>ost", "<cmd> ObsidianTags <CR>", { desc = "Search for tags" })
map("n", "<leader>oq", "<cmd> ObsidianQuickSwitch <CR>", { desc = "Quick switch to different note" })
map("n", "<leader>oo", "<cmd> ObsidianOpen <CR>", { desc = "Open current file in Obsidian" })
map("n", "<leader>op", "<cmd> ObsidianPasteImg <CR>", { desc = "Paste image into Obsidian note" })
map(
  "n",
  "<leader>ons",
  "<cmd> ObsidianNewFromTemplate StoryNotes/ <CR>",
  { desc = "Create new Obsidian note in Story Folder" }
)
map(
  "n",
  "<leader>onm",
  "<cmd> ObsidianNewFromTemplate Misc/ <CR>",
  { desc = "Create new Obsidian note in Misc Folder" }
)
map(
  "n",
  "<leader>onr",
  "<cmd> ObsidianNewFromTemplate Research/ <CR>",
  { desc = "Create new Obsidian note in Research Folder" }
)

-- AI Mapping
map("n", "<leader>n", "<cmd> CodeCompanionChat <CR>", { desc = "New CodeCompanionChat" })

-- Telescope overrides
map({ "n", "v" }, "<leader>ff", "<cmd> Telescope find_files hidden=true <CR>", { desc = "File Search" })
map({ "n", "v" }, "<leader>fw", function()
  require("telescope").extensions.live_grep_args.live_grep_args()
end, { desc = "Word Search" })

-- Quality of Life mappings
map("n", "<leader>fr", "<cmd> GrugFar <CR>", { desc = "Find and Replace" })
map("n", "<leader>ge", "<cmd> BlameToggle <CR>", { desc = "Toggle git blame" })
map("n", "<leader>dvv", custom.toggle_diffview, { desc = "Toggle Diffview" })
map("n", "<leader>gl", "<cmd> LazyGit <CR>", { desc = "Open lazygit" })
map("n", "<leader>gn", "<cmd> Neogit <CR>", { desc = "Open Neogit" })
map("n", "<leader>wl", "<cmd> Telescope workspaces <CR>", { desc = "List workspaces" })
map("n", "<leader>ss", "<cmd> SessionsSave <CR>", { desc = "Save current Session" })
map("n", "<leader>o1", "<cmd> Octo pr create draft <CR>", { desc = "Create new PR" })
map("n", "<leader>o2", "<cmd> Octo pr list <CR>", { desc = "List PRs for this repo" })
map("n", "<leader>o3", "<cmd> Octo pr search <CR>", { desc = "Search for PR" })

-- Custom functions
map("n", "<leader>ts", custom.insert_timestamp, { desc = "Insert timestamp" })

-- Diagnostics
map("n", "<leader>qa", "<cmd> TodoTelescope <CR>", { desc = "Toggle TODO list" })

-- Set dark or light themes
map("n", "<leader>sd", custom.set_dark_theme, { desc = "Set dark theme" })
map("n", "<leader>sl", custom.set_light_theme, { desc = "Set light theme" })

-- Marks
map("n", "<leader>ma", "<Plug>(VesselViewLocalJumps)", { desc = "View local jumps" })
map("n", "<leader>mA", "<cmd> Marks <CR>", { desc = "View local jumps" })

-- Custom Auto-commands
vim.api.nvim_create_user_command("LoadTestSuite", custom.load_test_suite, { desc = "Load test suite" })
