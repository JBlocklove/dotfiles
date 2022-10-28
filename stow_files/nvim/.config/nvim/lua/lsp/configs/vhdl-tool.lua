return {
	cmd = { "vhdl-tool", "lsp" },
	filetypes = { "vhdl" },
	root_dir = function(fname)
		local util = require("lspconfig").util
		return util.root_pattern("vhdltool-config.yaml")(fname)
	end,
	settings = {},
}


