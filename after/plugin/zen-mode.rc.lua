local status, zenMode = pcall(require, "zen-mode")
if not status then
	print("Not found zen-mode!")
	return
end

zenMode.setup({})

vim.keymap.set("n", "<C-w>o", "<cmd>ZenMode<cr>", { silent = true })
