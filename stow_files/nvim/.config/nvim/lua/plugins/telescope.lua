return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				}

			})
		end,
	},
	{
		"princejoogie/dir-telescope.nvim",
		after = "telescope.nvim",
		config = function()
			require("dir-telescope").setup({
				hidden = true,
				show_preview = true,
				follow_symlinks = true,
			})
		end,
	},
}


