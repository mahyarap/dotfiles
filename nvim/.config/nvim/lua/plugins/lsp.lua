require('mason').setup()
local mason_registry = require('mason-registry')

local tools = {
  'clangd',
  'pyright',
  'gopls',
  'shellcheck',
  'ruff',
}
for _, tool in ipairs(tools) do
  local package = mason_registry.get_package(tool)
  if not package:is_installed() then
    package:install()
  end
end

lsp = require('lspconfig')
lsp.clangd.setup({
  cmd = {
    'clangd',
    '--background-index',
    '--pch-storage=memory',
    '--clang-tidy',
    '--query-driver=/home/mahyar/.espressif/tools/xtensa-esp-elf/esp-14.2.0_20241119/xtensa-esp-elf/bin/xtensa-esp32s3-elf-gcc',
    -- '--log=verbose',
  },
})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.c', '*.h', '*.go' },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

lsp.pyright.setup({})

local go_fmt_grp = vim.api.nvim_create_augroup('GoFormatOnSave', { clear = true })
lsp.gopls.setup({})

-------

-- Helper to check if LSP omnifunc is available
local function has_lsp_omnifunc()
  return vim.bo.omnifunc == 'v:lua.vim.lsp.omnifunc'
end

-- Map <C-Space> in insert mode
vim.keymap.set('i', '<C-Space>', function()
  if has_lsp_omnifunc() then
    -- Trigger LSP omnifunc completion
    return '<C-x><C-o>'
  else
    -- Fallback: trigger normal insert completion
    return '<C-n>'
  end
end, { expr = true, silent = true })

-- <Tab>/<S-Tab>: cycle items if menu is open, else insert tabs normally
vim.keymap.set("i", "<Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true, silent = true })

vim.keymap.set("i", "<S-Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true, silent = true })

-- <CR>: confirm selection if menu is open, else newline
vim.keymap.set("i", "<CR>", function()
  return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
end, { expr = true, silent = true })

-- <Esc>: close the menu if open, else normal escape
vim.keymap.set("i", "<Esc>", function()
  return vim.fn.pumvisible() == 1 and "<C-e><Esc>" or "<Esc>"
end, { expr = true, silent = true })
