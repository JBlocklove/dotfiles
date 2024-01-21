return {

	-- Copilot
	{
		"github/copilot.vim",
		config = function()
			vim.cmd [[
			  imap <silent><script><expr> <C-l> copilot#Accept("\<CR>")
			  let g:copilot_no_tab_map = v:true
			]]
			vim.g.copilot_filetypes = {
			  ["tex"] = false,
			  ["mail"] = false,
			  ["markdown"] = false,
			  ["text"] = false,
			}
		end,
	},

}
