local cmp = require "cmp"
local nvchad_cmp = require "nvchad.configs.cmp"

nvchad_cmp.mapping["<C-y>"] = cmp.mapping.confirm {
  behavior = cmp.ConfirmBehavior.Insert,
  select = true,
}
nvchad_cmp.mapping["<CR>"] = cmp.config.disable

return nvchad_cmp
