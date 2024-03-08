local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	print("Not found LSP!")
	return
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- on_attach
local on_attach = require("utils/on_attach").on_attach

nvim_lsp.kotlin_language_server.setup({
	-- on_attach = on_attach,
	on_attach = function(client, bufnr)
		-- client.resolved_capabilities.document_formatting = false
		-- client.resolved_capabilities.document_range_formatting = false

		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		on_attach(client, bufnr)
	end,
	-- flags = lsp_flags,
	capabilities = capabilities,
})
