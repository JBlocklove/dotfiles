cmd = vim.cmd
opt = vim.opt

cmd [[
  set packpath+=~/.config/nvim
  set packpath+=~/.config/nvim/after
  set packpath+=~/.local/share/nvim/site

  set runtimepath+=~/.config/nvim
  set runtimepath^=~/.config/nvim/after
]]

USER_CONFIG_PATH = os.getenv "XDG_CONFIG_HOME" .. "/nvim/init.lua"

require "settings"
local autocmds = require "autocmds"
autocmds.define_augroups(nvim.autocommands)

require('plugins')

cmd("colorscheme " .. nvim.colorscheme)

--local utils = require "utils"
--utils.toggle_autoformat()

require("lsp").config()

local null_status_ok, null_ls = pcall(require, "null-ls")
if null_status_ok then
  null_ls.config {}
  require("lspconfig")["null-ls"].setup {}
end

local lsp_settings_status_ok, lsp_settings = pcall(require, "nlspsettings")
if lsp_settings_status_ok then
  lsp_settings.setup {
    config_home = os.getenv "HOME" .. "/.config/nvim/lsp-settings",
  }
end

require("mappings").setup()
