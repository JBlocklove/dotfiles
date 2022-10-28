local M = {}

M.setup = function()
	--vim.g.mkdp_auto_start = 1
	-- vim.api.nvim_set_var('mkdp_auto_start', 1)
	vim.cmd [[
 	  let g:mkdp_auto_start = 1
 	]]
end

return M
