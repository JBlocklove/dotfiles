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
			require("fidget").setup({
				notification = {
					window = {
						winblend = 0,
						border = "single",
					},
				},
			})
			require("mason").setup({
				ui = { border = "single" },
			})

			require("mason-lspconfig").setup({ ---@diagnostic disable-line: redundant-parameter
				ensure_installed = {
					"lua_ls",
					"bashls",
					"verible",
					"texlab",
					--"hdl_checker",
				},
				handlers = {
					function (server_name) -- default handler
						require("lspconfig")[server_name].setup{
							capabilities = require("cmp_nvim_lsp").default_capabilities(),
						}
					end,
					["lua_ls"] = function ()
						local lspconfig = require("lspconfig")
						lspconfig.lua_ls.setup {
							settings = {
								Lua = {
									diagnostics = {
										globals = {
											"vim",
											"awesome",
										}
									}
								}
							}
						}
					end,

					-- ["verible"] = function ()
					-- 	local lspconfig = require("lspconfig")
					-- 	lspconfig.verible.setup {
					-- 		filetypes = { "systemverilog", "verilog" },
					-- 		cmd = { "verible-verilog-ls", "--no-tabs" },
					-- 	}
					-- end,

					--["hdl_checker"] = function ()
					--	local lspconfig = require("lspconfig")
					--	lspconfig.hdl_checker.setup {
					--		filetypes = { "vhdl" },
					--		cmd = { "hdl-checker", "--lsp" },
					--		root_dir = lspconfig.util.root_pattern("hdlchecker.json"),
					--	}
					--end,
				},
			})

			vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "󰌶", texthl = "DiagnosticSignHint" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })

			vim.diagnostic.config({virtual_text = false})
		end
	},
}
