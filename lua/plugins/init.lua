return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },

  -- Overriden NvChad plugin configurations
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = require("configs.overrides").mason,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("configs.overrides").treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = require("configs.overrides").nvimtree,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    opts = require("configs.overrides").telescope,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
      {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "Exafunction/codeium.nvim",
      },
    },
    opts = require("configs.overrides").cmp,
  },

  -- Workspace plugins
  {
    "folke/trouble.nvim",
    cmd = {
      "Trouble",
      "TroubleToggle",
      "TroubleRefresh",
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup()
    end,
  },
  {
    "winston0410/range-highlight.nvim",
    event = "BufEnter",
    dependencies = { "winston0410/cmd-parser.nvim" },
    config = function()
      require("range-highlight").setup()
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require "configs.noice"
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
      require("neoscroll").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    ft = "markdown",
    cmd = {
      "ObsidianOpen",
      "ObsidianNew",
      "ObsidianQuickSwitch",
      "ObsidianToday",
      "ObsidianYesterday",
      "ObsidianTomorrow",
      "ObsidianTemplate",
      "ObsidianSearch",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require "configs.obsidian"
    end,
  },
  {
    "natecraddock/workspaces.nvim",
    cmd = {
      "WorkspacesOpen",
      "WorkspacesAdd",
      "WorkspacesList",
      "WorkspacesDelete",
      "WorkspacesOpenWorkspace",
    },
    config = function()
      require "configs.workspaces"
    end,
  },
  {
    "natecraddock/sessions.nvim",
    cmd = {
      "SessionsSave",
      "SessionsLoad",
      "SessionsStop",
    },
    config = function()
      require "configs.sessions"
    end,
  },

  -- LSP
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup {
        library = {
          plugins = {
            "nvim-dap-ui",
          },
          types = true,
        },
      }
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    cmd = {
      "Lspsaga",
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lspsaga").setup {}
    end,
  },
  {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "LspAttach",
    config = function()
      require("garbage-day").setup {
        excluded_lsp_clients = {
          "gopls",
        },
      }
    end,
  },

  -- Git Tools
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require "configs.octo"
    end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
      "DiffviewFileHistory",
    },
  },
  {
    "FabijanZulj/blame.nvim",
    cmd = { "BlameToggle" },
    config = function()
      require("blame").setup()
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- AI tools
  {
    "Exafunction/codeium.nvim",
    event = "VeryLazy",
    config = function()
      require("codeium").setup {
        enable_chat = true,
      }
    end,
  },
  {
    "robitx/gp.nvim",
    cmd = {
      "GpChatToggle",
      "GpChatNew",
      "GpChatRespond",
      "GpChatFinder",
    },
    config = function()
      require("gp").setup()
    end,
  },

  -- Testing and debugging
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python",
      "leoluz/nvim-dap-go",
    },
    config = function()
      require("dapui").setup()
      require "configs.nvim-dap"
    end,
  },
}
