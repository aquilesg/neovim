require("workspaces").setup({
  hooks = {
    open_pre = {
      "SessionsStop",
      "silent %bdelete!",
    },
    open = function()
      require("sessions").load(nil, { silent = true })
      require("nvim-tree.api").tree.toggle()
      vim.api.nvim_command('windo wincmd =')
    end,
  },
  cd_type = "global",
})
