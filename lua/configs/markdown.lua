require("render-markdown").setup {
  callout = {
    done = { raw = "[!Done]", rendered = "󰄬 Done", highlight = "RenderMarkdownSuccess" },
    info = { raw = "[!info]", rendered = "󰋽 Info", highlight = "RenderMarkdownInfo" },
    time = { raw = "[!timestamp]", rendered = " Timestamp", highlight = "RenderMarkdownInfo" },
  },
  pipe_table = { preset = "heavy" },
}
