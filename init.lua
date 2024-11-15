require("base")
require("highlights")
require("maps")

local has = vim.fn.has
local is_mac = has("macunix")
local is_win = has("win32")

if is_mac then
	require("macos")
end
if is_win then
	require("windows")
end

local status, _ = pcall(require, "plugins")
if not status then
	-- TODO: why not founnd
	print("Not found Plugins!")
	return
end

-- lua require('dap-python').setup('./venv/bin/python')
-- require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
local dap = require("dap")
local dap = require("dap-python")
-- dap.resolve_python = function()
-- 	return "~/.virtualenvs/debugpy/bin/python"
-- end

-- local dap = require("dap")
-- dap.configurations.python = {
-- 	{
-- 		type = "python",
-- 		request = "launch",
-- 		name = "Launch file",
-- 		program = "${file}",
-- 		pythonPath = function()
-- 			return "~/.virtualenvs/debugpy/bin/python"
-- 			-- return "/usr/bin/python"
-- 		end,
-- 	},
-- }

-- dap.configurations.python = {
-- 	{
-- 		-- The first three options are required by nvim-dap
-- 		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
-- 		request = "launch",
-- 		name = "Launch file",
--
-- 		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
--
-- 		program = "${file}", -- This configuration will launch the current file if used.
-- 		pythonPath = function()
-- 			-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
-- 			-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
-- 			-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
-- 			local cwd = vim.fn.getcwd()
-- 			if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
-- 				return cwd .. "/venv/bin/python"
-- 			elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
-- 				return cwd .. "/.venv/bin/python"
-- 			else
-- 				return "/usr/bin/python"
-- 			end
-- 		end,
-- 	},
-- }

-- require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
-- dap.setup("~/.virtualenvs/debugpy/bin/python")
-- local dap = require("dap")
-- dap.configurations.python = {
-- 	{
-- 		type = "python",
-- 		request = "launch",
-- 		name = "Launch file",
-- 		program = "${file}",
-- 		pythonPath = function()
-- 			return "~/.virtualenvs/debugpy/bin/python"
-- 		end,
-- 	},
-- }

local dap_py = require("dap-python")
-- dap_py.setup("~/.virtualenvs/debugpy/bin/python")
dap_py.setup()
