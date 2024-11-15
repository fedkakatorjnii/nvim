--
-- Запоминает где nvim последний раз редактировал файл
--

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		-- TODO: переписать на lua...
		vim.cmd([[
		  if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
		]])
	end,
})

-- -- memory_files_position
-- vim.cmd([[
-- autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
-- ]])
