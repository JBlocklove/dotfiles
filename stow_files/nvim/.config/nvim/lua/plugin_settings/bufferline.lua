local M = {}

M.config = function()
  nvim.builtin.bufferline = {
    active = true,
    keymap = {
      normal_mode = {
        ["<Tab>"] = ":BufferNext<CR>",
        ["<S-Tab>"] = ":BufferPrevious<CR>",
      },
    },
  }
end

M.setup = function()
  local keymap = require "mappings"
  keymap.append_to_defaults(nvim.builtin.bufferline.keymap)
end

return M
