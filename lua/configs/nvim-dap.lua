local dap = require "dap"
local M = {}

-- Configure python debugger
require("dap-python").setup "~/.virtualenvs/debugpy/bin/python"

-- Configure go debugger
-- Setup adapters
require("dap-go").setup {
  delve = {
    initialize_timeout_sec = 30,
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

dap.adapters.go = function(callback, _)
  local stdout = vim.loop.new_pipe(false)
  local handle
  local pid_or_err
  local port = 38697
  local opts = {
    stdio = { nil, stdout },
    args = { "dap", "-l", "127.0.0.1:" .. port },
    detached = true,
  }
  handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
    stdout:close()
    handle:close()
    if code ~= 0 then
      print("dlv exited with code", code)
    end
  end)
  assert(handle, "Error running dlv: " .. tostring(pid_or_err))
  stdout:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      vim.schedule(function()
        require("dap.repl").append(chunk)
      end)
    end
  end)

  vim.defer_fn(function()
    callback { type = "server", host = "127.0.0.1", port = port }
  end, 100)
end

dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}",
  },
  {
    type = "go",
    name = "Debug test",
    request = "launch",
    mode = "test",
    program = "${file}",
  },
}

function M.SetDAPBreakpoint()
  local condition = vim.fn.input "Condition: "
  local hit_condition = vim.fn.input "Hit Condition: "
  local log_message = vim.fn.input "Log Message: "

  condition = (condition ~= "") and condition or nil
  hit_condition = (hit_condition ~= "") and hit_condition or nil
  log_message = (log_message ~= "") and log_message or nil

  dap.set_breakpoint(condition, hit_condition, log_message)

  print "Breakpoint set"
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
