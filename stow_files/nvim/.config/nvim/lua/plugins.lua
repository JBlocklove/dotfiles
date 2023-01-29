cmd [[packadd packer.nvim]]
packer = require('packer')

return packer.startup(function()

	-- Packer manages itself
	use { 'wbthomason/packer.nvim' }

	-- Colorscheme
	use { '/home/jason/Repos/moonlight.nvim' }
	use {
		'norcalli/nvim-colorizer.lua',
		config = function() require('colorizer').setup() end,
	}
	use {
		'catppuccin/nvim',
		config = function() require('configs.catppuccin').setup() end,
	 }
	use {
		'baliestri/aura-theme',
		rtp = 'packages/neovim',
		--config = function() require('configs.aura').setup() end,
	}

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
	use { 'windwp/nvim-ts-autotag' }
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

	-- Tree for files
	use {
		'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function() require('configs.nvim-tree').setup() end
	}

	-- Git signs for the gutter
	use {
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function() require('gitsigns').setup() end
	}

	-- Toggleterm
	use {
		'akinsho/toggleterm.nvim',
		config = function() require('configs.toggleterm').setup() end,
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

	-- RISC-V Syntax
	use {
		'henry-hsieh/riscv-asm-vim',
		ft='riscv_asm',
		opt=true
	}

	-- Random stuff to play with
	use {
		'github/copilot.vim',
		config = function() require('configs.copilot').setup() end,
	}

	-- PlatformIO stuff
	use {
		'normen/vim-pio',
	}

end)
