require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {'pyright', 'gopls',}
})
require('lspconfig').pyright.setup({
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
            }
        }
    }
})
require('lspconfig').gopls.setup({})
