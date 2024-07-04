require("lspsaga").setup({
  diagnostic = {
    show_code_action = false,
    diagnostic_only_current = false,
  },
  outline = {
    layout = 'float'
  },
  ui = {
    enable = true;
    sign = false;
    virtual_text = false;
  },
})

-- Disable vim diagnostic text
vim.diagnostic.config({
  virutal_text = false,
})
