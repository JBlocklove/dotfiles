return {
	cmd = { "hdl_checker", "--lsp" },
	filetypes = { "vhdl", "verilog" },
	root_dir = function(fname)
		local util = require("lspconfig").util
		return util.root_pattern(".hdl_checker.config")(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
	end,
	settings = {},
}

