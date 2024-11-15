--
-- neo-tree.nvim
--
-- древовидный проводник
--

local status, icons = pcall(require, "neo-tree.nvim")

if not status then
	-- print("Not found neo-tree.nvim!")
	return
end
