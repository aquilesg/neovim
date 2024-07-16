local M = {}

M.ui = {
  theme = "rosepine-dawn",
  theme_toggle = { "rosepine", "rosepine-dawn" },
  cmp = {
    style = "atom_colored",
  },

  statusline = {
    theme = "minimal",
    order = { "mode", "file", "git", "%=", "lsp_msg","recording", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      recording = function()
        local recording = vim.fn.reg_recording()
        if recording ~= "" then
          vim.cmd "hi RecordingHighlight guifg=#ffffff guibg=#ff0000 gui=bold"
          return "%#RecordingHighlight# Recording: @" .. recording .. " %*"
        end
      end,
    },
  },
}

return M
