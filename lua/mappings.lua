require "nvchad.mappings"

-- add yours here
vim.g.maplocalleader = ","
local map = vim.keymap.set
local del = vim.keymap.del
local gitsigns = require "gitsigns"
local custom = require "custom_functions"

-- Remove mappings I don't like
del("n", "<leader>v")
del("n", "<leader>h")

map("n", "<leader>jj", "<cmd> Noice dismiss <CR>", { desc = "Dismiss notification" })

-- Obsidian mappings
map("n", "<leader>ot", "<cmd> ObsidianToday <CR>", { desc = "Open today's note" })
map("n", "<leader>ow", "<cmd> ObsidianWorkspace <CR>", { desc = "Open ObsidianWorkspace" })
map("n", "<leader>oy", "<cmd> ObsidianYesterday <CR>", { desc = "Open yesterday's note" })
map("n", "<leader>os", "<cmd> ObsidianSearch <CR>", { desc = "Search for note" })
map("n", "<leader>oq", "<cmd> ObsidianQuickSwitch <CR>", { desc = "Quick switch to different note" })
map("n", "<leader>oo", "<cmd> ObsidianOpen <CR>", { desc = "Open current file in Obsidian" })
map("n", "<leader>op", "<cmd> ObsidianPasteImg <CR>", { desc = "Paste image into Obsidian note" })
map("n", "<leader>onn", "<cmd> ObsidianNew <CR>", { desc = "Create new Obsidian note" })
map("n", "<leader>oit", "<cmd> ObsidianTemplate <CR>", { desc = "Insert template" })
map("n", "<leader>onr", "<cmd> ObsidianNewFromTemplate Research/ <CR>", { desc = "Create new note in Research" })
map(
  "n",
  "<leader>ons",
  "<cmd> ObsidianNewFromTemplate StoryNotes/ <CR>",
  { desc = "Create new Obsidian note in Story" }
)
map(
  "n",
  "<leader>ons",
  "<cmd> ObsidianNewFromTemplate StoryNotes/ <CR>",
  { desc = "Create new Obsidian note in Story" }
)
map("n", "<leader>onm", "<cmd> ObsidianNewFromTemplate Misc/ <CR>", { desc = "Create new Obsidian note in Misc" })

-- Parrot mappings
map("n", "<leader>n", "<cmd> PrtChatNew <CR>", { desc = "New GPT Chat" })
map("n", "<leader>1", "<cmd> PrtChatRespond <CR>", { desc = "Respond to GPT Chat" })
map("n", "<leader>2", "<cmd> PrtChatToggle <CR>", { desc = "Toggle GPT Chat" })
map("v", "<leader>3", "<cmd> '<, '>PrtImplement <CR>", { desc = "Implement selected section" })

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
map({ "v", "n" }, "<leader>ft", custom.format_table, { desc = "Format markdown table" })

-- GitSigns mappings
map("n", "<leader>sh", gitsigns.stage_hunk, { desc = "Stage Hunk" })
map("n", "<leader>us", gitsigns.undo_stage_hunk, { desc = "Undo Stage Hunk" })

-- Diagnostics
map("n", "<leader>qt", "<cmd> Trouble diagnostics toggle <CR>", { desc = "Toggle Trouble" })
map("n", "<leader>qb", "<cmd> Trouble diagnostics toggle filter.buf=0 <CR>", { desc = "Toggle buffer diagnostics" })
map("n", "<leader>qa", "<cmd> TodoTelescope <CR>", { desc = "Toggle TODO list" })

-- Dap UI
map("n", "<leader>du", require("dapui").toggle, { desc = "Toggle Dap UI" })
map("n", "<leader>dn", "<cmd> DapNew <CR>", { desc = "Start new DAP session" })
map("n", "<leader>dc", "<cmd> DapContinue <CR>", { desc = "Continue Dap" })
map("n", "<leader>dt", "<cmd> DapTerminate <CR>", { desc = "Terminate session" })
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle breakpoint" })
map("n", "<leader>dso", "<cmd> DapStepOver <CR>", { desc = "DapStepOver" })
map("n", "<leader>dsi", "<cmd> DapStepInto <CR>", { desc = "DapStepInto" })
map("n", "<leader>dsO", "<cmd> DapStepOut <CR>", { desc = "DapStepOut" })
map("n", "<leader>drr", require("dap").restart, { desc = "Dap restart" })
map("n", "<leader>drl", require("dap").run_last, { desc = "Dap run last" })
map({ "n", "v" }, "<leader>dh", require("dap.ui.widgets").hover, { desc = "Evaluate value under cursor" })
map({ "n", "v" }, "<leader>dp", require("dap.ui.widgets").preview, { desc = "Preview" })
map("n", "<leader>dvf", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.frames)
end, { desc = "View Frames" })
map("n", "<leader>dvs", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.scopes)
end, { desc = "View scopes" })

-- Neotest
map("n", "<leader>tn", "<cmd> Neotest summary <CR>", { desc = "Neotest open summary" })
map("n", "<leader>tr", require("neotest").run.run, { desc = "Neotest run nearest test" })
map("n", "<leader>tw", require("neotest").watch.watch, { desc = "Neotest watch test" })
map("n", "<leader>to", custom.open_test, { desc = "Neotest open output" })
map("n", "<leader>td", custom.debug_nearest_test, { desc = "Neotest debug nearest test" })
map("n", "<leader>tg", require("dap-go").debug_test, { desc = "Debug nearest go test" })

-- Set dark or light themes
map("n", "<leader>sd", custom.set_dark_theme, { desc = "Set dark theme" })
map("n", "<leader>sl", custom.set_light_theme, { desc = "Set light theme" })
