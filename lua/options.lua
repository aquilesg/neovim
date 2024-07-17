require "nvchad.options"

-- Terraform file detection
vim.cmd [[silent! autocmd! filetype detect BufRead,BufNewFile *.tf]]
vim.cmd [[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]]
vim.cmd [[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]]
vim.cmd [[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]]
vim.cmd [[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]]

-- Ansible file detection
vim.cmd [[silent! autocmd! filetype detect BufRead,BufNewFile *.yaml.ansible]]
vim.cmd [[autocmd BufRead,BufNewFile *.yaml.ansible set filetype=yaml.ansible]]

-- Set no wrap by default; i hate that thing
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
