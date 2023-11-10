local status, tree_sitter = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

tree_sitter.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "css",
    "html",
    -- "lua",
    "python",
    "rust",
    -- "sql",
    -- "kotlin",
    -- "kt",
    -- "java",
  },
  autotag = {
    enable = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
