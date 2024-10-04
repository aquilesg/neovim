local M = {}

M.ui = {
  statusline = {
    theme = "minimal",
    order = { "mode", "file", "git", "%=", "lsp_msg", "recording", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    separator_style = "round",
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
  nvdash = {
    load_on_startup = true,
  },
}

return M
