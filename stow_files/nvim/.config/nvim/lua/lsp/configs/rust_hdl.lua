return {
	cmd = { "vhdl_ls" },
	filetypes = { "vhdl" },
	root_dir = function(fname)
		local util = require("lspconfig").util
		return util.root_pattern("vhdl_ls.toml")(fname)
	end,
	settings = {},
}


