-- Enforce purity
vim.keymap.set("i", "<Up>", "<Nop>")
vim.keymap.set("i", "<Down>", "<Nop>")
vim.keymap.set("i", "<Left>", "<Nop>")
vim.keymap.set("i", "<Right>", "<Nop>")
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

-- Better window movement
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Resize splits with nav keys
vim.keymap.set("n", "<C-S-k>", ":resize -2<CR>")
vim.keymap.set("n", "<C-S-j>", ":resize +2<CR>")
vim.keymap.set("n", "<C-S-h>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-S-l>", ":vertical resize +2<CR>")

-- Splitting
vim.keymap.set("n", "<leader>v", ":vsplit<CR>")
vim.keymap.set("n", "<leader>h", ":split<CR>")

-- Clear highlights
vim.keymap.set("n", "<leader>c", ":noh<CR>")

-- Better searching
vim.keymap.set("n", "/", "/\\v")
vim.keymap.set("v", "/", "/\\v")

-- Nvim Tree
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")

-- Bufferline
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader><Tab>", ":BufferLineMoveNext<CR>")
vim.keymap.set("n", "<leader><S-Tab>", ":BufferLineMovePrev<CR>")
vim.keymap.set("n", "<leader>bj", ":BufferLinePick<CR>")
vim.keymap.set("n", "<leader>bd", ":BufferLinePickClose<CR>")
vim.keymap.set("n", "<leader>bp", ":BufferLineTogglePin<CR>")

-- Telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>fc", ":Telescope commands<CR>")
vim.keymap.set("n", "<leader>fm", ":Telescope marks<CR>")
vim.keymap.set("n", "<leader>fr", ":Telescope registers<CR>")
vim.keymap.set("n", "<leader>fs", ":Telescope spell_suggest<CR>")
vim.keymap.set("n", "<leader>ft", ":Telescope tags<CR>")

-- Gitsigns
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")

