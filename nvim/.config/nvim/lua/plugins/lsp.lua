require('mason').setup()
local mason_registry = require('mason-registry')

local tools = {
  'pyright',
  'gopls',
  'zls',
  'clangd',
}

for _, tool in ipairs(tools) do
  local package = mason_registry.get_package(tool)
  if not package:is_installed() then
    package:install()
  end
end

local lsp = require('lspconfig')
lsp.pylsp.setup({
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          -- ignore = {'W391'},
          maxLineLength = 100,
        },
      },
    },
  },
})
lsp.gopls.setup({})
lsp.zls.setup({})
lsp.clangd.setup({})
