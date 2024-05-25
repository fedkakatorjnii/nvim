local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	print("Not found LSP!")
	return
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- on_attach
local on_attach = require("utils/on_attach").on_attach

-- local rust_config = { checkOnSave = { enable = false } }
-- if vim.fn.getcwd() == "/home/bilabila/bin/eframe_template" then
--   rust_config["cargo"] = { target = "wasm32-unknown-unknown" }
-- end

-- TODO поддержка ардуино
-- local rust_config = {
--   checkOnSave = {
--     enable = false,
--     -- enable = true,
--   },
--   cargo = {
--     autoReload = true,
--     target = "wasm32-unknown-unknown",
--     -- target = "avr-atmega328p",
--     -- target = "avr-unknown-gnu-atmega328",
--   }
-- }

-- rust_config["cargo"] = { target = "avr-atmega328p" }

nvim_lsp.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	-- flags = { debounce_text_changes = 150 },
	-- settings = { ["rust-analyzer"] = rust_config },
	-- settings = {
	-- 	["rust-analyzer"] = {
	-- 		diagnostics = {
	-- 			enable = true,
	-- 			experimental = {
	-- 				enable = true,
	-- 			},
	-- 		},
	-- 	},
	-- },
})
