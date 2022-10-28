local M = {}

M.setup = function()

	require('toggleterm').setup {
		size = 20,
		open_mapping = [[<c-\>]],
		hide_numbers = true,
		shade_filetypes = {},
		shade_terminals = true,
		start_in_insert = true,
		persist_size = true,
		direction = 'float',
		close_on_exit = true,
	}

end

return M
