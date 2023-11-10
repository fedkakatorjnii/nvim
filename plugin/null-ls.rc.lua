local status, null_ls = pcall(require, "null-ls")
if (not status) then
  print("Not found null-ls!")
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

-- local my_source = '/Users/fedka/config/google-java-format-1.16.0-all-deps.jar'
-- null_ls.register({ name = "my-sources", filetypes = { "java" }, sources = { my_source } })


null_ls.setup {
  sources = {
    -- null_ls.builtins.formatting.stylua,
    -- null_ls.builtins.completion.spell,

    --
    -- null_ls.builtins.diagnostics.eslint,
    -- null_ls.builtins.code_actions.eslint,
    --

    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
    -- null_ls.builtins.diagnostics.eslint,
    -- null_ls.builtins.code_actions.eslint,
    --
    null_ls.builtins.formatting.prettier,
    --
    -- kotlin
    -- TODO
    -- null_ls.builtins.formatting.prettierd,
    -- null_ls.builtins.formatting.ktlint,
    -- null_ls.builtins.diagnostics.ktlint,

    --
    -- java
    --
    -- null_ls.builtins.formatting.google_java_format,
    -- null_ls.builtins.formatting.clang_format,
    -- null_ls.builtins.formatting.astyle,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      -- vim.api.nvim_clear_autocmds({
      --   group = augroup,
      --   buffer = bufnr
      -- })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end
  -- on_attach = function(client, bufnr)
  --   if client.supports_method("textDocument/formatting") then
  --     vim.api.nvim_clear_autocmds({
  --       group = augroup,
  --       buffer = bufnr
  --     })
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       group = augroup,
  --       buffer = bufnr,
  --       callback = function()
  --         lsp_formatting(bufnr)
  --       end,
  --     })
  --   end
  -- end
}

-- null_ls.setup {
--   sources = {
--     null_ls.builtins.diagnostics.eslint,
--     -- null_ls.builtins.diagnostics.eslint_d,
--     null_ls.builtins.code_actions.eslint,
--     -- null_ls.builtins.code_actions.eslint_d,
--     null_ls.builtins.formatting.prettier,
--     -- null_ls.builtins.formatting.stylua,
--     -- null_ls.builtins.completion.spell,
--
--     --
--     --
--     --
--
--     -- null_ls.builtins.formatting.prettierd,
--     -- null_ls.builtins.diagnostics.eslint_d.with({
--     --   diagnostics_format = '[eslint] #{m}\n(#{c})'
--     -- }),
--     -- null_ls.builtins.diagnostics.fish
--   },
--   on_attach = function(client, bufnr)
--     if client.supports_method("textDocument/formatting") then
--       vim.api.nvim_clear_autocmds({
--         group = augroup,
--         buffer = bufnr
--       })
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         group = augroup,
--         buffer = bufnr,
--         callback = function()
--           lsp_formatting(bufnr)
--         end,
--       })
--     end
--   end
-- }

-- vim.api.nvim_create_user_command(
--   'DisableLspFormatting',
--   function()
--     vim.api.nvim_clear_autocmds({
--       group = augroup,
--       buffer = 0
--     })
--   end,
--   { nargs = 0 }
-- )

-- local eslint_status, eslint = pcall(require, "eslint")
-- if (not eslint_status) then
--   print("Not found eslint!")
--   return
-- end
--
-- eslint.setup({
--   bin = 'eslint', -- or `eslint_d`
--   code_actions = {
--     enable = true,
--     apply_on_save = {
--       enable = true,
--       types = { "directive", "problem", "suggestion", "layout" },
--     },
--     disable_rule_comment = {
--       enable = true,
--       location = "separate_line", -- or `same_line`
--     },
--   },
--   diagnostics = {
--     enable = true,
--     report_unused_disable_directives = false,
--     run_on = "type", -- or `save`
--   },
-- })
