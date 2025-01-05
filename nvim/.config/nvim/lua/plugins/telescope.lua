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
local is_inside_work_tree = {}
vim.keymap.set('n', '<leader>f', function()
  local cwd = vim.fn.getcwd()
  if is_inside_work_tree[cwd] == nil then
    vim.fn.system("git rev-parse --is-inside-work-tree")
    is_inside_work_tree[cwd] = vim.v.shell_error == 0
  end
  if is_inside_work_tree[cwd] then
    builtin.git_files({ show_untracked = true, })
  else
    builtin.find_files({})
  end
end, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', 'gd', builtin.lsp_definitions, { noremap = true, })
