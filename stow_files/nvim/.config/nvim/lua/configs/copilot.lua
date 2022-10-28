local M = {}

M.setup = function()
	vim.cmd [[
 	  imap <silent><script><expr> <C-P> copilot#Accept("\<CR>")
 	  let g:copilot_no_tab_map = v:true
 	]]
	vim.g.copilot_filetypes = {
 	  ["tex"] = false,
 	  ["mail"] = false,
 	  ["markdown"] = false,
 	  ["text"] = false,
 	}
end

return M
