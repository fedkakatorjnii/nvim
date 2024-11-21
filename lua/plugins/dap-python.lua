--
-- nvim-dap-python
--
-- python дебагер
-- https://github.com/mfussenegger/nvim-dap-python
--
return {
	"mfussenegger/nvim-dap-python",
	dependencies = {
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		local dap_python_status, dap_python = pcall(require, "dap-python")

		if not dap_python_status then
			-- print("Not found dap-python!")
			return
		end


		local dap = require("dap")
		dap.configurations.python = {
			{
				-- The first three options are required by nvim-dap
				type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
				request = "launch",
				name = "Launch file qqqqqq",

				-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

				program = "${file}", -- This configuration will launch the current file if used.
				pythonPath = function()
					-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
					-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
					-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
					local cwd = vim.fn.getcwd()

					--  TODO
					-- local command = os.getenv("VIRTUAL_ENV") .. "/bin/python"

					if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
						return cwd .. "/venv/bin/python"
					elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
						return cwd .. "/.venv/bin/python"
					else
						return "/usr/bin/python"
					end

					return "/home/fedka/projects/receipts/receipts-backend/.venv/bin/python"
				end,
			},
		}


		dap_python.setup('./.venv/bin/python')
		-- dap_python.setup('python')
		-- dap_python.setup("/home/fedka/projects/receipts/receipts-backend/.venv/bin/python")
	end,
}
