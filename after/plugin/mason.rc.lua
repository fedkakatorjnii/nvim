local status, mason = pcall(require, "mason")
if not status then
	print("Not Found mason!")
	return
end

local status2, lspconfig = pcall(require, "mason-lspconfig")
if not status then
	print("Not Found mason-lspconfig!")
	return
end

mason.setup({
	PATH = "prepend", -- "skip" seems to cause the spawning error
})

lspconfig.setup({
	automatic_installation = true,
})
