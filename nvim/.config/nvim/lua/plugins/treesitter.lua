require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "python",
    "go",
  },
  indent = { enable = true },
})
