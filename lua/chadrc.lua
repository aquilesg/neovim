local M = {}

M.ui = {
  theme = "flexoki-light",
  theme_toggle = { "flexoki-light", "flexoki-light" },
  cmp = {
    style = "atom_colored",
  },

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
