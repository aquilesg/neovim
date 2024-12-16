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
    timeout = 1000,
  },
}

return M
