local M = {}

local function map_key(mapping) --mode, key, val, opts)
	mode = mapping[1]
	key = mapping[2]
	val = mapping[3]
	opts = mapping[4]
	local options = {noremap = true, silent = true}
	if opts then
	  options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, key, val, options)
end

function M.map_key_list(keys)
	for _, mapping in ipairs(keys) do
		map_key(mapping)
	end
end

function M.setup()
	local keys = {
		-- Enforce purity
		{"i", "<Up>", "<Nop>"},
		{"i", "<Down>", "<Nop>"},
		{"i", "<Left>", "<Nop>"},
		{"i", "<Right>", "<Nop>"},
		{"n", "<Up>", "<Nop>"},
		{"n", "<Down>", "<Nop>"},
		{"n", "<Left>", "<Nop>"},
		{"n", "<Right>", "<Nop>"},

		-- Better window movement
		{"n", "<C-h>", "<C-w>h"},
		{"n", "<C-j>", "<C-w>j"},
		{"n", "<C-k>", "<C-w>k"},
		{"n", "<C-l>", "<C-w>l"},

		-- Resize splits with nav keys
		{"n", "<C-S-k>", ":resize -2<CR>"},
		{"n", "<C-S-j>", ":resize +2<CR>"},
		{"n", "<C-S-h>", ":vertical resize -2<CR>"},
		{"n", "<C-S-l>", ":vertical resize +2<CR>"},

		-- Splitting
		{"n", "<leader>v", ":vsplit<CR>"},
		{"n", "<leader>h", ":split<CR>"},

		-- Clear highlights
		{"n", "<leader>c", ":noh<CR>"},

		-- Better searching
		{"n", "/", "/\\v"},
		{"v", "/", "/\\v"},

		-- Nvim Tree
	  	{"n", "<leader>t", ":NvimTreeToggle<CR>"},

		-- Bufferline
		{"n", "<Tab>", ":BufferLineCycleNext<CR>"},
		{"n", "<S-Tab>", ":BufferLineCyclePrev<CR>"},
		{"n", "<leader><Tab>", ":BufferLineMoveNext<CR>"},
		{"n", "<leader><S-Tab>", ":BufferLineMovePrev<CR>"},
		{"n", "<leader>bj", ":BufferLinePick<CR>"},
		{"n", "<leader>bd", ":BufferLinePickClose<CR>"},
		{"n", "<leader>bp", ":BufferLineTogglePin<CR>"},

		-- Telescope
		{"n", "<leader>ff", ":Telescope find_files<CR>"},
		{"n", "<leader>fg", ":Telescope live_grep<CR>"},
		{"n", "<leader>fb", ":Telescope buffers<CR>"},
		{"n", "<leader>fh", ":Telescope help_tags<CR>"},
		{"n", "<leader>fc", ":Telescope commands<CR>"},
		{"n", "<leader>fm", ":Telescope marks<CR>"},
		{"n", "<leader>fr", ":Telescope registers<CR>"},
		{"n", "<leader>fs", ":Telescope spell_suggest<CR>"},
		{"n", "<leader>ft", ":Telescope tags<CR>"},

		-- Gitsigns
		{"n", "<leader>hp", ":Gitsigns preview_hunk<CR>"},


	  }
	M.map_key_list(keys)
end

return M
