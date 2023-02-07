local status, saga = pcall(require, "lspsaga")
if (not status) then
  print("Not found lspsaga!")
  return
end

local keymap = vim.keymap.set

saga.init_lsp_saga {
  server_filetype_map = {
    typescript = 'typescript'
  }
}

local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
-- vim.keymap.set('n', '<C-S-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)

keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
keymap('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
keymap('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
keymap('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
keymap('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })


-- Only jump to error
keymap("n", "[e", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]e", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
-- keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- -- Only jump to error
-- keymap("n", "[E", function()
--   require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end, { silent = true })
-- keymap("n", "]E", function()
--   require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end, { silent = true })
