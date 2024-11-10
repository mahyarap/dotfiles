local actions = require('telescope.actions')
require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = actions.close,
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
            },
        },
    },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', function() builtin.git_files({ show_untracked = true, }) end, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', 'gd', builtin.lsp_definitions, { noremap = true, })
