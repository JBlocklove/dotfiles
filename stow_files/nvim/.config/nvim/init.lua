cmd = vim.cmd
opt = vim.opt

-- General settings and options
require "settings"
local autocmds = require "autocmds"
autocmds.define_augroups(defined_autocommands)

-- Plugin setup
require("plugins")

-- Colorscheme
cmd("colorscheme moonlight")
--cmd "au ColorScheme * hi Folded ctermfg=233 guifg=#a1abe0" -- fix fold colors
--vim.g.moonlight_disable_background = true

-- Set key mappings
require("mappings").setup()
