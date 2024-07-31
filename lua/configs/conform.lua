local slow_format_filetypes = {
  "markdown",
  "json",
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

    return { timeout_ms = 500, lsp_format = "fallback" }, on_format
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
    python = { "black", "autopep8" },
    bash = { "shfmt" },
    json = { "jq" },
    markdown = { "prettier", "markdown-toc" },
  },
}
