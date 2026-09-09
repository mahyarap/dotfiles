local spell = vim.api.nvim_create_augroup("spell", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "FileType", "WinEnter" }, {
  group = spell,
  callback = function(args)
    vim.wo.spell = vim.bo[args.buf].filetype == "gitcommit"
  end,
})
