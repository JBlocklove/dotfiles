local M = {}

local servers = {
	"pyright",
	"sumneko_lua",
	"bashls",
	"texlab",
	"clangd",
	"vhdl_ls",
	--"vhdl-tool",
	--"hdl_checker",
}

local lspconfig  = require("lspconfig")
local configs = require("lspconfig.configs")

M.setup = function()
	require('mason-lspconfig').setup{
		--ensure_installed = servers,
		--automatic_installation = true,
	}

	if not configs.vhdl_ls then
		configs.vhdl_ls = {
			default_config = {
				cmd = { "vhdl_ls" },
				filetypes = { "vhdl" },
				root_dir = function(fname)
					local util = require("lspconfig").util
					return util.root_pattern("vhdl_ls.toml")(fname)
				end,
				settings = {},
			},
		}
	end

	for _, server in pairs(servers) do
		local opts = {
			on_attach = require("lsp.handlers").on_attach,
			capabilities = require("lsp.handlers").capabilities,
		}

		local has_custom_opts, server_custom_opts = pcall(require, "lsp.configs." .. server)

		if has_custom_opts then
			opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
		end
		lspconfig[server].setup(opts)
	end
end

return M
