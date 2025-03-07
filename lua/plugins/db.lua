return {
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod',                     lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
    },
    cmd = {
      'DB',
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
    config = function()
      vim.g.db_ui_save_location = vim.fn.getcwd() .. "/sql/"
    end,
  },
  -- TODO: разобраться почему не работает
  -- {
  --   'saghen/blink.cmp',
  --   opts = {
  --     sources = {
  --       default = { "lsp", "path", "snippets", "buffer" },
  --       per_filetype = {
  --         sql = { 'snippets', 'dadbod', 'buffer' },
  --       },
  --       -- add vim-dadbod-completion to your completion providers
  --       providers = {
  --         dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
  --       },
  --     },
  --   },
  -- },
}
