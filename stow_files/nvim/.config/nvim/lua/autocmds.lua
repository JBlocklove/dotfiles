local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- augroups
local general_settings = augroup("general_settings", {})
local auto_resize = augroup("auto_resize", {})
local file_type_changes = augroup("file_type_changes", {})
local git = augroup("git", {})
local markdown = augroup("markdown", {})
local latex = augroup("latex", {})
local lsp = augroup("lsp", {})

-- autocmds
autocmd(
	{"BufWinEnter"},
	{
		group = general_settings,
		pattern = "*",
		command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
	}
)
autocmd(
	{"BufRead"},
	{
		group = general_settings,
		pattern = "*",
		command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
	}
)
autocmd(
	{"BufNewFile"},
	{
		group = general_settings,
		pattern = "*",
		command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
	}
)
autocmd(
	{"FileType"},
	{
		group = general_settings,
		pattern = "qf",
		command = "set nobuflisted",
	}
)
autocmd(
	{"VimLeavePre"},
	{
		group = general_settings,
		pattern = "*",
		command = "set title titleold=",
	}
)
autocmd(
	{"BufWritePre"},
	{
		group = general_settings,
		pattern = "*",
		command = ":%s/\\s\\+$//e",
	}
)

autocmd(
	{"VimResized"},
	{
		group = auto_resize,
		pattern = "*",
		command = "wincmd =",
	}
)

autocmd(
	{"BufWinEnter"},
	{
		group = file_type_changes,
		pattern = ".zsh",
		command = "setlocal filetype=sh",
	}
)
autocmd(
	{"BufRead"},
	{
		group = file_type_changes,
		pattern = "*.zsh",
		command = "setlocal filetype=sh",
	}
)
autocmd(
	{"BufNewFile"},
	{
		group = file_type_changes,
		pattern = "*.zsh",
		command = "setlocal filetype=sh",
	}
)

autocmd(
	{"FileType"},
	{
		group = git,
		pattern = "gitcommit",
		command = "setlocal wrap",
	}
)
autocmd(
	{"FileType"},
	{
		group = git,
		pattern = "gitcommit",
		command = "setlocal spell",
	}
)

autocmd(
	{"FileType"},
	{
		group = markdown,
		pattern = "markdown",
		command = "setlocal wrap",
	}
)
autocmd(
	{"FileType"},
	{
		group = markdown,
		pattern = "markdown",
		command = "setlocal spell",
	}
)

autocmd(
	{"BufWinEnter"},
	{
		group = latex,
		pattern = "*.tex",
		command = ":VimtexCompile",
	}
)
autocmd(
	{"User"},
	{
		group = latex,
		pattern = "VimtexEventQuit",
		command = "call system('latexmk -c')",
	}
)
autocmd(
	{"FileType"},
	{
		group = latex,
		pattern = "*.tex",
		command = "set nospell",
	}
)

autocmd(
	{"LspAttach"},
	{
		group = lsp,
		callback = function(ev)
			local opts = { buffer = ev.buf }
			vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
			vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
			--vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
			vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
			vim.keymap.set("n", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
			--vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
			vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
			vim.keymap.set("n", "<leader>ad", '<cmd>lua vim.diagnostic.open_float({ border = "single" })<CR>', opts)
			vim.keymap.set("n", "[d", function() require("trouble").open("diagnostics") require("trouble").prev({skip_groups = true, jump = true}) end, opts)
			vim.keymap.set("n", "]d", function() require("trouble").open("diagnostics") require("trouble").next({skip_groups = true, jump = true}) end, opts)
			vim.keymap.set("n", "<leader>al", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
			vim.keymap.set("n", "<leader>af", "<cmd>lua vim.lsp.buf.format{async=true}<CR>", opts)

		end,
	}
)
