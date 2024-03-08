local status, gitsigns = pcall(require, "gitsigns")
if not status then
	print("Not found gitsigns!")
	return
end

gitsigns.setup({})
