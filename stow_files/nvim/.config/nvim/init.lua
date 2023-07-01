cmd = vim.cmd
opt = vim.opt

-- General settings and options
require "settings"
local autocmds = require "autocmds"
autocmds.define_augroups(defined_autocommands)

-- Plugin setup
require("plugins")

-- Colorscheme
require("colorscheme")

-- Set key mappings
require("mappings").setup()

-- Setup LSP
require("lsp")
