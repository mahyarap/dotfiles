require('config.paq')
require('config.uiux')
require('config.mappings')
require('config.formatting')
require('plugins.lsp')
require('plugins.lint')
require('plugins.telescope')
require('plugins.autopairs')
require('plugins.treesitter')

-- vim.diagnostic.config({
--     virtual_text = false,
--     float = true,
-- })

vim.g.loaded_python3_provider = 0
-- require('treesitter-context').toggle()
