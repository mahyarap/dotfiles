-- Indentation settings for using 4 spaces instead of tabs.
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.api.nvim_create_augroup("indentation", {clear = true})
vim.api.nvim_create_autocmd("FileType", {
    group = "indentation",
    pattern = {"lua", "ruby", "html", "vue", "yaml", "javascript"},
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    group = "indentation",
    pattern = {"c", "cpp", "go"},
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.expandtab = false
    end,
})

vim.opt.cinoptions = ":0"
