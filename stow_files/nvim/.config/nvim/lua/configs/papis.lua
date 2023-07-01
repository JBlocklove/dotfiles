local M = {}

M.setup = function()
	require('papis').setup{
		papis_python = {
			dir = "/home/jason/Documents/papers/papers",
			info_name = "info.yaml",
			notes_name = [[notes.norg]],
		},
		enable_keymaps = true,
		cite_formats = {
			tex = { "\\cite{%s}", "\\cite[tp]?%*?{%s}" },
		},
		init_filenames = { "%info_name%", "*.md", "*.tex" },
}
end

return M


