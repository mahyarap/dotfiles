local gh = function(repo)
  return "https://github.com/" .. repo
end

vim.pack.add {
  gh("mahyarap/badwolf"),
  gh("lifepillar/vim-solarized8"),
  gh("nvim-lua/plenary.nvim"),
  gh("nvim-telescope/telescope.nvim"),
  gh("tpope/vim-fugitive"),
  gh("williamboman/mason.nvim"),
  gh("neovim/nvim-lspconfig"),
  gh("airblade/vim-gitgutter"),
  gh("windwp/nvim-autopairs"),
  gh("mfussenegger/nvim-lint"),
  gh("nvim-treesitter/nvim-treesitter"),
  gh("nvim-treesitter/nvim-treesitter-context"),
  gh("tpope/vim-rsi"),
  gh("stevearc/conform.nvim"),
  gh("preservim/nerdtree"),
}
