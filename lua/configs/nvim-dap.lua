local dap = require "dap"
local M = {}

-- Configure python debugger
require("dap-python").setup "~/.virtualenvs/debugpy/bin/python"

-- Configure go debugger
-- Setup adapters
require("dap-go").setup {
  delve = {
    initialize_timeout_sec = 45,
  },
  dap_configurations = {
    {
      type = "go",
      name = "Debug (Build Flags)",
      request = "launch",
      program = "${file}",
      buildFlags = require("dap-go").get_build_flags,
    },
  },
}

dap.configurations.lua = {
  {
    type = "nlua",
    request = "attach",
    name = "Attach to running Neovim instance",
  },
}

dap.adapters.nlua = function(callback, config)
  callback { type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 }
end

local dapui = require "dapui"
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

return M
