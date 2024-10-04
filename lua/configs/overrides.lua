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
    "java",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "mermaid",
    "python",
    "proto",
    "ruby",
    "scala",
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

M.nvimtree = {
  git = {
    enable = true,
    ignore = false,
    timeout = 700,
  },
}

local cmp_ok, cmp = pcall(require, "cmp")

if cmp_ok then
  M.cmp = {
    sources = {
      { name = "nvim_lsp", group_index = 1 },
      { name = "codeium", group_index = 1 },
      { name = "path", group_index = 1 },
      { name = "lazydev", group_index = 2 },
      {
        name = "buffer",
        option = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end,
        },
        group_index = 1,
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
