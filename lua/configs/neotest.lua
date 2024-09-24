require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
    require("neotest-go")({
    })
  },
})


-- Neotest
local map = vim.keymap.set
local custom = require "custom_functions"
map("n", "<leader>tn", "<cmd> Neotest summary <CR>", { desc = "Neotest open summary" })
map("n", "<leader>tr", require("neotest").run.run, { desc = "Neotest run nearest test" })
map("n", "<leader>tw", require("neotest").watch.watch, { desc = "Neotest watch test" })
map("n", "<leader>to", custom.open_test, { desc = "Neotest open output" })
map("n", "<leader>td", custom.debug_nearest_test, { desc = "Neotest debug nearest test" })
map("n", "<leader>tg", require("dap-go").debug_test, { desc = "Debug nearest go test" })

