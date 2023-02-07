local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then
  print("Not found LSP!")
  return
end


-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- on_attach
local on_attach = require("utils/on_attach").on_attach

-- sql
nvim_lsp.sqlls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
