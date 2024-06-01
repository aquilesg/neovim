require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local gitsigns = require "gitsigns"

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
map("n", "<leader>gn", "<cmd> Neogit <CR>", { desc = "Open Neogit" })
map("n", "<leader>wl", "<cmd> Telescope workspaces <CR>", { desc = "List workspaces" })
map("n", "<leader>ss", "<cmd> SessionsSave <CR>", { desc = "Save current Session" })
map("n", "<leader>ts", function()
  local timestamp = tostring(os.date "%Y-%m-%d:%H:%M:%S -> ")
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_lines(0, row, row, false, { "" })
  vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
  vim.api.nvim_buf_set_text(0, row, 0, row, 0, { timestamp })
  vim.cmd "startinsert"
end, { desc = "Insert timestamp" })
map("v", "<leader>ft", function()
  -- Get the visual selection
  local bufnr = vim.api.nvim_get_current_buf()
  local start_mark = vim.api.nvim_buf_get_mark(bufnr, "<")
  local end_mark = vim.api.nvim_buf_get_mark(bufnr, ">")

  if start_mark[1] > end_mark[1] or (start_mark[1] == end_mark[1] and start_mark[2] > end_mark[2]) then
    start_mark, end_mark = end_mark, start_mark
  end

  local start_row, start_col = unpack(start_mark)
  local end_row, end_col = unpack(end_mark)
  local lines = vim.api.nvim_buf_get_lines(bufnr, start_row - 1, end_row, false)

  -- Break the lines into cells
  local table_data = {}
  for _, line in ipairs(lines) do
    -- Remove leading and trailing pipes and spaces, then split the line into cells
    local row = {}
    for cell in line:gmatch "([^|]+)" do
      table.insert(row, vim.trim(cell))
    end
    if #row > 0 then
      table.insert(table_data, row)
    end
  end

  -- Calculate column widths
  local col_widths = {}
  for _, row in ipairs(table_data) do
    for col_idx, cell in ipairs(row) do
      col_widths[col_idx] = math.max(col_widths[col_idx] or 0, #cell)
    end
  end

  -- Generate dashed separator
  local separator_cells = {}
  for _, width in ipairs(col_widths) do
    table.insert(separator_cells, string.rep("-", width))
  end
  local separator = "| " .. table.concat(separator_cells, " | ") .. " |"

  -- Prepare formatted lines
  local formatted_lines = {}
  for i, row in ipairs(table_data) do
    local formatted_cells = {}
    for col_idx, cell in ipairs(row) do
      table.insert(formatted_cells, string.format("%-" .. col_widths[col_idx] .. "s", cell))
    end
    table.insert(formatted_lines, "| " .. table.concat(formatted_cells, " | ") .. " |")

    -- Insert the separator line after the header row
    if i == 1 then
      table.insert(formatted_lines, 2, separator)
    end
  end

  -- Replace the lines in the buffer with the formatted table
  vim.api.nvim_buf_set_lines(bufnr, start_row - 1, end_row, false, formatted_lines)
end, { desc = "Format markdown table" })

-- GitSigns mappings
map("n", "<leader>sh", gitsigns.stage_hunk, { desc = "Stage Hunk" })
map("n", "<leader>us", gitsigns.undo_stage_hunk, { desc = "Undo Stage Hunk" })

-- Trouble toggle
map("n", "<leader>tq", "<cmd> TroubleToggle quickfix <CR>", { desc = "Show quickfix list" })
map("n", "<leader>q", "<cmd> TroubleToggle document_diagnostics <CR>", { desc = "Show Document Diagnostics" })
map("n", "<leader>tw", "<cmd> TroubleToggle workspace_diagnostics <CR>", { desc = "Show Workspace Diagnostics" })
