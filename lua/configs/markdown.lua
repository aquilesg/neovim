require("render-markdown").setup {
  callout = {
    done = { raw = "[!Done]", rendered = "󰄬 Done", highlight = "RenderMarkdownSuccess" },
    info = { raw = "[!info]", rendered = "󰋽 Info", highlight = "RenderMarkdownInfo" },
    time = { raw = "[!timestamp]", rendered = " Timestamp", highlight = "RenderMarkdownInfo" },
  },
  checkbox = {
    custom = {
      todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
      follow_up = { raw = "[>]", rendered = " ", highlight = "RenderMarkdownTodo" },
      canceled = { raw = "[~]", rendered = "󰰱 ", highlight = "RenderMarkdownTodo" },
      important = { raw = "[!]", rendered = " ", highlight = "RenderMarkdownTodo" },
    },
  },
  pipe_table = { preset = "heavy" },
}
