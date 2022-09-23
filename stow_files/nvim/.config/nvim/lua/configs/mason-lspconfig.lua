local M = {}

local servers = {
	"pyright",
	"sumneko_lua",
	"bashls",
	"texlab",
}

M.setup = function()
	require('mason-lspconfig').setup{
		ensure_installed = servers,
		automatic_installation = true,
	}

	for _, server in pairs(servers) do
		opts = {
			on_attach = require("lsp.handlers").on_attach,
			capabilities = require("lsp.handlers").capabilities,
		}

		server = vim.split(server, "@")[1]

		if server == "pyright" then
			local pyright_opts = require("lsp.configs.pyright")
			opts = vim.tbl_deep_extend("force", pyright_opts, opts)
		end

		--if server == "sumneko_lua" then
		--
		--end
		lspconfig[server].setup(opts)
		::continue::
	end
end

return M
