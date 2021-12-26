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

function M.config()
	keys = {
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

		-- Tab to switch buffers
		{"n", "<Tab>", ":BufferNext<CR>"},
		{"n", "<S-Tab>", ":BufferPrevious<CR>"},

		-- Splitting
		{"n", "<leader>v", ":vsplit<CR>"},
		{"n", "<leader>h", ":split<CR>"},

		-- Clear highlights
		{"n", "<leader>c", ":noh<CR>"},

		-- Better searching
		{"n", "/", "/\\v"},
		{"v", "/", "/\\v"},

	}
end

function M.setup()
	for _, mapping in ipairs(keys) do
		map_key(mapping)
	end
end

return M
