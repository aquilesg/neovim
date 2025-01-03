local M = {}

function M.insert_timestamp()
  local timestamp = tostring(os.date "> [!Timestamp] %Y-%m-%d %H:%M:%S")
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
  close_unnamed_buffers()
  vim.g.background = "dark"
  vim.cmd "Lazy reload tiny-inline-diagnostic.nvim"
  vim.cmd "Lazy reload markdown.nvim"
  vim.cmd "Lazy reload drop.nvim"
  vim.cmd "bufdo e"
end

function M.set_light_theme()
  close_unnamed_buffers()
  vim.g.background = "light"
  vim.cmd "Lazy reload tiny-inline-diagnostic.nvim"
  vim.cmd "Lazy reload markdown.nvim"
  vim.cmd "Lazy reload drop.nvim"
  vim.cmd "bufdo e"
end

function M.toggle_diffview()
  if next(require("diffview.lib").views) == nil then
    vim.cmd "DiffviewOpen"
  else
    vim.cmd "DiffviewClose"
  end
end

function M.load_test_suite()
  vim.cmd "Lazy load nvim-dap-ui"
  vim.cmd "Lazy load neotest"
end

function M.open_lazygit()
  local snacks = require "snacks"
  snacks.lazygit.open()
end

-- Added here so I don't load telescope on default
function M.find_files()
  local telescope_builtin = require "telescope.builtin"
  telescope_builtin.find_files { hidden = true, no_ignore = true }
end

function M.livegrep()
  local telescope = require "telescope"
  telescope.extensions.live_grep_args.live_grep_args()
end

return M
