local status, jdtls = pcall(require, "jdtls")
if (not status) then
  print("Not found LSP!")
  return
end

local config = {
  -- cmd = { '/path/to/jdt-language-server/bin/jdtls' },
  cmd = { '/Users/fedka/config/jdt-language-server-1.19.0-202301090450/bin/jdtls' },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}

jdtls.start_or_attach(config)
-- require('jdtls').start_or_attach(config)
