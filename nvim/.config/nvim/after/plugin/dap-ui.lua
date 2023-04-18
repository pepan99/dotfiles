local dap, dapui = require("dap"), require("dapui")
dapui.setup()
--vim.keymap.set('n', '<leader>do', function() require("dapui").open() end)
--vim.keymap.set('n', '<leader>dC', function() require("dapui").close() end)
-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dapui.open()
-- end
dap.listeners.before.event_terminated["dapui_config"] =
    function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
