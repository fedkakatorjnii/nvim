-- local status, packer = pcall(require, "packer")
--
-- if not status then
-- 	print("Not Found Packer!")
-- 	return
-- end
--
-- -- vim.cmd [[packadd packer.nvim]]
--
-- packer.startup(function(use)
-- 	use("wbthomason/packer.nvim")
--
-- 	-- use {
-- 	--   'svrana/neosolarized.nvim',
-- 	--   requires = { 'tjdevries/colorbuddy.nvim' }
-- 	-- }
--
-- 	-- нижняя строка статуса
-- 	use({
-- 		"nvim-lualine/lualine.nvim",
-- 		-- requires = { 'kyazdani42/nvim-web-devicons', opt = true }
-- 		requires = { "nvim-tree/nvim-web-devicons", opt = true },
-- 	})
--
-- 	-- LSP
-- 	-- use 'neovim/nvim-lspconfig'
-- 	use({
-- 		"williamboman/nvim-lsp-installer",
-- 		"neovim/nvim-lspconfig",
-- 	})
-- 	-- nvim-cmp source for buffer words
-- 	use("hrsh7th/cmp-buffer")
-- 	-- nvim-cmp source for nvim's built-in LSP
-- 	use("hrsh7th/cmp-nvim-lsp")
-- 	-- completion
-- 	use("hrsh7th/nvim-cmp")
-- 	-- vscode-like pictograms
-- 	use("onsails/lspkind-nvim")
--
-- 	-- use 'nvim-lualine/lualine.nvim' -- Statusline
-- 	use("nvim-lua/plenary.nvim") -- Common utilities
-- 	use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
-- 	use("williamboman/mason.nvim")
-- 	use("williamboman/mason-lspconfig.nvim")
--
-- 	-- LSP UIs
-- 	use({
-- 		"nvimdev/lspsaga.nvim",
-- 		after = "nvim-lspconfig",
-- 		config = function()
-- 			require("lspsaga").setup({})
-- 		end,
-- 	})
--
-- 	-- LSP UIs
-- 	-- use({
-- 	--   "glepnir/lspsaga.nvim",
-- 	--   branch = "main",
-- 	--   config = function()
-- 	--     require("lspsaga").setup({})
-- 	--   end,
-- 	--   requires = {
-- 	--     { "nvim-tree/nvim-web-devicons" },
-- 	--     --Please make sure you install markdown and markdown_inline parser
-- 	--     { "nvim-treesitter/nvim-treesitter" }
-- 	--   }
-- 	-- })
--
-- 	--
--
-- 	-- use({
-- 	-- 	"glepnir/lspsaga.nvim",
-- 	-- 	-- opt = true,
-- 	-- 	branch = "main",
-- 	-- 	-- event = "LspAttach",
-- 	-- 	config = function()
-- 	-- 		require("lspsaga").setup({})
-- 	-- 	end,
-- 	-- 	requires = {
-- 	-- 		{ "nvim-tree/nvim-web-devicons" },
-- 	-- 		--Please make sure you install markdown and markdown_inline parser
-- 	-- 		{ "nvim-treesitter/nvim-treesitter" },
-- 	-- 	},
-- 	-- })
--
-- 	--
--
--
--
-- 	use("L3MON4D3/LuaSnip")
--
-- 	-- use 'kyazdani42/nvim-web-devicons' -- File icons
-- 	use("windwp/nvim-autopairs")
-- 	use("windwp/nvim-ts-autotag")
-- 	use("norcalli/nvim-colorizer.lua")
-- 	use("folke/zen-mode.nvim")
-- 	use({
-- 		"iamcco/markdown-preview.nvim",
-- 		run = function()
-- 			vim.fn["mkdp#util#install"]()
-- 		end,
-- 	})
--
-- 	-- use 'github/copilot.vim'
--
-- 	-- декорации (что бы это не значило)
-- 	use("lewis6991/gitsigns.nvim")
-- 	-- какой-то плагин для git который я не использую но надо бы...
-- 	use("dinhhuy258/git.nvim") -- For git blame & browse
--
-- 	-- Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
--
-- 	--
-- 	--
-- 	--
--
--
--
-- 	-- use {
-- 	--   'MunifTanjim/eslint.nvim'
-- 	-- }
--
-- 	-- kotlin
-- 	-- use { "udalov/kotlin-vim", ft = { "kotlin" } }
--
-- 	-- java
-- 	-- require 'lspconfig'.java_language_server.setup {}
--
-- 	-- java
-- 	-- use 'mfussenegger/nvim-jdtls'
--
-- 	-- прекол
-- 	use("eandrju/cellular-automaton.nvim")
-- end)

local status, packer = pcall(require, "packer")

if not status then
	print("Not Found Packer!")
	return
end

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- gruvbox топ за свои деньги
	-- цветовая тема
	use({ "ellisonleao/gruvbox.nvim" })

	-- какая-то тема
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- проводник
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                            , branch = '0.1.x',
		requires = "nvim-lua/plenary.nvim",
	})
	use("nvim-telescope/telescope-file-browser.nvim")

	-- древовидный проводник
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	})

	-- полоса с буфферами сверху
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })

	-- treesitter что бы это ни было...
	-- синтаксический анализе кода
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		-- run = function()
		-- 	local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		-- 	ts_update()
		-- end,
	})

	-- нижняя строка состояния
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- git diff
	-- прагин для просмотра изменений git
	use({
		"sindrets/diffview.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	-- видимо иконки
	use("nvim-tree/nvim-web-devicons")

	--
	-- дебагер
	--

	-- 	use("mfussenegger/nvim-dap")
	-- 	use("mfussenegger/nvim-dap-python")
end)
