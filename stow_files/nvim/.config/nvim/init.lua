cmd = vim.cmd
opt = vim.opt

require "settings"
local autocmds = require "autocmds"
autocmds.define_augroups(defined_autocommands)

require("plugins")

cmd("colorscheme moonlight")

require("mappings").setup()

