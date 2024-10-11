CMP = require "cmp"
local options = {
  mapping = {
    ["<C-y>"] = CMP.mapping.confirm {
      behavior = CMP.ConfirmBehavior.Insert,
      select = true,
    },
  },
  sources = {
    { name = "nvim_lsp", group_index = 1 },
    { name = "codeium", group_index = 1 },
    { name = "path", group_index = 1 },
    { name = "buffer", group_index = 1 },
    { name = "lazydev", group_index = 2 },
  },
}

return vim.tbl_deep_extend("force", require "nvchad.configs.cmp", options)
