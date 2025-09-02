--
-- mason
--
-- lsp
-- что-то...
-- https://github.com/williamboman/mason.nvim
--
return {
  {
    "williamboman/mason.nvim",
    config = function()
      local status, mason = pcall(require, "mason")

      if not status then
        -- print("Not found mason!")
        return
      end

      mason.setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local status, lsp = pcall(require, "mason-lspconfig")

      if not status then
        -- print("Not found mason!")
        return
      end

      lsp.setup({
        -- TODO: почему не получается установить gopls через mason
        -- ensure_installed = { "pyright", "lua_ls", "rust_analyzer", "gopls" },
        -- ensure_installed = { "pyright", "lua_ls", "rust_analyzer", "vue-language-server" },
        ensure_installed = {
          "pyright",
          "lua_ls",
          "rust_analyzer",
          -- "gopls",
          -- "vue-language-server",
          -- "harper-ls",
          -- "prettierd",
          -- "prettier",
        },
        -- ensure_installed = { "pyright", "lua_ls", "rust_analyzer", "harper-ls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local status, nvim_lsp = pcall(require, "lspconfig")

      if not status then
        -- print("Not found LSP!")
        return
      end

      -- local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

      -- if not cmp_nvim_lsp_status then
      -- 	-- print("Not found cmp_nvim_lsp!")
      -- 	return
      -- end

      -- local capabilities = cmp_nvim_lsp.default_capabilities()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- TODO
      -- python
      --

      -- nvim_lsp.ty.setup({
      --   init_options = {
      --     settings = {
      --       -- ty language server settings go here
      --     }
      --   }
      -- })

      nvim_lsp.pyright.setup({
        capabilities = capabilities,
        settings = {
          -- pyright = {
          -- 	-- Using Ruff's import organizer
          -- 	disableOrganizeImports = true,
          -- },
          python = {
            analysis = {
              -- typeCheckingMode = 'strict'
              typeCheckingMode = 'standard'
              --
              -- typeCheckingMode = 'basic'
              -- typeCheckingMode = 'off'
              -- Ignore all files for analysis to exclusively use Ruff for linting
              -- ignore = { "*" },
            },
          },
        },
      })

      -- python
      nvim_lsp.ruff.setup({
        capabilities = capabilities,
      })

      -- rust
      nvim_lsp.rust_analyzer.setup({
        capabilities = capabilities,
      })
      -- lua
      -- nvim_lsp.tsserver.setup({})
      nvim_lsp.lua_ls.setup({
        capabilities = capabilities,
      })
      --
      -- front START
      --
      -- ts js
      nvim_lsp.ts_ls.setup({
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        capabilities = capabilities,
        init_options = {
          plugins = { -- I think this was my breakthrough that made it work
            {
              name = "@vue/typescript-plugin",
              location = "/usr/local/lib/node_modules/@vue/language-server",
              languages = { "vue" },
            },
          },
        },
      })
      nvim_lsp.volar.setup {}
      nvim_lsp.html.setup({
        capabilities = capabilities,
      })
      nvim_lsp.cssls.setup({
        capabilities = capabilities,
      })
      nvim_lsp.eslint.setup({
        capabilities = capabilities,
      })
      nvim_lsp.clangd.setup({
        capabilities = capabilities,
      })
      --
      -- front END
      --
      -- nvim_lsp.kotlin_language_server.setup({
      -- 	capabilities = capabilities,
      -- })
      nvim_lsp.jsonls.setup({
        capabilities = capabilities,
      })

      -- nvim_lsp.sqlls.setup()
      -- nvim_lsp.sqlls.setup()

      nvim_lsp.csharp_ls.setup({
        automatic_installation = true,
      })
      -- nvim_lsp.harper_ls.setup{}
      -- nvim_lsp.harper_ls.setup {
      --   settings = {
      --     ["harper-ls"] = {
      --       userDictPath = "~/dict.txt",
      --       fileDictPath = "~/.harper/",
      --     }
      --   },
      -- }

      -- golang
      nvim_lsp.gopls.setup({})
      -- nvim_lsp.gopls.setup({
      --   settings = {
      --     gopls = {
      --       analyses = {
      --         unusedparams = true,
      --       },
      --       staticcheck = true,
      --       gofumpt = true,
      --     },
      --   },
      -- })

      nvim_lsp.clangd.setup({})

      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }

      keymap("n", "K", vim.lsp.buf.hover, opts)
      -- перейти к объявлению
      keymap("n", "gd", vim.lsp.buf.definition, opts)
      -- перейти к использованию
      keymap("n", "gr", vim.lsp.buf.references, opts)
      -- выполнениу?
      keymap("n", "gi", vim.lsp.buf.implementation, opts)

      -- не работает
      -- ошибки???
      -- keymap("n", "[d", vim.lsp.buf.diagnostic.goto_prev, opts)
      -- keymap("n", "]d", vim.lsp.buf.diagnostic.goto_next, opts)

      keymap({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
      -- keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    end,
  },
}
