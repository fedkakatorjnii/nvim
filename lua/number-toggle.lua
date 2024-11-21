-- нумерация строк
-- vim.wo - окно window-scoped (можно использовать как массив vim.wo[0] или vim.wo[0][0])
-- vim.bo - буфер buffer-scoped (можно использовать как массив vim.bo[0] или vim.bo[0][0])
vim.wo.number = true
-- относительная нумерация
vim.wo.relativenumber = true

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- при фокусе относительная нумерация
-- в противном случае абмолютная нумерация

-- группа автокомманд
local numbertogglegroup = augroup("numbertoggle", {})

-- автокомманда при фокусировке окна
autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
	-- BufEnter,FocusGained,InsertLeave,WinEnter
	pattern = "*",
	callback = function()
		vim.wo.relativenumber = true
	end,
	group = numbertogglegroup,
})
-- автокомманда при расфокусировке окна
autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
	pattern = "*",
	callback = function()
		vim.wo.relativenumber = false
	end,
	group = numbertogglegroup,
})

-- реализация на vimscript
-- vim.cmd([[
-- augroup numbertoggle
--   autocmd!
--   autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
--   autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
-- augroup END
-- ]])
