local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local on_attach = function()
  local map = vim.keymap.set
  map("n", "K", "<cmd> Lspsaga hover_doc <CR>", { desc = "Show hover doc" })
  map("n", "gr", "<cmd> Lspsaga finder <CR>", { desc = "Find references" })
  map("n", "gd", "<cmd> Lspsaga goto_definition <CR>", { desc = "Go to definition" })
  map("n", "<leader>pd", "<cmd> Lspsaga peek_definition <CR>", { desc = "Peek definition" })
  map("n", "<leader>pD", "<cmd> Lspsaga peek_type_definition <CR>", { desc = "Peek type definition" })
  map("n", "<leader>ra", "<cmd> Lspsaga rename <CR>", { desc = "Lsp outline" })
  map("n", "ca", require("actions-preview").code_actions, { desc = "Show code actions" })
end

local lspconfig = require "lspconfig"
local servers = {
  "arduino_language_server",
  "ansiblels",
  "lua_ls",
  "bashls",
  "clangd",
  "dockerls",
  "docker_compose_language_service",
  "gopls",
  "graphql",
  "harper_ls",
  "html",
  "jdtls",
  "jsonls",
  "pyright",
  "sqlls",
  "terraformls",
  "tflint",
  "ts_ls",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  local opts = {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if lsp == "harper_ls" then
    opts.settings = {
      ["harper-ls"] = {
        userDictPath = "~/dict.txt",
      },
    }
  end

  if lsp == "clangd" then
    opts.filetypes = { "c", "cpp", "objc", "objcpp" }
  end

  if lsp == "graphql" then
    opts.filetypes = { "graphql" }
    opts.root_dir = lspconfig.util.root_pattern(".git", ".graphqlrc*", ".graphql.config.*", "graphql.config.*")
  end

  lspconfig[lsp].setup(opts)
end

-- Terraform file detection
vim.cmd [[silent! autocmd! filetype detect BufRead,BufNewFile *.tf]]
vim.cmd [[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]]
vim.cmd [[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]]
vim.cmd [[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]]
vim.cmd [[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]]

-- Ansible file detection
vim.cmd [[silent! autocmd! filetype detect BufRead,BufNewFile *.yaml.ansible]]
vim.cmd [[autocmd BufRead,BufNewFile *.yaml.ansible set filetype=yaml.ansible]]
