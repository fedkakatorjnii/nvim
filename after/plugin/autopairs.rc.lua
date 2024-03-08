local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
	print("Not found nvim-autopairs!")
	return
end

autopairs.setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})
