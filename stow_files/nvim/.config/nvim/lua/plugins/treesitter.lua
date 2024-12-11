return {

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local servers = {
				"python",
				"lua",
				--"vhdl",
				-- "latex",
			}
			--local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
			--parser_config.vhdl = {
			--  install_info = {
			--    url = "~/Repos/tree-sitter-vhdl",
			--    files = {"src/parser.c"}
			--  },
			--  filetype = "vhdl"
			--}
			require("nvim-treesitter.configs").setup({
				ensure_installed = servers,
				highlight = {
					enable = true,
					disable = { "latex" },
					additional_vim_regex_highlighting = true,
				},
				indent = {
					enable = true,
					disable = { "yaml" },
				},
				autotag = { -- added by windwp/nvim-ts-autotag
					enable = true,
				},
				matchup = {
					enable = true,
				},
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		depends = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("treesitter-context").setup({
				line_numbers = true,
				separator = '─', -- U+2500
			})
		end,
	},
}
