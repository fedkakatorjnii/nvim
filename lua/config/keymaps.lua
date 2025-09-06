-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- Не запоминать символ удалённый x
-- keymap.set("n", "x", '"_x')
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = false })

-- выход из режима редактированиея
-- keymap.set("i", "fd", "<Esc>")
vim.api.nvim_set_keymap("i", "fd", "<Esc>", { noremap = false })

-- keymap.set("i", "jj", "<Esc>")
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })
