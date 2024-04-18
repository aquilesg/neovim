require("sessions").setup({
  events = {
    "BufEnter",
    "BufRead",
    "BufAdd",
    "BufHidden",
  },
  session_filepath = vim.fn.stdpath("data") .. "/sessions",
  absolute = true,
})
