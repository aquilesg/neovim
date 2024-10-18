local cmp = require "cmp"
local nvchad_cmp = require "nvchad.configs.cmp"

local custom_cmp_options = {
  sources = vim.list_extend(nvchad_cmp.sources, { name = "git" }),
}

local merged_options = vim.tbl_deep_extend("force", nvchad_cmp, custom_cmp_options)
merged_options.mapping["<C-y>"] = cmp.mapping.confirm {
  behavior = cmp.ConfirmBehavior.Insert,
  select = true,
}
merged_options.mapping["<CR>"] = cmp.config.disable

return merged_options
