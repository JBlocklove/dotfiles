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

	local Terminal = require('toggleterm.terminal').Terminal
	local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
	local papis = Terminal:new({ cmd = "papis tui", hidden = true })

	function _LAZYGIT_TOGGLE()
		lazygit:toggle()
	end

	function _PAPIS_TOGGLE()
		papis:toggle()
	end

	vim.api.nvim_set_keymap("n", "<leader>lg", ":lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<leader>pa", ":lua _PAPIS_TOGGLE()<CR>", { noremap = true, silent = true })

end

return M
