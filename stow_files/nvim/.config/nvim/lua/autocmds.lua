local autocommands = {}

defined_autocommands = {
	_general_settings = {
		{
			"BufWinEnter",
			"*",
			"setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
		},
		{
			"BufWinEnter",
			"dashboard",
			"setlocal cursorline signcolumn=yes cursorcolumn number",
		},
		{
			"BufRead",
			"*",
			"setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
		},
		{
			"BufNewFile",
			"*",
			"setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
		},
		{
			"FileType",
			"qf",
			"set nobuflisted",
		},
		{
			"VimLeavePre",
			"*",
			"set title set titleold="
		},
		{
			"BufWritePre",
			"*",
			":%s/\\s\\+$//e",
		},
	},
	_filetypechanges = {
		{ "BufWinEnter", ".zsh", "setlocal filetype=sh" },
		{ "BufRead", "*.zsh", "setlocal filetype=sh" },
		{ "BufNewFile", "*.zsh", "setlocal filetype=sh" },
	},
	_git = {
		{ "FileType", "gitcommit", "setlocal wrap" },
		{ "FileType", "gitcommit", "setlocal spell" },
	},
	_markdown = {
		{ "FileType", "markdown", "setlocal wrap" },
		{ "FileType", "markdown", "setlocal spell" },
	},
	_buffer_bindings = {
		{ "FileType", "floaterm", "nnoremap <silent> <buffer> q :q<CR>" },
	},
	_auto_resize = {
		-- will cause split windows to be resized evenly if main window is resized
		{ "VimResized", "*", "wincmd =" },
	},
	_packer_compile = {
		-- will run PackerCompile after writing plugins.lua
		{ "BufWritePost", "plugins.lua", "PackerCompile" },
	},
	_general_lsp = {
		{ "FileType", "lspinfo", "nnoremap <silent> <buffer> q :q<CR>" },
	},
	_latex = {
		{ "BufWinEnter", "*.tex", ":VimtexCompile"},
		{ "User", "VimtexEventQuit", "call system('latexmk -c')"},
		{"FileType", "*.tex", "setlocal spell"}
	},
	_mail = {
		{"FileType", "*.mail", "setlocal spell"}
	},
	custom_groups = {},
}

function autocommands.define_augroups(definitions) -- {{{1
	-- Create autocommand groups based on the passed definitions
	--
	-- The key will be the name of the group, and each definition
	-- within the group should have:
	--    1. Trigger
	--    2. Pattern
	--    3. Text
	-- just like how they would normally be defined from Vim itself
	for group_name, definition in pairs(definitions) do
		vim.cmd("augroup " .. group_name)
		vim.cmd "autocmd!"

		for _, def in pairs(definition) do
			local command = table.concat(vim.tbl_flatten { "autocmd", def }, " ")
			vim.cmd(command)
		end

		vim.cmd "augroup END"
	end
end

return autocommands