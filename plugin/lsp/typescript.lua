local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	print("Not found LSP!")
	return
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- on_attach
local on_attach = require("utils/on_attach").on_attach

-- TODO: устарел надо заменить на какой-то ts_ls
-- -- typescript
-- nvim_lsp.tsserver.setup({
-- 	-- on_attach = on_attach,
-- 	on_attach = function(client, bufnr)
-- 		-- client.resolved_capabilities.document_formatting = false
-- 		-- client.resolved_capabilities.document_range_formatting = false
--
-- 		client.server_capabilities.documentFormattingProvider = false
-- 		client.server_capabilities.documentRangeFormattingProvider = false
--
-- 		on_attach(client, bufnr)
-- 	end,
-- 	filetypes = {
-- 		"typescript",
-- 		"typescriptreact",
-- 		"typescript.tsx",
-- 	},
-- 	cmd = {
-- 		"typescript-language-server",
-- 		"--stdio",
-- 	},
-- 	capabilities = capabilities,
-- })
--
-- -- nvim_lsp.tsserver.setup {
-- --   -- on_attach = on_attach,
-- --   on_attach = function(client, bufnr)
-- --     -- client.resolved_capabilities.document_formatting = false
-- --     -- client.resolved_capabilities.document_range_formatting = false
-- --
-- --     client.server_capabilities.documentFormattingProvider = false
-- --     client.server_capabilities.documentRangeFormattingProvider = false
-- --
-- --     on_attach(client, bufnr)
-- --   end,
-- --   filetypes = {
-- --     "typescript",
-- --     "typescriptreact",
-- --     "typescript.tsx"
-- --   },
-- --   cmd = {
-- --     "typescript-language-server",
-- --     "--stdio"
-- --   },
-- --   capabilities = capabilities
-- -- }
