--
-- nvim-dap
--
-- дебагер
-- https://github.com/mfussenegger/nvim-dap
--
--
-- nvim-dap-ui
--
-- ui для дебагера
-- https://github.com/rcarriga/nvim-dap-ui
--
return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap_status, dap = pcall(require, "dap")

		if not dap_status then
			-- print("Not found nvim-dap!")
			return
		end

		local widgets = require("dap.ui.widgets")

		vim.keymap.set("n", "<Leader>dt", function()
			dap.toggle_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>dc", function()
			dap.continue()
		end)

		vim.keymap.set("n", "<F5>", function()
			dap.continue()
		end)
		vim.keymap.set("n", "<F10>", function()
			dap.step_over()
		end)
		vim.keymap.set("n", "<F11>", function()
			dap.step_into()
		end)
		vim.keymap.set("n", "<F12>", function()
			dap.step_out()
		end)
		vim.keymap.set("n", "<Leader>b", function()
			dap.toggle_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>B", function()
			dap.set_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>lp", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end)
		vim.keymap.set("n", "<Leader>dr", function()
			dap.repl.open()
		end)
		vim.keymap.set("n", "<Leader>dl", function()
			dap.run_last()
		end)
		vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
			widgets.hover()
		end)
		vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
			widgets.preview()
		end)
		vim.keymap.set("n", "<Leader>df", function()
			widgets.centered_float(widgets.frames)
		end)
		vim.keymap.set("n", "<Leader>ds", function()
			widgets.centered_float(widgets.scopes)
		end)

		local dapui_status, dapui = pcall(require, "dap-ui")

		if not dapui_status then
			-- print("Not found nvim-dap-ui!")
			return
		end

    -- dapui.setup()

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


		-- dap.configurations.python = {
		-- 	{
		-- 		-- The first three options are required by nvim-dap
		-- 		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
		-- 		request = "launch",
		-- 		name = "Launch file qqqqqq",

		-- 		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

		-- 		program = "${file}", -- This configuration will launch the current file if used.
		-- 		pythonPath = function()
		-- 			-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
		-- 			-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
		-- 			-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
		-- 			local cwd = vim.fn.getcwd()

		-- 			--  TODO
		-- 			-- local command = os.getenv("VIRTUAL_ENV") .. "/bin/python"

		-- 			-- if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
		-- 			-- 	return cwd .. "/venv/bin/python"
		-- 			-- elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
		-- 			-- 	return cwd .. "/.venv/bin/python"
		-- 			-- else
		-- 			-- 	return "/usr/bin/python"
		-- 			-- end
		-- 			return "/home/fedka/projects/receipts/receipts-backend/.venv/bin/python"
		-- 		end,
		-- 	},
		-- }

    -- dap.configurations.python = {
    --   {
    --     type = 'python';
    --     request = 'launch';
    --     name = "Launch file";
    --     program = "${file}";
    --     pythonPath = function()
		--  			return "/home/fedka/projects/receipts/receipts-backend/.venv/bin/python"
    --       -- return '/usr/bin/python'
    --     end;
    --   },
    -- }

		-- local dap_python = require("dap-python")

		-- dap_python.setup()
		-- dap_python.setup("python3")
		-- dap_python.setup('python')
		-- dap_python.setup("/home/fedka/projects/receipts/receipts-backend/.venv/bin/python")
	end,
}
