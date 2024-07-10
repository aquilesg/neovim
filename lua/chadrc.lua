-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "flex-light",
  theme_toggle = { "yoru", "flex-light" },
  cmp = {
    style = "atom_colored",
  },

  statusline = {
    theme = "default",
  },
}

return M
