local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	print("Not found LSP!")
	return
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = require("utils/on_attach").on_attach

nvim_lsp.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
