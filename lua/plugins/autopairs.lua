--
-- nvim-autopairs 
--
-- печатает парные символы
-- https://github.com/windwp/nvim-autopairs
--
return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = true,
	-- config = function()
	-- 	local status, autopairs = pcall(require, "nvim-autopairs")
	-- 	if not status then
	-- 		print("Not found nvim-autopairs!")
	-- 		return
	-- 	end

	-- 	autopairs.setup({
	-- 		disable_filetype = { "TelescopePrompt", "vim" },
	-- 	})
	-- end,
}
