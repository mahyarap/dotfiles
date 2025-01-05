require('config.paq')
require('config.uiux')
require('config.mappings')
require('config.formatting')
require('plugins.lsp')
require('plugins.lint')
require('plugins.telescope')
require('plugins.autopairs')

-- vim.diagnostic.config({
--     virtual_text = false,
--     float = true,
-- })


-- vim.api.nvim_create_augroup('indentation', {})
-- vim.api.nvim_create_autocmd('Filetype', {
-- 	group = 'indentation',
-- 	pattern = 'go',
-- 	command = 'setlocal tabstop=4 shiftwidth=4 noexpandtab',
-- })

-- require('nvim-autopairs').setup({})
