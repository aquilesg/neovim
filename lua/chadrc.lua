local options = {
  base46 = {
    theme = "rosepine-dawn",
    hl_add = {},
    hl_override = {},
    integrations = {},
    changed_themes = {},
    transparency = false,
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
      theme = "default",
      order = { "mode", "file", "git", "%=", "lsp_msg", "recording", "%=", "diagnostics", "lsp", "cwd", "cursor" },
      separator_style = "default",
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

  nvdash = {
    load_on_startup = true,
  },

  lsp = { signature = true },

  cheatsheet = {
    theme = "grid",
    excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" },
  },

  mason = {
    pkgs = {
      "bash-language-server",
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

  colorify = {
    enabled = true,
    mode = "virtual",
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
  },
}

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", options, status and chadrc or {})
