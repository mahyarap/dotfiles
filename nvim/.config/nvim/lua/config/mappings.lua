-- Map <leader> to space
vim.g.mapleader = " "

-- Don"t use Ex mode, use Q for formatting
vim.api.nvim_set_keymap("n", "Q", "gq", {noremap = false, silent = false})

-- Spell check toggle
vim.api.nvim_set_keymap("n", "<leader>sp", ":set spell!<CR>", {noremap = true, silent = true})

-- Buffer switch
vim.api.nvim_set_keymap("i", "<C-left>", "<esc>:bprev<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-right>", "<esc>:bnext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-right>", ":bnext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-left>", ":bprev<CR>", {noremap = true, silent = true})

-- Window switch
vim.api.nvim_set_keymap("n", "<S-up>", "<C-W><up>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<S-down>", "<C-W><down>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<S-left>", "<C-W><left>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<S-right>", "<C-W><right>", {noremap = true, silent = true})

-- Short cut to edit and source vimrc
vim.api.nvim_set_keymap("n", "<leader>ev", ":edit $MYVIMRC<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>sv", ":source $MYVIMRC<CR>", {noremap = true, silent = false})

-- Abbreviations to prevent typos in command mode
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev Wa wa")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Qa qa")


-- Helper to check if LSP omnifunc is available
local function has_lsp_omnifunc()
  return vim.bo.omnifunc == "v:lua.vim.lsp.omnifunc"
end

-- Map <C-Space> in insert mode
vim.keymap.set("i", "<C-Space>", function()
  if has_lsp_omnifunc() then
    -- Trigger LSP omnifunc completion
    return "<C-x><C-o>"
  else
    -- Fallback: trigger normal insert completion
    return "<C-n>"
  end
end,
  {expr = true, silent = true}
)

-- <Tab>/<S-Tab>: cycle items if menu is open, else insert tabs normally
vim.keymap.set("i", "<Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end,
  {expr = true, silent = true}
)

vim.keymap.set("i", "<S-Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end,
  {expr = true, silent = true}
)

-- <CR>: confirm selection if menu is open, else newline
vim.keymap.set("i", "<CR>", function()
  return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
end,
  {expr = true, silent = true}
)

-- <Esc>: close the menu if open, else normal escape
vim.keymap.set("i", "<Esc>", function()
  return vim.fn.pumvisible() == 1 and "<C-e><Esc>" or "<Esc>"
end,
  {expr = true, silent = true}
)
