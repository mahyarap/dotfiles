require('mason').setup()
local mason_registry = require("mason-registry")

local tools = {
    'pyright',
    'gopls',
    'shellcheck',
    'jdtls',
}
for _, tool in ipairs(tools) do
    local package = mason_registry.get_package(tool)
    if not package:is_installed() then
        package:install()
    end
end

lsp = require('lspconfig')
lsp.pyright.setup({})
lsp.gopls.setup({})
lsp.jdtls.setup({
  cmd = { 'jdtls', '--java-executable', vim.fn.expand('~/.sdkman/candidates/java/21.0.6-amzn/bin/java') }, 
})
