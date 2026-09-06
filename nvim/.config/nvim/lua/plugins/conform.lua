require("conform").setup({
  formatters_by_ft = {
    go = { "goimports", "gofmt" },
    zig = { "zigfmt" },
    rust = { "rustfmt" },

    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    html = { "prettier" },
    markdown = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
