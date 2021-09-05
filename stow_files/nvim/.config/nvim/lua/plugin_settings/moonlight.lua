local M = {}

M.setup = function()

	vim.g.moonlight_contrast = false
	vim.g.moonlight_borders = true
	vim.g.moonlight_disable_background = true

	vim.cmd("hi Folded guifg=#70B0FF")

	nvim.galaxyline_pallette["moonlight"] = "moonlight.colors"

end

return M
