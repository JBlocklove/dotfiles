local M = {}

M.setup = function()
	vim.g.bufferline = {
		closable = false,
		clickable = false,
		icon_separator_active = '▎',
		icon_separator_inactive = '▎',
		icon_close_tab = '',
		icon_close_tab_modified = '●',
		icon_pinned = '車',
	}
end

return M
