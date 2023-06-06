local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then
  print("Not found LSP!")
  return
end

-- java lsp server
-- nvim_lsp.java_language_server.setup {
--   cmd = {
--     "/Users/fedka/config/java-language-server/dist/lang_server_mac.sh"
--   }
-- }
nvim_lsp.java_language_server.setup {}
