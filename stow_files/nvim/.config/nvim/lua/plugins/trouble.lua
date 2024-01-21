return {
	-- Trouble
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("trouble").setup({
				height = 7,
				auto_close = true,
			})
		end,
	},
}
