require("noice").setup {
  lsp = {
    override = {
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = true,
  },
  views = {
    cmdline_popup = {
      border = {
        style = "none",
        padding = { 2, 3 },
      },
      filter_options = {},
      win_options = {
        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      },
    },
  },
}
