cmd [[packadd packer.nvim]]
packer = require('packer')

return packer.startup(function()

	-- Packer manages itself
	use { 'wbthomason/packer.nvim' }

	-- Colorscheme
	use { '/home/jason/Repos/moonlight.nvim' }
	use { 'catppuccin/nvim', as = 'catppuccin' }
	use {
		'norcalli/nvim-colorizer.lua',
		--config = function() require('colorizer').setup() end,
	}

	-- Icons
	use { 'nvim-tree/nvim-web-devicons' }

	-- Floating windows
	use { 'nvim-lua/popup.nvim' }

	-- Statusline
	use {
		'nvim-lualine/lualine.nvim',
		requires = {'nvim-tree/nvim-web-devicons', opt = true},
		config = function() require('configs.lualine').setup() end,
	}

	-- Bufferline
	use {
		'akinsho/bufferline.nvim',
		requires = {'nvim-tree/nvim-web-devicons'},
		config = function() require('configs.bufferline').setup() end,
	}

	-- LSP plugins
	use {
		'williamboman/mason.nvim',
		config = function() require('configs.mason').setup() end,
	}
	use {
		'williamboman/mason-lspconfig.nvim',
		config = function() require('configs.mason-lspconfig').setup() end,
	}
	use { 'neovim/nvim-lspconfig' }

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function() require('configs.treesitter').setup() end,
	}
	--use { 'windwp/nvim-ts-autotag' }
	use { 'nvim-treesitter/playground' }

	-- Navic for context
	use {
		'SmiteshP/nvim-navic',
		requires = {'neovim/nvim-lspconfig'},
		config = function() require('configs.navic').setup() end,
	}

	-- Completion
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-path' }
	use { 'hrsh7th/cmp-cmdline' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-nvim-lua' }
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

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function() require('configs.telescope').setup() end,
	}

	-- Tree for files
	use {
		'nvim-tree/nvim-tree.lua',
		requires = { 'nvim-tree/nvim-web-devicons' },
		config = function() require('configs.nvim-tree').setup() end
	}

	-- Git signs for the gutter
	use {
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function() require('gitsigns').setup() end
	}

	---- Toggleterm
	--use {
	--	'akinsho/toggleterm.nvim',
	--	config = function() require('configs.toggleterm').setup() end,
	--}

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

	-- papis
	--use {
	--	'jghauser/papis.nvim',
	--	after = { 'telescope.nvim', 'nvim-cmp' },
	--	requires = {
	--		'kkharji/sqlite.lua',
	--		'nvim-lua/plenary.nvim',
	--		'MunifTanjim/nui.nvim',
	--		'nvim-treesitter/nvim-treesitter',
	--	},
	--	rocks = {
	--		{
	--			'lyaml',
	--		}
	--	},
	--	config = function() require('configs.papis').setup() end,
	--}



	-- VHDL stuff
	use {
		'JBlocklove/vip',
		ft='vhdl',
		opt=true
	}

	-- Random stuff to play with
	use {
		'github/copilot.vim',
		config = function() require('configs.copilot').setup() end,
	}

	--use {
	--	'utilyre/sentiment.nvim',
	--	config = function() require('configs.sentiment').setup() end,
	--}

	--use {
	--	'olimorris/persisted.nvim',
	--	config = function() require('configs.persisted').setup() end,
	--}

	--use {
	--	'gorbit99/codewindow.nvim',
	--	config = function() require('configs.codewindow').setup() end,
	--}

end)
