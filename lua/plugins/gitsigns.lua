--
--lewis6991/gitsigns.nvim
--
-- подсветка строк git
-- https://github.com/lewis6991/gitsigns.nvim
--
return {
	"lewis6991/gitsigns.nvim",

	config = function()
		local status, gitsigns = pcall(require, "gitsigns")

		if not status then
			-- print("Not found gitsigns!")
			return
		end

		gitsigns.setup({})
	end,
}
