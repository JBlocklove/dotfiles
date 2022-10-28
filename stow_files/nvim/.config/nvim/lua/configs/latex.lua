local M = {}

M.setup = function()
	vim.g.tex_flavor = 'latex'
	vim.g.vimtex_fold_enabled = '1'
	vim.g.vimtex_fold_manual = '1'
	vim.g.compiler_method = 'latexmk'
	vim.g.vimtex_view_method = 'zathura'
	--vim.g.vimtex_view_forward_search_on_start = '0'
end

return M

