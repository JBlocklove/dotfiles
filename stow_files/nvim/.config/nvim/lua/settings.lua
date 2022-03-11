CONFIG_PATH = os.getenv "XDG_CONFIG_HOME" .. "/nvim/"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
USER = vim.fn.expand "$USER"

--cmd [[ set spellfile=~/.config/nvim/spell/en.utf-8.add ]]

local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 2, -- more space in the neovim command line for displaying messages
	colorcolumn = "99999", -- fixes indentline for now
	completeopt = { "menuone", "noselect" },
	conceallevel = 0, -- so that `` is visible in markdown files
	confirm = true,
	fileencoding = "utf-8", -- the encoding written to a file
	foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
	foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
	hidden = true, -- required to keep multiple buffers and open multiple buffers
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
	title = true, -- set the title of window to the value of the titlestring
	titlestring = "%<%F%=%l/%L - nvim", -- what the title of the window will be set to
	undodir = CACHE_PATH .. "/undo", -- set an undo directory
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = false, -- convert tabs to spaces
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	tabstop = 4, -- insert 2 spaces for a tab
	softtabstop = 4, -- insert 2 spaces for a tab
	cursorline = false, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = true, -- display lines as one long line
	spell = false,
	spelllang = "en",
	scrolloff = 5,
	sidescrolloff = 8,
	gdefault = true,
	incsearch = true,
	showmatch = true,
	autoindent = true,
	autoread = true,
	undolevels = 1000,
	udf = true,

}

opt.shortmess:append "c"

-- Loop to set all options
for k, v in pairs(options) do
	vim.opt[k] = v
end

--require("mappings").config()

-- transparent window overrides
cmd "au ColorScheme * hi Normal ctermbg=none guibg=none"
cmd "au ColorScheme * hi SignColumn ctermbg=none guibg=none"
cmd "au ColorScheme * hi NormalNC ctermbg=none guibg=none"
cmd "au ColorScheme * hi MsgArea ctermbg=none guibg=none"
cmd "au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none"
cmd "let &fcs='eob: '"

--if nvim.colorscheme == "moonlight" then
--	-- Fix fold colors
--	cmd "au ColorScheme * hi Folded ctermfg=233 guifg=#a1abe0"
--	vim.g.moonlight_disable_background = true
--end
