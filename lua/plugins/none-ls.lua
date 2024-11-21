--
-- none-ls
--
--
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
				null_ls.builtins.formatting.stylua,

				-- null_ls.builtins.diagnostics.eslint,
				-- null_ls.builtins.code_actions.eslint,

				null_ls.builtins.formatting.prettierd,

				-- null_ls.builtins.diagnostics.ruff,
			},
		})

		vim.keymap.set("n", "<space>gf", vim.lsp.buf.format, {})
	end,
}
