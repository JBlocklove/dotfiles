return {

	-- Markdown stuff
	{
		'iamcco/markdown-preview.nvim',
    	build = function() vim.fn["mkdp#util#install"]() end,
    	ft = 'markdown',
		config = function()
			--vim.g.mkdp_auto_start = 1
			--vim.api.nvim_set_var('mkdp_auto_start', 1)
			vim.cmd [[
			  let g:mkdp_auto_start = 1
			]]
		end,
		lazy=true
	},

}
