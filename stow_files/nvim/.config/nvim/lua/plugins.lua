cmd [[packadd packer.nvim]]
packer = require('packer')

return packer.startup(function()

	-- Packer manages itself
	use { 'wbthomason/packer.nvim' }

	-- Colorscheme
	use { '/home/jason/Repos/moonlight.nvim' }

	-- Icons
	use { 'kyazdani42/nvim-web-devicons' }

	-- Floating windows
	use { 'nvim-lua/popup.nvim' }

	-- Statusline
	use {
		'nvim-lualine/lualine.nvim',
		config = function() require('configs.lualine').setup() end,
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	-- Bufferline
	use {
		'akinsho/bufferline.nvim',
		tag="v2.*",
		requires = {'kyazdani42/nvim-web-devicons'},
		config = function() require('configs.bufferline').setup() end,
	}
	-- LSP plugins
	--use {
	--	'williamboman/mason.nvim',
	--	config = function() require('configs.mason').setup() end,
	--}
	--use {
	--	'williamboman/mason-lspconfig.nvim',
	--	config = function() require('configs.mason-lspconfig').setup() end,
	--}
	--use { 'neovim/nvim-lspconfig' }


	-- Treesitter
	--use {
	--	'nvim-treesitter/nvim-treesitter',
	--	config = function() require('configs.treesitter').setup() end,
	--}
	--use {
	--	'p00f/nvim-ts-rainbow',
	--	'windwp/nvim-ts-autotag',
	--	'romgrk/nvim-treesitter-context',
	--	requires = { 'nvim-treesitter/nvim-treesitter' }
	--}

	-- Completion
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-path' }
	use { 'hrsh7th/cmp-cmdline' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	use {
		'hrsh7th/nvim-cmp',
		config = function() require('configs.cmp').setup() end,
	}

	-- Snippets
	use { 'SirVer/ultisnips' }
	use {
		'honza/vim-snippets',
		requires = { 'SirVer/ultisnips' }
	}
	use {
		'quangnguyen30192/cmp-nvim-ultisnips',
		requires = { 'SirVer/ultisnips' }
	}

	-- Tree for files
	use {
		'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function() require('configs.nvim-tree').setup {} end
	}

	-- Git signs for the gutter
	use {
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function() require('gitsigns').setup() end
	}

	-- Markdown stuff
	use {
		'iamcco/markdown-preview.nvim',
    	run = function() vim.fn["mkdp#util#install"]() end,
    	ft = 'markdown',
		config = function() require('configs.markdown').setup() end,
		opt=true
	}

	-- LaTeX stuff
	use {
		'lervag/vimtex',
    	ft= 'tex',
		config = function() require('configs.latex').setup() end,
    	opt=true
	}

	-- VHDL stuff
	use {
		'JBlocklove/vip',
		ft='vhdl',
		opt=true
	}

end)
