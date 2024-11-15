--
-- lualine
--
-- нижняя строка состояния
--

local status, lualine = pcall(require, "lualine")

if not status then
	-- print("Not Found Lualine!")
	return
end

local options = {
	-- icons_enabled = true,
	-- theme = 'auto',
	-- theme = 'gruvbox',
	-- theme = "palenight",
	-- theme = "solarized_dark",
	theme = "dracula",

	-- section_separators = { left = "", right = "" },
	-- component_separators = { left = "", right = "" },

	--   section_separators = { left = '', right = '' },
	--   component_separators = { left = '', right = '' },

	-- section_separators = { left = '', right = ''},
	-- component_separators = { left = '', right = ''},

	-- section_separators = { left = '', right = ''},
	-- component_separators = { left = '', right = ''},

	-- disabled_filetypes = {},
	-- always_divide_middle = true,
	-- globalstatus = false,
}

local sections = {
	lualine_a = { "mode" },
	lualine_b = {
		"branch",
		"diff",
		"diagnostics",
	},
	lualine_c = {
		{
			"filename",
			file_status = true, -- displays file status (readonly status, modified status)
			path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
		},
	},
	lualine_x = {
		{
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = {
				error = " ",
				warn = " ",
				info = " ",
				hint = " ",
			},
		},
		"encoding",
		"filetype",
	},
	lualine_y = { "progress" },
	lualine_z = { "location" },
}

local inactive_sections = {
	lualine_a = {},
	lualine_b = {},
	lualine_c = {
		{
			"filename",
			file_status = true, -- displays file status (readonly status, modified status)
			path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
		},
	},
	lualine_x = { "location" },
	lualine_y = {},
	lualine_z = {},
}

local tabline = {}

local extensions = { "fugitive" }

lualine.setup({
	options = options,
	-- sections = sections,
	-- inactive_sections = inactive_sections,
	-- tabline = tabline,
	-- extensions = extensions,
})
