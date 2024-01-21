return {
	-- LSP plugins
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"j-hui/fidget.nvim",
		},
		config = function()
			require("fidget").setup()
			require("mason").setup({
				ui = { border = "single" },
			})

			require("mason-lspconfig").setup({ ---@diagnostic disable-line: redundant-parameter
				ensure_installed = {
					"lua_ls",
					"bashls",
				},
				handlers = {
					function (server_name) -- default handler
						require("lspconfig")[server_name].setup{}
					end,
					["lua_ls"] = function ()
						local lspconfig = require("lspconfig")
						lspconfig.lua_ls.setup {
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim" }
									}
								}
							}
						}
					end,
				},
			})

			vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "󰌶", texthl = "DiagnosticSignHint" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
		end
	},
}
