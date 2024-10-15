require("codecompanion").setup {
  display = {
    diff = {
      provider = "mini_diff",
    },
  },
  strategies = {
    chat = {
      adapter = "anthropic",
    },
    agent = {
      adapter = "anthropic",
    },
  },
  adapters = {
    openai = function()
      return require("codecompanion.adapters").extend("openai", {
        env = {
          api_key = os.getenv "OPENAI_API_KEY",
        },
      })
    end,
    anthropic = function()
      return require("codecompanion.adapters").extend("anthropic", {
        env = {
          api_key = os.getenv "ANTHROPIC_API_KEY",
        },
      })
    end,
  },
}

local map = vim.keymap.set
map(
  "n",
  "<C-a>",
  "<cmd>CodeCompanionActions<cr>",
  { noremap = true, silent = true, desc = "Open CodeCompanionActions" }
)
map(
  "v",
  "<C-a>",
  "<cmd>CodeCompanionActions<cr>",
  { noremap = true, silent = true, desc = "Open CodeCompanionActions" }
)
map(
  "n",
  "<LocalLeader>a",
  "<cmd>CodeCompanionChat Toggle<cr>",
  { noremap = true, silent = true, desc = "Toggle CodeCompanionChat" }
)
map(
  "v",
  "<LocalLeader>a",
  "<cmd>CodeCompanionChat Toggle<cr>",
  { noremap = true, silent = true, desc = "Toggle CodeCompanionChat" }
)
map(
  "v",
  "ga",
  "<cmd>CodeCompanionChat Add<cr>",
  { noremap = true, silent = true, desc = "Add selected visual section to chat" }
)

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd [[cab cc CodeCompanion]]
