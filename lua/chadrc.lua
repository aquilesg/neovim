-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "github_light",
  cmp = {
    style = "flat_dark",
  },
  lsp_semantic_tokens = false,

  statusline = {
    theme = "default",
  },
}

return M
