return{

	-- Colors
	{
		"ghostmatter",
		dir="/home/jason/repos/nvim-plugins/ghostmatter.nvim",
		--lazy=true,
	},
	{
		"catppuccin/nvim",
		name = "catpuccin",
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end
	},


	-- Icons
	{
		"nvim-tree/nvim-web-devicons",
		lazy=true,
		name="icons",
	},

	-- Plenary
	{ "nvim-lua/plenary.nvim" },

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
		"jinh0/eyeliner.nvim",
		config = function()
			require("eyeliner").setup({
				highlight_on_key=true,
				dim = true,
			})
		end
	},

}
