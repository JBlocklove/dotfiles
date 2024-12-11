return {

	-- Copilot
	{
		"github/copilot.vim",
		config = function()
			vim.keymap.set('i', '<Right>', 'copilot#Accept("")', {
				silent = true,
				expr = true,
				replace_keycodes = false,
			})
			vim.keymap.del('i', '<Tab>')
			--vim.keymap.set('i', '<Tab>', , {
			--	expr = true,
			--	replace_keycodes = false,
			--})
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_assume_mapped = true
			vim.g.copilot_tab_fallback = ""
			--vim.cmd [[
			--  imap <silent><script><expr> <C-S-l> copilot#Accept("\<CR>")
			--  let g:copilot_no_tab_map = v:true
			--]]
			vim.g.copilot_filetypes = {
			  ["tex"] = false,
			  ["mail"] = false,
			  ["markdown"] = false,
			  ["text"] = false,
			}
		end,
	},

}
