local keymap = vim.keymap

-- Не запоминать символ удалённый x
keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
-- keymap.set('n', 'dw', 'vb"_d')

-- Выделить весь файл
keymap.set("n", "<C-a>", "gg<S-v>G")

-- TODO: видимо должно сохранять с правами root, но не сохраняет...
-- Save with root permission (not working for now)
-- vim.api.nvim_create_user_command("W", "w !sudo tee > /dev/null %", {})

-- Tabs
keymap.set("n", "te", ":tabedit<Return>", { silent = true })
keymap.set("n", "td", ":tabclose<Return>", { silent = true })
keymap.set("n", "tn", ":tabnew<Return>", { silent = true })
keymap.set("n", "th", ":tabfirst<Return>", { silent = true })
keymap.set("n", "tk", ":tabnext<Return>", { silent = true })
keymap.set("n", "tj", ":tabprev<Return>", { silent = true })
keymap.set("n", "tl", ":tablast<Return>", { silent = true })
keymap.set("n", "tc", ":tabnew %<Return>", { silent = true })

-- Split window
-- split and move to new tile
keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true })
keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true })
-- keymap.set("n", "ssn", "<C-w>n", { silent = true })
-- keymap.set("n", "svn", "<C-w>v", { silent = true })

-- split and stay on current tile
keymap.set("n", "sS", ":split<Return>", { silent = true })
keymap.set("n", "sV", ":vsplit<Return>", { silent = true })

-- Move tile
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

keymap.set("i", "fd", "<esc>")
-- keymap.set('i', 'ав', '<esc>')

-- joke
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

-- форматирование ruff для python
keymap.set("", "<C-b>", ':!ruff format "%"<Return><Return>')

-- переключить относительную/абсолютную нумерацию строк
-- keymap.set("n", "<C-n>", ":set rnu!<Return>", { silent = true })

-- local function get_line_git_history()
--     -- Implementation which gets line specific git log
-- end
--
-- vim.api.nvim_set_keymap("n", "<leader>gh", get_line_git_history(), {noremap=true})

-- открыть древовидный проводник
-- vim.keymap.set("n", "<leader>n", "Neotree filesystem reveal left<CR>", {})
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", { silent = true })
