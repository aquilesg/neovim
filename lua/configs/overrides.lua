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
    "python",
    "ruby",
    "sql",
    "terraform",
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
    "bash-language-server",
    "clangd",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "flake8",
    "gopls",
    "gofumpt",
    "graphql-language-service-cli",
    "harper-ls",
    "html-lsp",
    "json-lsp",
    "lua-language-server",
    "markdown-toc",
    "prettier",
    "pyright",
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
      { name = "nvim_lsp", priority = 400, group_index = 1 },
      { name = "codeium", priority = 400, group_index = 1 },
      { name = "lazydev", priority = 50, group_index = 2 },
      { name = "path", priority = 50, group_index = 2 },
      {
        name = "buffer",
        option = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end,
        },
        group_index = 2,
      },
      { name = "git" },
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
