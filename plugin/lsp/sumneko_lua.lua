local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then
  print("Not found LSP!")
  return
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- on_attach
local on_attach = require("utils/on_attach").on_attach

local augroup_format = vim.api.nvim_create_augroup(
  "Format",
  { clear = true }
)

local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({
    group = augroup_format,
    buffer = bufnr
  })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end


-- nvim_lsp.sumneko_lua.setup {
nvim_lsp.lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  -- on_attach = function(client, bufnr)

  --   on_attach(client, bufnr)
  --   enable_format_on_save(client, bufnr)
  -- end,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
}
