

---------
-- DAP --
---------

require("mason-nvim-dap").setup({
  ensure_installed = { "python", "javadbg" },
  automatic_installation = true,
  handlers = {},
})

local dap = require("dap")
local dapui = require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"]=function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"]=function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"]=function()
  dapui.close()
end

vim.fn.sign_define('DapBreakpoint',{ text ='🔴' })
vim.fn.sign_define('DapStopped',{ text ='➡️' })

vim.keymap.set('n', '<F5>', require 'dap'.continue)
vim.keymap.set('n', '<F8>', require 'dap'.terminate)
vim.keymap.set('n', '<F10>', require 'dap'.step_over)
vim.keymap.set('n', '<F11>', require 'dap'.step_into)
vim.keymap.set('n', '<F12>', require 'dap'.step_out)
vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)

require("nvim-dap-virtual-text").setup({})
