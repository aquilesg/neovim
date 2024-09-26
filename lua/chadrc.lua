local M = {}

M.ui = {
  theme = "blossom_light",
  cmp = {
    style = "atom_colored",
  },

  statusline = {
    theme = "minimal",
    order = { "mode", "file", "git", "%=", "lsp_msg", "recording", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    separator_style = "round",
    modules = {
      recording = function()
        local recording = vim.fn.reg_recording()
        if recording ~= "" then
          vim.cmd "hi RecordingHighlight guifg=#ffffff guibg=#ff0000 gui=bold"
          return "%#RecordingHighlight# Recording: @" .. recording .. " %*"
        end
      end,
    },
  },
  nvdash = {
    load_on_startup = true,
  },
  mason = {
    cmd = true,
    pkgs = {
      "bash-language-server",
      "buf",
      "clangd",
      "docker-compose-language-service",
      "dockerfile-language-server",
      "flake8",
      "gopls",
      "gofumpt",
      "google-java-format",
      "graphql-language-service-cli",
      "harper-ls",
      "html-lsp",
      "jdtls",
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
  },
}

return M
