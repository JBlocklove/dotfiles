local M = {}

M.setup = function()
	vim.g.catppuccin_flavour = "latte"
	require('catppuccin').setup({
		transparent_background = true,
	})
end

return M
