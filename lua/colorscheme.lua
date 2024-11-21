--
-- цветовые схемы
--

local status_gruvbox, gruvbox = pcall(require, "gruvbox")
local status_catppuccin, catppuccin = pcall(require, "catppuccin")

if status_gruvbox then
	-- vim.cmd("colorscheme gruvbox")
	-- vim.cmd.colorscheme("gruvbox")
end

if status_catppuccin then
	-- vim.cmd("colorscheme catppuccin")
	vim.cmd.colorscheme("catppuccin")
end
