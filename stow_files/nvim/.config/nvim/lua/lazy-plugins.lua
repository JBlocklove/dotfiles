local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local function is_nixos()
  local f = io.open("/etc/os-release", "r")
  if not f then return false end
  for line in f:lines() do
    -- look for a line like ID="nixos" or ID=nixos
    local id = line:match('^ID="?([^"\n]-)"?$')
    if id then
      f:close()
      return id == "nixos"
    end
  end
  f:close()
  return false
end

nixos = is_nixos()

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Source plugins
require("lazy").setup(
	"plugins",
	{
		ui={border="single"}
	}
)
