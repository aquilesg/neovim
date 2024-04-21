require("neodev").setup {}
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local on_attach = function()
  local map = vim.keymap.set
  map("n", "K", "<cmd> Lspsaga hover_doc <CR>", { desc = "Show hover doc" })
  map("n", "ca", "<cmd> Lspsaga code_action <CR>", { desc = "Show code action" })
  map("n", "gr", "<cmd> Lspsaga finder <CR>", { desc = "Find references" })
  map("n", "gd", "<cmd> Lspsaga goto_definition <CR>", { desc = "Go to definition" })
  map("n", "<leader>pd", "<cmd> Lspsaga peek_definition <CR>", { desc = "Peek definition" })
  map("n", "<leader>pD", "<cmd> Lspsaga peek_type_definition <CR>", { desc = "Peek type definition" })
  map("n", "<leader>ra", "<cmd> Lspsaga rename <CR>", { desc = "Lsp outline" })
  map("n", "<leader>go", "<cmd> Lspsaga outline <CR>", { desc = "Go to definition" })
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
  "jsonls",
  "pylsp",
  "ruby_ls",
  "sqlls",
  "terraformls",
  "tflint",
  "tsserver",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  local opts = {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if lsp == "sqlls" then
    opts.filetypes = { "sql" }
    opts.root_dir = function(_)
      return vim.loop.cwd()
    end
  end

  if lsp == "pylsp" then
    opts.settings = {
      pylsp = {
        plugins = {
          flake8 = {
            enabled = true,
          },
          pylint = {
            enabled = true,
          },
        },
      },
    }
  end

  lspconfig[lsp].setup(opts)
end
