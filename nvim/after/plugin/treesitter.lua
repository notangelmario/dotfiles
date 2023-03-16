require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "c", "rust", "lua", "python" },
  highlight = {
	enable = true,
  },
  indent = {
	enable = true
  }
}
