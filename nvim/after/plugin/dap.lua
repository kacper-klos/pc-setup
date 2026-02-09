local mason_dap = require("mason-nvim-dap")
local dap = require("dap")
local ui = require("dapui")
require("nvim-dap-virtual-text").setup()
require("dap-python").setup("uv")

mason_dap.setup({
	ensure_installed = { "python", "cppdbg" },
	automatic_installation = true,
	handlers = {
		function(config)
			require("mason-nvim-dap").default_setup(config)
		end,
        python = function(config)
            -- Makes sure python use dap-python config
        end,
	},
})

for _, config in ipairs(dap.configurations.python) do
    -- Makes sure python dap has the same path as if it was launched with python
    config.cwd = vim.fn.getcwd()
end

ui.setup()

vim.fn.sign_define("DapBreakpoint", { text = "🔴" })

dap.listeners.before.attach.dapui_config = function()
	ui.open()
end
dap.listeners.before.launch.dapui_config = function()
	ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	ui.close()
end

vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<Leader>dl", dap.list_breakpoints, { desc = "List Breakpoints" })
vim.keymap.set("n", "<Leader>ds", dap.continue, { desc = "Start/Continue Debugging" })
vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "Setp into" })
vim.keymap.set("n", "<Leader>do", dap.step_over, { desc = "Setp over" })
vim.keymap.set("n", "<Leader>dt", dap.terminate, { desc = "Terminate" })
vim.keymap.set("n", "<Leader>de", ui.eval, { desc = "Eval" })
