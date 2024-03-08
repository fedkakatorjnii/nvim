local status, null_ls = pcall(require, "null-ls")
if not status then
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

null_ls.setup({
	sources = {
		-- null_ls.builtins.diagnostics.flake8,
		-- null_ls.builtins.diagnostics.ruff,
		-- null_ls.builtins.formatting.black,
		-- null_ls.builtins.diagnostics.ruff.with({
		-- 	extra_args = {},
		-- }),
		-- null_ls.builtins.diagnostics.ruff.with({
		-- 	-- extra_args = { "--fix" },

		-- 	extra_args = { "--fix", "-e", "-n", "--stdin-filename", "$FILENAME", "-" },
		-- 	args = { "--fix", "-e", "-n", "--stdin-filename", "$FILENAME", "-" },
		-- 	-- Args: { "--fix", "-e", "-n", "--stdin-filename", "$FILENAME", "-" }
		-- }),
		--
		null_ls.builtins.formatting.stylua,

		-- markdown
		-- null_ls.builtins.code_actions.ltrs,

		-- null_ls.builtins.formatting.textlint,

		-- null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.completion.spell,

		--
		-- null_ls.builtins.diagnostics.eslint,
		-- null_ls.builtins.code_actions.eslint,
		--

		-- js ts
		-- null_ls.builtins.diagnostics.eslint_d,
		-- null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.code_actions.eslint,

		-- js ts
		-- null_ls.builtins.formatting.prettier,
		-- markdown ???
		null_ls.builtins.formatting.prettierd,

		--
		-- kotlin
		--
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
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})
