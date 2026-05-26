local clangd_cmd = {
  "clangd",
  "--background-index",
  "--pch-storage=memory",
  "--clang-tidy",
  -- "--log=verbose",
}

local esp32s3_gcc = vim.fn.expand("~/.espressif/tools/xtensa-esp-elf/esp-14.2.0_20241119/xtensa-esp-elf/bin/xtensa-esp32s3-elf-gcc")
if vim.fn.executable(esp32s3_gcc) == 1 then
  table.insert(clangd_cmd, "--query-driver=" .. esp32s3_gcc)
end

vim.lsp.config.clangd = {
  cmd = clangd_cmd,
}

local jdtls_cmd = { "jdtls" }
local java_executable = vim.fn.expand("~/.sdkman/candidates/java/21.0.6-amzn/bin/java")
if vim.fn.executable(java_executable) == 1 then
  vim.list_extend(jdtls_cmd, { "--java-executable", java_executable })
end

vim.lsp.config.jdtls = {
  cmd = jdtls_cmd,
}

vim.lsp.enable({
  "pyright",
  "clangd",
  "gopls",
  "jdtls",
  "zls",
  "rust_analyzer",
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
