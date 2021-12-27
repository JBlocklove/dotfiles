local M = {}

M.setup = function()
	local cmp = require('cmp')

	cmp.setup({
		snippet = {
			expand = function(args)
				vim.fn["UltiSnips#Anon"](args.body)
			end
		},
		mapping = {
			['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
			['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
			['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
			['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
			['<C-e>'] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			['<C-j>'] = cmp.mapping.confirm({ select = true }),
		},
		sources = cmp.config.sources({
			--{ name = 'nvim_lsp' },
			{ name = 'ultisnips' },
		},
		{
			{ name = 'buffer' },
		})
	})

	-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline('/', {
		sources = {
			{ name = 'buffer' }
		}
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
		sources = cmp.config.sources({
			{ name = 'path' }
		},
		{
			{ name = 'cmdline' }
		})
	})

	---- Setup lspconfig.
	--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	---- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
	--require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
	--	capabilities = capabilities
	--}
end

return M
