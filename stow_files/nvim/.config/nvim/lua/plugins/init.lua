return{

	-- Colors
	{
		"moonlight",
		dir="/home/jason/repos/nvim-plugins/moonlight.nvim",
		lazy=true,
	},
	{ "norcalli/nvim-colorizer.lua" },

	-- Icons
	{
		"nvim-tree/nvim-web-devicons",
		lazy=true,
		name="icons",
	},

	-- Plenary
	{ "nvim-lua/plenary.nvim" },

	-- Floating windows
	{ "nvim-lua/popup.nvim" },

	-- Snippets
	{
		"SirVer/ultisnips",
		name = "ultisnips",
	},
	{
		"quangnguyen30192/cmp-nvim-ultisnips",
		dependencies = { "ultisnips"} ,
	},
	{
		"honza/vim-snippets",
		dependencies = { "ultisnips" },
	},

	-- Git signs for the gutter
	{
		"lewis6991/gitsigns.nvim",
		dependencies= { "nvim-lua/plenary.nvim" },
		config = function() require("gitsigns").setup() end,

	},


	-- VHDL stuff
	{
		"JBlocklove/vip",
		ft="vhdl",
		lazy=true
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"jinh0/eyeliner.nvim",
		config = function()
			require("eyeliner").setup({
				highlight_on_key=true,
				dim = true,
			})
		end
	},

}
