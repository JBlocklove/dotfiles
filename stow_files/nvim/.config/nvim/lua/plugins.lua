cmd [[packadd packer.nvim]]

packer = require('packer')

return packer.startup(function()

	-- Packer manages itself
	use { 'wbthomason/packer.nvim' }

	-- Colorscheme
	use { 'shaunsingh/moonlight.nvim' }

	-- Statusline
	use {
		'nvim-lualine/lualine.nvim',
		config = function() require('statusline').setup() end,
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	-- Bufferline
	use {
	  'romgrk/barbar.nvim',
	  requires = {'kyazdani42/nvim-web-devicons'}
	}


--	-- Treesitter
--	use { 'nvim-treesitter/nvim-treesitter' }
--	use {
--		'p00f/nvim-ts-rainbow',
--		'windwp/nvim-ts-autotag',
--		'romgrk/nvim-treesitter-context',
--		requires = { 'nvim-treesitter/nvim-treesitter' }
--	}
--
--	-- LSP plugins
--	use { 'neovim/nvim-lspconfig' }
--
--	-- Completion
--	use { 'hrsh7th/nvim-cmp' }
--
--	-- Snippets
--	use { 'SirVer/ultisnips' }
--	use {
--		'honza/vim-snippets',
--		requires = { 'SirVer/ultisnips' }
--	}
--
--	-- Tree for files
--	use {
--		'kyazdani42/nvim-tree.lua',
--		requires = { 'kyazdani42/nvim-web-devicons' },
--		config = function() require'nvim-tree'.setup {} end
--	}
--
--	-- Git signs for the gutter
--	use {
--		'lewis6991/gitsigns.nvim',
--		requires = { 'nvim-lua/plenary.nvim' }
--	}

	---- Markdown stuff
	--use {
	--	'iamcco/markdown-preview.nvim',
    --	run = "call mkdp#util#install()",
    --	ft = 'markdown'
	--}

	---- LaTeX stuff
	--use {
	--	'lervag/vimtex',
    --	ft= 'tex',
    --	opt=true
	--}

	---- VHDL stuff
	--use {
	--	'JBlocklove/vip',
	--	ft='vhdl',
	--	opt=true
	--}

end)
