-- Enforce purity
vim.keymap.set("i", "<Up>", "<Nop>")
vim.keymap.set("i", "<Down>", "<Nop>")
vim.keymap.set("i", "<Left>", "<Nop>")
-- vim.keymap.set("i", "<Right>", "<Nop>") -- only using for copilot now
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

---- Better window movement
--vim.keymap.set("n", "<C-h>", "<C-w>h")
--vim.keymap.set("n", "<C-j>", "<C-w>j")
--vim.keymap.set("n", "<C-k>", "<C-w>k")
--vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Resize splits with nav keys
-- vim.keymap.set("n", "<C-S-k>", ":resize -2<CR>")
-- vim.keymap.set("n", "<C-S-j>", ":resize +2<CR>")
-- vim.keymap.set("n", "<C-S-h>", ":vertical resize -2<CR>")
-- vim.keymap.set("n", "<C-S-l>", ":vertical resize +2<CR>")

-- Splitting
vim.keymap.set("n", "<leader>v", ":vsplit<CR>")
vim.keymap.set("n", "<leader>h", ":split<CR>")

-- Clear highlights
vim.keymap.set("n", "<leader>c", ":noh<CR>")

-- Better searching
vim.keymap.set("n", "/", "/\\v")
vim.keymap.set("v", "/", "/\\v")

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Nvim Tree
--vim.keymap.set("n", "<leader>-", ":NvimTreeToggle<CR>")

-- Bufferline
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader><Tab>", ":BufferLineMoveNext<CR>")
vim.keymap.set("n", "<leader><S-Tab>", ":BufferLineMovePrev<CR>")
vim.keymap.set("n", "<leader>bj", ":BufferLinePick<CR>")
vim.keymap.set("n", "<leader>bd", ":BufferLinePickClose<CR>")
vim.keymap.set("n", "<leader>bp", ":BufferLineTogglePin<CR>")

-- Telescope
vim.keymap.set("n", "<leader>-", function() require("telescope.builtin").find_files() end) -- find files one directory above the current buffer
vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files({ cwd = vim.fn.expand "%:p:h:h" }) end) -- find files one directory above the current buffer
vim.keymap.set("n", "<leader>fo", function() require("telescope.builtin").find_files({ cwd = "~/" }) end) -- find files one directory above the current buffer
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>fc", ":Telescope commands<CR>")
vim.keymap.set("n", "<leader>fm", ":Telescope marks<CR>")
vim.keymap.set("n", "<leader>fr", ":Telescope registers<CR>")
vim.keymap.set("n", "<leader>fs", ":Telescope spell_suggest<CR>")
vim.keymap.set("n", "<leader>ft", ":Telescope tags<CR>")
vim.keymap.set("n", "<leader>fm", ":Telescope keymaps<CR>")
vim.keymap.set("n", "<leader>fl", ":Telescope loclist<CR>")
vim.keymap.set("n", "<leader>fq", ":Telescope quickfix<CR>")
vim.keymap.set("n", "<C-g>", ":Telescope git_files<CR>")

-- Gitsigns
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")

-- -- Trouble
-- vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
-- vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
-- vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
-- vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
-- vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)

-- Diffs
vim.keymap.set("v", "<leader>dg", ":'<,'>diffget<CR>")
vim.keymap.set("v", "<leader>dp", ":'<,'>diffput<CR>")
