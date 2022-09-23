local M = {}

M.setup = function()
	vim.g.tex_flavor = 'latex'
	vim.g.vimtex_fold_enabled = '1'
	vim.g.vimtex_fold_manual = '1'
	vim.g.vimtex_toc_fold = '1'
	vim.g.vimtex_compiler_progname = 'nvr'
	vim.g.vimtex_view_general_viewer = 'zathura'
end

return M

