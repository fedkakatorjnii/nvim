--vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then
  print("Not found LSP!")
  return
end

local protocol = require('vim.lsp.protocol')

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

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- on_attach
local on_attach = require("utils/on_attach").on_attach

-- enable snippets for cssls
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.flow.setup {
  on_attach = on_attach,
  capabilities = capabilities
}


nvim_lsp.tsserver.setup {
  -- on_attach = on_attach,
  on_attach = function(client, bufnr)
    -- client.resolved_capabilities.document_formatting = false
    -- client.resolved_capabilities.document_range_formatting = false

    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    on_attach(client, bufnr)
  end,
  filetypes = {
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  },
  cmd = {
    "typescript-language-server",
    "--stdio"
  },
  capabilities = capabilities
}


-- nvim_lsp.tsserver.setup {
--   -- on_attach = on_attach,
--   on_attach = function(client, bufnr)
--     -- client.resolved_capabilities.document_formatting = false
--     -- client.resolved_capabilities.document_range_formatting = false
--
--     client.server_capabilities.documentFormattingProvider = false
--     client.server_capabilities.documentRangeFormattingProvider = false
--
--     on_attach(client, bufnr)
--   end,
--   filetypes = {
--     "typescript",
--     "typescriptreact",
--     "typescript.tsx"
--   },
--   cmd = {
--     "typescript-language-server",
--     "--stdio"
--   },
--   capabilities = capabilities
-- }

nvim_lsp.sourcekit.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    enable_format_on_save(client, bufnr)
  end,
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

nvim_lsp.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities
}



--
-- C++
--
-- nvim_lsp.ccls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   init_options = {
--     compilationDatabaseDirectory = "build";
--     index = {
--       threads = 0;
--     };
--     clang = {
--       excludeArgs = { "-frounding-math" };
--     };
--   },
--   whitelist = { "c", "cpp", "objc", "objcpp", "cc" }
-- }
--

nvim_lsp.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities
}


nvim_lsp.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.astro.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
  }
)

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})
