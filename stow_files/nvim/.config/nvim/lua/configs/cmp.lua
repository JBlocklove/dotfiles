local M = {}

M.setup = function()
	local cmp = require('cmp')

	local kind_icons = {
	  Text = "",
	  Method = "m",
	  Function = "",
	  Constructor = "",
	  Field = "",
	  Variable = "",
	  Class = "",
	  Interface = "",
	  Module = "",
	  Property = "",
	  Unit = "",
	  Value = "",
	  Enum = "",
	  Keyword = "",
	  Snippet = "",
	  Color = "",
	  File = "",
	  Reference = "",
	  Folder = "",
	  EnumMember = "",
	  Constant = "",
	  Struct = "",
	  Event = "",
	  Operator = "",
	  TypeParameter = "",
	}

	cmp.setup({
		snippet = {
			expand = function(args)
				vim.fn["UltiSnips#Anon"](args.body)
			end
		},
		window = {
			--completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				-- Kind icons
				vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
				-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
				vim_item.menu = ({
					--nvim_lsp = "[LSP]",
					ultisnips = "[Snippet]",
					buffer = "[Buffer]",
					path = "[Path]",
				})[entry.source.name]
				return vim_item
			end,
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
			['<C-l>'] = cmp.mapping.confirm({ select = true }),
		},
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'ultisnips' },
			{ name = 'buffer' },
			{ name = 'path' },
		})
	})

	-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline('/', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' }
		}
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
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