local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "dockerfile",
    "go",
    "hcl",
    "html",
    "graphql",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "mermaid",
    "terraform",
    "sql",
    "vim",
    "vimdoc",
    "yaml",
  },
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
}

M.telescope = {
  pickers = {
    live_grep = {
      file_ignore_patterns = { "node_modules", ".git", ".venv" },
      additional_args = function(_)
        return { "--hidden" }
      end,
    },
    find_files = {
      file_ignore_patterns = { "node_modules", ".git", ".venv" },
      hidden = true,
    },
    extensions_list = {
      "workspaces",
      "live_grep_args",
    },
  },
}

M.mason = {
  ensure_installed = {
    "autopep8",
    "bash-language-server",
    "black",
    "clangd",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "gopls",
    "gofumpt",
    "graphql-language-service-cli",
    "html-lsp",
    "json-lsp",
    "lua-language-server",
    "markdown-toc",
    "prettier",
    "python-lsp-server",
    "pylama",
    "shellcheck",
    "shfmt",
    "terraform-ls",
    "tflint",
    "stylua",
    "sqlls",
    "typescript-language-server",
    "yaml-language-server",
  },
}

M.nvimtree = {
  filters = {
    git_ignored = false,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

local cmp_ok, cmp = pcall(require, "cmp")

if cmp_ok then
  M.cmp = {
    sources = {
      { name = "nvim_lsp", priority = 400 },
      { name = "codeium", priority = 75 },
      { name = "lazydev", priority = 50 },
      { name = "path" },
      { name = "buffer" },
    },
    mapping = {
      ["<Tab>"] = cmp.mapping.complete(),
      ["<C-y>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      ["<CR>"] = cmp.config.disable,
    },
    preselect = cmp.PreselectMode.None,
  }
end

return M
