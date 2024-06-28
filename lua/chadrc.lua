-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "ashes",
  theme_toggle = { "ashes", "material_lighter" },
  cmp = {
    style = "atom_colored",
  },

  statusline = {
    theme = "default",
  },
}

return M
