vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "zig",
  },
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end,
})
