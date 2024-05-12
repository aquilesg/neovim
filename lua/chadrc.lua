-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "ayu_dark",
  cmp = {
    style = "flat_dark",
  },
  nvdash = {
    load_on_startup = true,
  },
  lsp_semantic_tokens = false,

  statusline = {
    theme = "default",
    separator_style = "arrow",
  },
}

return M
