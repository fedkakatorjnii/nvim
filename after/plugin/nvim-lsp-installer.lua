local status, nvimLspInstaller = pcall(require, "nvim-lsp-installer")
if not status then
	print("Not found nvim-lsp-installer!")
	return
end

nvimLspInstaller.setup({})
