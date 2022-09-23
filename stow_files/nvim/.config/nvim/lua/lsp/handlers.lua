local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd> lua vim.lsp.buf.declaration()<CR>", opts)
	vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
end

M.setup = function()
	require('lspconfig').pyright.setup{}
	require('lspconfig').sumneko_lua.setup{}
	require('lspconfig').bashls.setup{}
	require('lspconfig').texlab.setup{}
end


return M
