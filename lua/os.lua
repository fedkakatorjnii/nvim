local has = vim.fn.has
local is_mac = has("macunix")
local is_win = has("win32")

-- буфер обмена под ОС
if is_mac then
	vim.opt.clipboard:append({ "unnamedplus" })
end
if is_win then
	vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })
end
