local status, nvim_lsp = pcall(require, "cellular-automaton")
if not status then
	print("Not found LSP!")
	return
end

local config = {
	fps = 50,
	name = "slide",
}

-- init function is invoked only once at the start
-- config.init = function (grid)
--
-- end

-- update function
config.update = function(grid)
	for i = 1, #grid do
		local prev = grid[i][#grid[i]]

		for j = 1, #grid[i] do
			-- grid[i][j]
			-- prev = prev
			-- grid[i][j]
			grid[i][j], prev = prev, grid[i][j]
		end
	end
	return true
end

nvim_lsp.register_animation(config)

--
-- custom start
--

-- TODO

--
-- custom end
--
