require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

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
map("n", "<leader>ge", "<cmd> BlameToggle <CR>", { desc = "Toggle git blame" })
map("n", "<leader>dv", "<cmd> DiffviewOpen <CR>", { desc = "Open diffview" })
map("n", "<leader>gl", "<cmd> LazyGit <CR>", { desc = "Open lazygit" })
map("n", "<leader>wl", "<cmd> Telescope workspaces <CR>", { desc = "List workspaces" })
map("n", "<leader>ss", "<cmd> SessionsSave <CR>", { desc = "Save current Session" })

-- Trouble toggle
map("n", "<leader>tq", "<cmd> TroubleToggle quickfix <CR>", { desc = "Show quickfix list" })
map("n", "<leader>q", "<cmd> TroubleToggle document_diagnostics <CR>", { desc = "Show Document Diagnostics" })
map("n", "<leader>tw", "<cmd> TroubleToggle workspace_diagnostics <CR>", { desc = "Show Workspace Diagnostics" })
