
return {
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({})

      local keymap = vim.keymap
      -- local opts = { noremap = true, silent = true }
      -- -- vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
      -- -- vim.keymap.set('n', '<C-S-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
      -- 
      -- keymap("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
      -- keymap("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
      -- keymap("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", opts)
      -- keymap("n", "gp", "<Cmd>Lspsaga preview_definition<CR>", opts)
      -- keymap("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
      -- 
      -- keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
      
      -- Diagnostic jump
      -- You can use <C-o> to jump back to your previous location
      -- keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
      keymap.set("n", "[e", ":Lspsaga diagnostic_jump_prev<Return>", { silent = true })
      -- keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev", { silent = true })

      -- keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
      keymap.set("n", "]e", ":Lspsaga diagnostic_jump_next<Return>", { silent = true })


      -- Diagnostic jump with filters such as only jumping to an error
      keymap.set("n", "[E", function()
      	require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end)
      keymap.set("n", "]E", function()
      	require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
      end)
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons",  -- optional
    },
  },
}
