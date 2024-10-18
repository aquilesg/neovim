require "nvchad.options"

vim.opt.wrap = false
vim.opt.conceallevel = 2

-- Hide commandline
vim.opt.cmdheight = 0

-- Disable vim diagnostic text
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.diagnostic.config {
      virtual_text = false,
    }
  end,
})

-- Adjust padding on enter and load
vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
  callback = function()
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    if not normal.bg then
      return
    end
    io.write(string.format("\027]11;#%06x\027\\", normal.bg))
  end,
})

vim.api.nvim_create_autocmd("UILeave", {
  callback = function()
    io.write "\027]111\027\\"
  end,
})
