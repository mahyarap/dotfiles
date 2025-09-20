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
