local M = {}
local generic_opts_any = { noremap = true, silent = true }

local generic_opts = {
  insert_mode = generic_opts_any,
  normal_mode = generic_opts_any,
  visual_mode = generic_opts_any,
  visual_block_mode = generic_opts_any,
  --term_mode = { silent = true },
}

local mode_adapters = {
  insert_mode = "i",
  normal_mode = "n",
  --term_mode = "t",
  visual_mode = "v",
  visual_block_mode = "x",
}

-- Append key mappings to lunarvim's defaults for a given mode
-- @param keymaps The table of key mappings containing a list per mode (normal_mode, insert_mode, ..)
function M.append_to_defaults(keymaps)
  for mode, mappings in pairs(keymaps) do
    for k, v in ipairs(mappings) do
      nvim.keys[mode][k] = v
    end
  end
end

-- Set key mappings individually
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param key The key of keymap
-- @param val Can be form as a mapping or tuple of mapping and user defined opt
function M.set_keymaps(mode, key, val)
  local opt = generic_opts[mode] and generic_opts[mode] or generic_opts_any
  if type(val) == "table" then
    opt = val[2]
    val = val[1]
  end
  vim.api.nvim_set_keymap(mode, key, val, opt)
end

-- Load key mappings for a given mode
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param keymaps The list of key mappings
function M.load_mode(mode, keymaps)
  mode = mode_adapters[mode] and mode_adapters[mode] or mode
  for k, v in pairs(keymaps) do
    M.set_keymaps(mode, k, v)
  end
end

-- Load key mappings for all provided modes
-- @param keymaps A list of key mappings for each mode
function M.load(keymaps)
  for mode, mapping in pairs(keymaps) do
    M.load_mode(mode, mapping)
  end
end

function M.config()
  nvim.keys = {
    ---@usage change or add mappings for insert mode
    insert_mode = {},

    ---@usage change or add mappings for normal mode
    normal_mode = {
      -- Better window movement
      ["<C-h>"] = "<C-w>h",
      ["<C-j>"] = "<C-w>j",
      ["<C-k>"] = "<C-w>k",
      ["<C-l>"] = "<C-w>l",

      -- Resize with arrows
      ["<C-S-k>"] = ":resize -2<CR>",
      ["<C-S-j>"] = ":resize +2<CR>",
      ["<C-S-h>"] = ":vertical resize -2<CR>",
      ["<C-S-l>"] = ":vertical resize +2<CR>",

      -- Tab switch buffer
      ["<Tab>"] = ":BufferNext<CR>",
      ["<S-Tab>"] = ":BufferPrevious<CR>",

	  -- Splitting
	  ["<leader>v"] = ":vsplit <cr>",
	  ["<leader>h"] = ":split <cr>",

	  -- Clear highlight
	  ["<leader>c"] = ":noh<cr>",

	  -- Better searching
	  ["/"] = "/\\v",
    },

    ---@usage change or add mappings for visual mode
    visual_mode = {
	  -- Better searching
	  ["/"] = "/\\v",
    },

    ---@usage change or add mappings for visual block mode
    visual_block_mode = {
      -- Move selected line / block of text in visual mode
      ["K"] = ":move '<-2<CR>gv-gv",
      ["J"] = ":move '>+1<CR>gv-gv",
    },
  }

  if vim.fn.has "mac" == 1 then
    nvim.keys.normal_mode["<A-Up>"] = nvim.keys.normal_mode["<C-Up>"]
    nvim.keys.normal_mode["<A-Down>"] = nvim.keys.normal_mode["<C-Down>"]
    nvim.keys.normal_mode["<A-Left>"] = nvim.keys.normal_mode["<C-Left>"]
    nvim.keys.normal_mode["<A-Right>"] = nvim.keys.normal_mode["<C-Right>"]
  end
end

function M.print(mode)
  print "List of default mappings (not including which-key)"
  if mode then
    print(vim.inspect(nvim.keys[mode]))
  else
    print(vim.inspect(nvim.keys))
  end
end

function M.setup()
  vim.g.mapleader = nvim.leader
  M.load(nvim.keys)
end

return M
