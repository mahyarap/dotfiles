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

-- Abbreviations to prevent typos in command mode
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev Wa wa")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Qa qa")

vim.keymap.set("i", "<C-Space>", function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })

  for _, client in ipairs(clients) do
    if client:supports_method("textDocument/completion") then
      -- Trigger LSP completion through built-in omni completion
      return vim.api.nvim_replace_termcodes("<C-x><C-o>", true, false, true)
    end
  end

  -- Fallback to built-in keyword completion
  return vim.api.nvim_replace_termcodes("<C-n>", true, false, true)
end,
  { expr = true, silent = true, desc = "LSP completion or keyword fallback" }
)

vim.keymap.set("n", "<F5>", ":NERDTreeToggle<CR>", { noremap = true, silent = true })
