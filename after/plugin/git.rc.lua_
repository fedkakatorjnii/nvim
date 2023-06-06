local status, git = pcall(require, "git")
if (not status) then
  print("Not found git!")
  return
end

git.setup({
  keymaps = {
    -- Open blame window
    blame = "<Leader>gb",
    -- Open file/folder in git repository
    browse = "<Leader>go",
  }
})
