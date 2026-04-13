vim.lsp.config.clangd = {
  cmd = {
    "clangd",
    "--background-index",
    "--pch-storage=memory",
    "--clang-tidy",
    "--query-driver=/home/mahyar/.espressif/tools/xtensa-esp-elf/esp-14.2.0_20241119/xtensa-esp-elf/bin/xtensa-esp32s3-elf-gcc",
    -- "--log=verbose",
  },
}

vim.lsp.config.jdtls = {
  cmd = {
    "jdtls",
    "--java-executable",
    vim.fn.expand("~/.sdkman/candidates/java/21.0.6-amzn/bin/java")
  },
}

vim.lsp.enable({
  "pyright",
  "clangd",
  "gopls",
  "jdtls",
  "zls",
})

-- Turn on native LSP completion when a server attaches
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local id = args.data.client_id
    if vim.lsp.get_client_by_id(id) then
      vim.lsp.completion.enable(true, id, args.buf, { autotrigger = false })
    end
  end,
})

-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     vim.defer_fn(function()
--       vim.lsp.semantic_tokens.force_refresh(args.buf)
--     end, 100)
--   end,
-- })
