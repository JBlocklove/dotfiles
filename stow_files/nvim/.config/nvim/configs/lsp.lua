local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local util = require('lspconfig/util')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD',         '<cmd>lua vim.lsp.buf.declaration()<CR>',                  opts)
  buf_set_keymap('n', 'gd',         '<cmd>lua vim.lsp.buf.definition()<CR>',                   opts)
  buf_set_keymap('n', 'gi',         '<cmd>lua vim.lsp.buf.implementation()<CR>',               opts)
  buf_set_keymap('n', '<C-k>',      '<cmd>lua vim.lsp.buf.hover()<CR>',                        opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',                       opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',                  opts)
  buf_set_keymap('n', 'gr',         '<cmd>lua vim.lsp.buf.references()<CR>',                   opts)
  buf_set_keymap('n', '<leader>e',   '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d',         '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',             opts)
  buf_set_keymap('n', ']d',         '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',             opts)
  buf_set_keymap("n", "<leader>f",  "<cmd>lua vim.lsp.buf.formatting()<CR>",                   opts)
end

if not lspconfig.hdl_checker then
  configs.hdl_checker = {
    default_config = {
      autostart = false,
      cmd = {"hdl_checker", "--lsp"};
      filetypes = {"vhdl", "verilog", "systemverilog"};
      root_dir = function(fname)
        return util.root_pattern('.hdl_checker.config')(fname) or util.path.dirname(fname)
      end;
      settings = {};
    };
  }
end

local servers = { "hdl_checker", "texlab"}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

vim.opt.updatetime  = 300
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true,
  }
)

-- sets up highlighting for lsp items


-- adds a check to see if any of the active clients have the capability
-- textDocument/documentHighlight. without the check it was causing constant
-- errors when servers didn't have that capability
for _,client in ipairs(vim.lsp.get_active_clients()) do
  if client.resolved_capabilities.document_highlight then
    vim.cmd [[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
    vim.cmd [[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
    vim.cmd [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
    break -- only add the autocmds once
  end
end
