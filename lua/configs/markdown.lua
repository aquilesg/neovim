require("render-markdown").setup {
  callout = {
    done = { raw = "[!Done]", rendered = "󰄬 Done", highlight = "RenderMarkdownSuccess" },
    info = { raw = "[!Info]", rendered = "󰋽 Info", highlight = "RenderMarkdownInfo" },
    note = { raw = "[!Note]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
    tip = { raw = "[!Tip]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess" },
    important = { raw = "[!Important]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint" },
    warning = { raw = "[!Warning]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
    caution = { raw = "[!Caution]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError" },
    -- Obsidian: https://help.a.md/Editing+and+formatting/Callouts
    abstract = { raw = "[!Abstract]", rendered = "󰨸 Abstract", highlight = "RenderMarkdownInfo" },
    todo = { raw = "[!Todo]", rendered = "󰗡 Todo", highlight = "RenderMarkdownInfo" },
    success = { raw = "[!Success]", rendered = "󰄬 Success", highlight = "RenderMarkdownSuccess" },
    question = { raw = "[!Question]", rendered = "󰘥 Question", highlight = "RenderMarkdownWarn" },
    failure = { raw = "[!Failure]", rendered = "󰅖 Failure", highlight = "RenderMarkdownError" },
    danger = { raw = "[!Danger]", rendered = "󱐌 Danger", highlight = "RenderMarkdownError" },
    bug = { raw = "[!Bug]", rendered = "󰨰 Bug", highlight = "RenderMarkdownError" },
    example = { raw = "[!Example]", rendered = "󰉹 Example", highlight = "RenderMarkdownHint" },
    quote = { raw = "[!Quote]", rendered = "󱆨 Quote", highlight = "RenderMarkdownQuote" },
  },
}
