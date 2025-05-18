--
-- none-ls
--
return {
  "nvimtools/none-ls.nvim",
  config = function()
    local status, null_ls = pcall(require, "null-ls")

    if not status then
      -- print("Not found none-ls!")
      return
    end

    null_ls.setup({
      sources = {
        -- null_ls.builtins.formatting.stylua,

        -- null_ls.builtins.diagnostics.eslint,
        -- null_ls.builtins.code_actions.eslint,

        -- TODO: почему перестало работать...
        -- null_ls.builtins.formatting.prettierd,
        -- null_ls.builtins.formatting.prettier,

        -- null_ls.builtins.diagnostics.ruff,

        --  C, C++, C++/CLI, Objective‑C, C#
        -- null_ls.builtins.formatting.astyle,
      },
    })

    vim.keymap.set("n", "<space>gf", vim.lsp.buf.format, {})
  end,
}
