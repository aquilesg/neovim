require("lspsaga").setup({
  diagnostic = {
    show_code_action = false,
    diagnostic_only_current = true,
  },
  outline = {
    layout = 'float'
  },
  ui = {
    enable = false;
    sign = false;
    virtual_text = false;
  },
})

-- Disable vim diagnostic text
vim.diagnostic.config({
  virutal_text = false,
})
