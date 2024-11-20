local map = vim.keymap.set
local slow_format_filetypes = {
  "autopep8",
  "autoflake",
  "black",
  "ruff",
  "json",
  "markdown",
}
require("conform").setup {
  format_on_save = function(bufnr)
    if slow_format_filetypes[vim.bo[bufnr].filetype] then
      return
    end
    local function on_format(err)
      if err and err:match "timeout$" then
        slow_format_filetypes[vim.bo[bufnr].filetype] = true
      end
    end

    return { timeout_ms = 1000, lsp_format = "fallback" }, on_format
  end,

  format_after_save = function(bufnr)
    if not slow_format_filetypes[vim.bo[bufnr].filetype] then
      return
    end
    return { lsp_format = "fallback" }
  end,

  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofumpt" },
    python = { "black", "ruff" },
    bash = { "shfmt" },
    java = { "google-java-format" },
    json = { "jq" },
    markdown = { "doctoc", "markdownlint" },
  },
  formatters = {
    doctoc = {
      prepend_args = { "--update-only", "--github" },
    },
  },
}

map({ "n", "v" }, "<leader>fc", function()
  require("conform").format({ async = true }, function(err)
    if not err then
      local mode = vim.api.nvim_get_mode().mode
      if vim.startswith(string.lower(mode), "v") then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
      end
    end
  end)
end, { desc = "Format code" })

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format { async = true, lsp_format = "fallback", range = range }
end, { range = true })
