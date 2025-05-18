LIST = "\
SELECT\
  *\
FROM\
  {optional_schema}{table}\
-- ORDER BY id\
LIMIT 100\
;"


COLUMNS = "\
SELECT\
  ordinal_position AS n,\
  column_name AS name,\
  is_nullable,\
  data_type AS type,\
  column_default AS default\
FROM\
  information_schema.columns\
WHERE\
  table_name = '{table}'\
  AND\
  table_schema = '{schema}'\
ORDER BY ordinal_position\
;"

FULL_COLUMNS = "\
SELECT\
  *\
FROM\
  information_schema.columns\
WHERE\
  table_name = '{table}'\
  AND\
  table_schema = '{schema}'\
ORDER BY ordinal_position\
;"

COUNT = "\
SELECT\
  count(*)\
FROM\
  {optional_schema}{table}\
;"

PRIMARY_KEYS = "\
SELECT\
  constraint_name,\
  constraint_type,\
  is_deferrable,\
  initially_deferred,\
  enforced\
FROM\
  information_schema.table_constraints\
WHERE\
  constraint_type = 'PRIMARY KEY'\
  AND\
  table_schema = '{schema}'\
  AND\
  table_name = '{table}'\
;"

INDEXES = "\
SELECT\
  indexname,\
  indexdef,\
  tablespace\
FROM\
  pg_indexes\
WHERE\
  tablename='{table}'\
  AND\
  schemaname='{schema}'\
;"

FOREIGN_KEYS = "\
SELECT\
  tc.constraint_name,\
  tc.table_name,\
  kcu.column_name,\
  ccu.table_name AS foreign_table_name,\
  ccu.column_name AS foreign_column_name,\
  rc.update_rule,\
  rc.delete_rule\
FROM\
  information_schema.table_constraints AS tc\
\
JOIN information_schema.key_column_usage AS kcu\
ON tc.constraint_name = kcu.constraint_name\
\
JOIN information_schema.referential_constraints as rc\
ON tc.constraint_name = rc.constraint_name\
\
JOIN information_schema.constraint_column_usage AS ccu\
ON ccu.constraint_name = tc.constraint_name\
\
WHERE\
  constraint_type = 'FOREIGN KEY'\
  and\
  ccu.table_name = '{table}'\
  and\
  tc.table_schema = '{schema}'\
;"

INSERT = "\
INSERT INTO\
  {schema}.{table}(\
    id,\
    name\
  )\
VALUES\
  (\
    1,\
    'name'\
  )\
;"
UPDATE = "\
UPDATE\
  {schema}.{table}\
SET\
  name = ''\
WHERE\
  id = 1\
;"

DELETE_FROM_TABLE = "\
DELETE FROM\
  {schema}.{table}(\
-- WHERE\
-- id = 1\
;"

DROP_TABLE = "DROP TABLE {schema}.{table};"

DT = "\\dt+"
D = "\\d+"

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
      vim.g.db_ui_default_query = {}
      vim.g.db_ui_table_helpers = {
        postgresql = {
          List = LIST,
          Columns = COLUMNS,
          ["Primary Keys"] = PRIMARY_KEYS,
          Indexes = INDEXES,
          References = FOREIGN_KEYS,
          ["Foreign Keys"] = FOREIGN_KEYS,
          full_columns = FULL_COLUMNS,
          count = COUNT,
          explain = "EXPLAIN ANALYZE {last_query}",
          insert = INSERT,
          update = UPDATE,
          delete = DELETE_FROM_TABLE,
          drop = DROP_TABLE,
          dt = DT,
          d = D,
        }
      }
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
