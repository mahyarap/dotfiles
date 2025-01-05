-- Map <leader> to space
vim.g.mapleader = ' '

-- Don't use Ex mode, use Q for formatting
vim.api.nvim_set_keymap('n', 'Q', 'gq', { noremap = false, silent = false })

-- Spell check toggle
vim.api.nvim_set_keymap('n', '<leader>sp', ':set spell!<CR>', { noremap = true, silent = true })

-- Map CTRL-SPACE for autocompletion in insert mode
vim.api.nvim_set_keymap('i', '<C-SPACE>', '<C-N>', { noremap = true, silent = true })

-- Ensure menu item always highlighted during autocompletion
vim.api.nvim_set_keymap('i', '<C-SPACE>', "pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? \"\\<lt>Down>\" : \"\"<CR>'", { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-N>', "pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? \"\\<lt>Down>\" : \"\"<CR>'", { noremap = true, silent = true, expr = true })
-- vim.api.nvim_set_keymap('i', '<C-X><C-N>', 'pumvisible() ? "<C-x><C-n>" : "<C-x><C-n><C-r>=pumvisible() ? \'<lt>Down>\' : \'\'<CR>"', { noremap = true, silent = true, expr = true })
-- vim.api.nvim_set_keymap('i', '<C-X><C-O>', 'pumvisible() ? "<C-x><C-o>" : "<C-x><C-o><C-r>=pumvisible() ? \'<lt>Down>\' : \'\'<CR>"', { noremap = true, silent = true, expr = true })

-- Man page plugin map
-- vim.api.nvim_set_keymap('n', '<leader>m', '<leader>K', { noremap = false, silent = false })

-- Buffer switch
vim.api.nvim_set_keymap('i', '<C-left>', '<esc>:bprev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-right>', '<esc>:bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-right>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-left>', ':bprev<CR>', { noremap = true, silent = true })

-- Window switch
vim.api.nvim_set_keymap('n', '<S-up>', '<C-W><up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-down>', '<C-W><down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-left>', '<C-W><left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-right>', '<C-W><right>', { noremap = true, silent = true })

-- Short cut to edit and source vimrc
vim.api.nvim_set_keymap('n', '<leader>ev', ':edit $MYVIMRC<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sv', ':source $MYVIMRC<CR>', { noremap = true, silent = false })

-- Abbreviations to prevent typos in command mode
vim.cmd('cnoreabbrev W w')
vim.cmd('cnoreabbrev Wq wq')
vim.cmd('cnoreabbrev Wa wa')
vim.cmd('cnoreabbrev Q q')
vim.cmd('cnoreabbrev Qa qa')

-- Better command line history navigation
-- vim.api.nvim_set_keymap('c', '<C-n>', '<down>', { noremap = true, silent = false })
-- vim.api.nvim_set_keymap('c', '<C-p>', '<up>', { noremap = true, silent = false })
