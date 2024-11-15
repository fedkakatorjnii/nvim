--
-- treesitter
--
-- treesitter что бы это ни было...
-- синтаксический анализе кода
--

local status, tree_sitter = pcall(require, "nvim-treesitter.configs")

if not status then
	-- print("Not found nvim-treesitter!")
	return
end

tree_sitter.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = "all",
	-- ensure_installed = {
	-- 	"typescript",
	-- 	"javascript",
	-- 	"tsx",
	-- 	"vue",
	-- 	"toml",
	-- 	"fish",
	-- 	"php",
	-- 	"json",
	-- 	"yaml",
	-- 	"swift",
	-- 	"css",
	-- 	"html",
	-- 	"lua",
	-- 	"python",
	-- 	"rust",
	-- 	"sql",
	-- 	"kotlin",
	-- 	-- "kt",
	-- 	"kotlin",
	-- 	"java",
	-- 	"markdown",
	-- 	"query",
	-- 	"vimdoc",
	-- 	"c",
	-- 	"markdown_inline",
	-- },
	-- autotag = {
	-- 	enable = true,
	-- },
	-- ignore_install = {  },
	sync_install = false,
	auto_install = true,
})

-- TODO: что делает и зачем???
-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
