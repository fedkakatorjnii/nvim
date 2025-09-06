-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- Не запоминать символ удалённый x
keymap.set("n", "x", '"_x')
-- TODO: почему-то всё ломает...
-- vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = false })

-- выход из режима редактированиея
-- keymap.set("i", "fd", "<Esc>")
vim.api.nvim_set_keymap("i", "fd", "<Esc>", { noremap = false })

-- keymap.set("i", "jj", "<Esc>")
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })

-- Increment/decrement
-- keymap.set("n", "+", "<C-a>")
vim.api.nvim_set_keymap("n", "+", "<C-a>", { noremap = false })
-- keymap.set("n", "-", "<C-x>")
vim.api.nvim_set_keymap("n", "-", "<C-x>", { noremap = false })

vim.api.nvim_set_keymap("n", "-", "<C-x>", { noremap = false })

-- vim.keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
-- vim.keymap.set("n", ";f", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
vim.keymap.set("n", ";f", ":Telescope file_browser <CR>")
