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
map("n", "<leader>dv", "<cmd> DiffviewOpen <CR>", { desc = "Open diffview" })
map("n", "<leader>gl", "<cmd> LazyGit <CR>", { desc = "Open lazygit" })
map("n", "<leader>gn", "<cmd> Neogit <CR>", { desc = "Open Neogit" })
map("n", "<leader>wl", "<cmd> Telescope workspaces <CR>", { desc = "List workspaces" })
map("n", "<leader>ss", "<cmd> SessionsSave <CR>", { desc = "Save current Session" })
map("n", "<leader>o1", "<cmd> Octo pr create <CR>", { desc = "Create new PR" })
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
map("n", "<leader>qf", "<cmd> Trouble qflist toggle <CR>", { desc = "Toggle quickfix list" })

-- Dap UI
map("n", "<F1>", require("dapui").toggle, { desc = "Toggle Dap UI" })
map("n", "<F2>", "<cmd> DapNew <CR>", { desc = "Start new DAP session" })
map("n", "<F3>", "<cmd> DapContinue <CR>", { desc = "Continue Dap" })
map("n", "<F4>", "<cmd> DapTerminate <CR>", { desc = "Start new DAP session" })

map("n", "<F5>", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle breakpoint" })
map("n", "<F6>", "<cmd> DapStepOver <CR>", { desc = "DapStepOver" })
map("n", "<F7>", "<cmd> DapStepInto <CR>", { desc = "DapStepInto" })
map("n", "<F8>", "<cmd> DapStepOut <CR>", { desc = "DapStepOut" })

-- Neotest
map("n", "<leader>tn", "<cmd> Neotest summary <CR>", { desc = "Neotest open summary" })
map("n", "<leader>tr", require("neotest").run.run, { desc = "Neotest run nearest test" })
map("n", "<leader>tw", require("neotest").watch.watch, { desc = "Neotest watch test" })
map("n", "<leader>to", custom.open_test, { desc = "Neotest open output" })
map("n", "<leader>td", custom.debug_nearest_test, { desc = "Neotest debug nearest test" })
