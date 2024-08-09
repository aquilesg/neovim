local M = {}

function M.format_table()
  local buf = vim.api.nvim_get_current_buf()
  local start_pos = vim.api.nvim_buf_get_mark(buf, "<")
  local end_pos = vim.api.nvim_buf_get_mark(buf, ">")
  local lines = vim.api.nvim_buf_get_lines(buf, start_pos[1] - 1, end_pos[1], false)
  if #lines == 0 then
    return
  end

  local table_data = {}
  local col_widths = {}

  for _, line in ipairs(lines) do
    local columns = {}
    for col in line:gmatch "[^|]+" do
      table.insert(columns, col:match "^%s*(.-)%s*$") -- Trim whitespace
    end
    table.insert(table_data, columns)

    for col_index, col_text in ipairs(columns) do
      col_widths[col_index] = math.max(col_widths[col_index] or 0, #col_text)
    end
  end

  local function generate_separator_line()
    local separator_cols = {}
    for i, width in ipairs(col_widths) do
      table.insert(separator_cols, string.rep("-", width))
    end
    return "| " .. table.concat(separator_cols, " | ") .. " |"
  end

  local function format_line(columns)
    local formatted_cols = {}
    for i, col_text in ipairs(columns) do
      table.insert(formatted_cols, col_text .. string.rep(" ", col_widths[i] - #col_text))
    end
    return "| " .. table.concat(formatted_cols, " | ") .. " |"
  end

  local formatted_lines = {}

  table.insert(formatted_lines, format_line(table_data[1]))
  table.insert(formatted_lines, generate_separator_line())

  for i = 3, #table_data do
    table.insert(formatted_lines, format_line(table_data[i]))
  end

  vim.api.nvim_buf_set_lines(buf, start_pos[1] - 1, end_pos[1], false, formatted_lines)
end

function M.insert_timestamp()
  local timestamp = tostring(os.date "> [!Timestamp]- %Y-%m-%d:%H:%M")
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_lines(0, row, row, false, { "" })
  vim.api.nvim_buf_set_text(0, row, 0, row, 0, { timestamp })
end

function M.debug_nearest_test()
  require("neotest").run.run { strategy = "dap" }
end

function M.open_test()
  require("neotest").output.open { enter = true }
end

function close_unnamed_buffers()
  -- Get a list of all buffers
  local buffers = vim.api.nvim_list_bufs()

  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_get_name(buf) == "" then
      if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end
end

function M.set_dark_theme()
  vim.g.background = "dark"
  vim.cmd "Lazy reload tiny-inline-diagnostic.nvim"
  close_unnamed_buffers()
  vim.cmd "bufdo e"
end

function M.set_light_theme()
  vim.g.background = "light"
  vim.cmd "Lazy reload tiny-inline-diagnostic.nvim"
  close_unnamed_buffers()
  vim.cmd "bufdo e"
end

function M.toggle_diffview()
  if next(require("diffview.lib").views) == nil then
    vim.cmd "DiffviewOpen"
  else
    vim.cmd "DiffviewClose"
  end
end
return M
