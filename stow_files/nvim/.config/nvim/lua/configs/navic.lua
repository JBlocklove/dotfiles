local M = {}

M.setup = function()
	require('nvim-navic').setup{
		highlight = true,
		separator = " >> ",
		depth_limit = 0,
		depth_limit_indicator = "..",
	}
end

return M
