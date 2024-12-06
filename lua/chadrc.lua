local options = {
  base46 = {
    theme = "everblush",
  },

  ui = {
    cmp = {
      icons_left = true,
      lspkind_text = true,
      style = "atom",
      format_colors = {
        tailwind = false,
        icon = "󱓻",
      },
    },

    telescope = { style = "bordered" },

    statusline = {
      theme = "minimal",
      order = { "mode", "file", "git", "%=", "lsp_msg", "recording", "%=", "diagnostics", "lsp", "cwd" },
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
  },

  lsp = { signature = false },

  cheatsheet = {
    theme = "grid",
    excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" },
  },

  mason = {
    pkgs = {
      "bash-language-server",
      "black",
      "buf",
      "clangd",
      "docker-compose-language-service",
      "dockerfile-language-server",
      "doctoc",
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
      "prettier",
      "pydocstyle",
      "pyright",
      "pylama",
      "ruff",
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

  colorify = {
    enabled = true,
    mode = "virtual",
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
  },
}

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", options, status and chadrc or {})
