vim.cmd("packadd packer.nvim")

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
	'nvim-telescope/telescope.nvim', tag = '0.1.0',
	-- or                            , branch = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { "ellisonleao/gruvbox.nvim" }

  use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
		  'nvim-tree/nvim-web-devicons', -- optional, for file icons
	  },
	  tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use({
	  'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate',
  })

  use({
      "iamcco/markdown-preview.nvim", 
      run = "cd app && npm install",
      setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
      ft = { "markdown" }, 
  })

  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
	  require("toggleterm").setup()
  end}

  use {'neoclide/coc.nvim', branch = 'release'}
  use 'tpope/vim-commentary'

  use 'neovim/nvim-lspconfig'
  use 'github/copilot.vim'

  use 'nvim-tree/nvim-web-devicons'
  use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}
end)
