--
--telescope
--
-- проводник
--
-- https://github.com/nvim-telescope/telescope-ui-select.nvim
--
-- https://github.com/nvim-telescope/telescope-file-browser.nvim
-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/nvim-lua/plenary.nvim
--
return {
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{
		"nvim-telescope/telescope-file-browser.nvim",
		-- branch = "hijack-netrw-enable-netrw",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		-- config = function()
		-- 	local status, telescope = pcall(require, "telescope")

		-- 	if not status then
		-- 		-- print("Not found telescope!")
		-- 		return
		-- 	end

		-- 	local builtin = require("telescope.builtin")

		-- 	local function telescope_buffer_dir()
		-- 		return vim.fn.expand("%:p:h")
		-- 	end

		-- 	local actions = require("telescope.actions")
		-- 	local fb_actions = require("telescope").extensions.file_browser.actions

		-- 	local defaults = {
		-- 		mappings = {
		-- 			n = {
		-- 				["q"] = actions.close,
		-- 			},
		-- 		},
		-- 	}

		-- 	local extensions = {
		-- 		file_browser = {
		-- 			-- theme = "dropdown",
		-- 			-- theme = "ivy",
		-- 			-- disables netrw and use telescope-file-browser in its place
		-- 			theme = "ivy",
		-- 			hijack_netrw = true,
		-- 			mappings = {
		-- 				-- your custom insert mode mappings
		-- 				["i"] = {
		-- 					["<C-w>"] = function()
		-- 						vim.cmd("normal vbd")
		-- 					end,
		-- 				},
		-- 				["n"] = {
		-- 					-- your custom normal mode mappings
		-- 					["N"] = fb_actions.create,
		-- 					["h"] = fb_actions.goto_parent_dir,
		-- 					["/"] = function()
		-- 						vim.cmd("startinsert")
		-- 					end,
		-- 					["o"] = actions.select_default,
		-- 				},
		-- 			},
		-- 		},
		-- 		-- ["ui-select"] = {
		-- 		-- 	require("telescope.themes").get_dropdown({}),
		-- 		-- },
		-- 	}

		-- 	telescope.setup({
		-- 		defaults = defaults,
		-- 		extensions = extensions,
		-- 	})

		-- 	telescope.load_extension("file_browser")

		-- 	vim.keymap.set("n", ";f", function()
		-- 		builtin.find_files({
		-- 			no_ignore = false,
		-- 			hidden = true,
		-- 		})
		-- 	end)
		-- 	vim.keymap.set("n", ";r", function()
		-- 		builtin.live_grep()
		-- 	end)
		-- 	vim.keymap.set("n", "\\\\", function()
		-- 		builtin.buffers()
		-- 	end)
		-- 	vim.keymap.set("n", ";t", function()
		-- 		builtin.help_tags()
		-- 	end)
		-- 	vim.keymap.set("n", ";;", function()
		-- 		builtin.resume()
		-- 	end)
		-- 	vim.keymap.set("n", ";e", function()
		-- 		builtin.diagnostics()
		-- 	end)
		-- 	vim.keymap.set("n", "sf", function()
		-- 		telescope.extensions.file_browser.file_browser({
		-- 			path = "%:p:h",
		-- 			cwd = telescope_buffer_dir(),
		-- 			respect_gitignore = false,
		-- 			hidden = true,
		-- 			grouped = true,
		-- 			-- previewer = false,
		-- 			initial_mode = "normal",
		-- 			-- layout_config = { height = 40 }
		-- 			layout_config = {
		-- 				-- height
		-- 				-- width
		-- 				-- prompt_position
		-- 				-- preview_cutoff
		-- 			},
		-- 		})
		-- 	end)

		-- 	-- require("telescope").load_extension("ui-select")
		-- end,
	},
}
