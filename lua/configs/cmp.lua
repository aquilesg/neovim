local cmp = require "cmp"
local nvchad_cmp = require "nvchad.configs.cmp"

local custom_cmp_options = {}
local merged_options = vim.tbl_deep_extend("force", nvchad_cmp, custom_cmp_options)
merged_options.mapping["<C-y>"] = cmp.mapping.confirm {
  behavior = cmp.ConfirmBehavior.Insert,
  select = true,
}

return merged_options
