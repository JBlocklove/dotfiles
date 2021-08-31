local M = {}

M.setup = function()
	vim.g.UltiSnipsExpandTrigger = "<C-j>"
	vim.g.UltiSnipsJumpForwardTrigger= "<C-j>"
	vim.g.UltiSnipsJumpBackwardTrigger= "<C-k>"
	vim.g.UltiSnipsSnippetDirectories= "['UltiSnips']"
end

return M
