require("conform").setup({
  formatters_by_ft = {
    go = {"goimports", "gofmt"},
    zig = {"zigfmt"},
    rust = {"rustfmt"},
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})
