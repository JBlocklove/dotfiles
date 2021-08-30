CONFIG_PATH = os.getenv "XDG_CONFIG_HOME" .. "/nvim/"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"
USER = vim.fn.expand "$USER"

cmd [[ set spellfile=~/.config/nvim/spell/en.utf-8.add ]]

nvim = {
  leader = "\\",
  colorscheme = "spacegray",
  line_wrap_cursor_movement = false,
  transparent_window = true,
  format_on_save = true,
  vsnip_dir = CONFIG_PATH .. "snippets",
  --database = { save_location = "~/.config/lunarvim_db", auto_execute = 1 },
  keys = {},

  -- TODO why do we need this?
  builtin = {
    lspinstall = {},
    telescope = {},
    compe = {},
    autopairs = {},
    treesitter = {},
    nvimtree = {},
    gitsigns = {},
    which_key = {},
    comment = {},
    rooter = {},
    galaxyline = {},
    bufferline = {},
    dap = {},
    dashboard = {},
    --terminal = {},
  },

  lsp = {
    completion = {
      item_kind = {
        "(Text) ",
        "(Method)",
        "(Function)",
        "(Constructor)",
        "(Field)",
        "(Variable)",
        "(Class)",
        "(Interface)",
        "(Module)",
        "(Property)",
        "(Unit)",
        "(Value)",
        "(Enum)",
        "(Keyword)",
        "(Snippet)",
        "(Color)",
        "(File)",
        "(Reference)",
        "(Folder)",
        "(EnumMember)",
        "(Constant)",
        "(Struct)",
        "(Event)",
        "(Operator)",
        "(TypeParameter)",
      },
    },
    diagnostics = {
      signs = {
        active = true,
        values = {
          { name = "LspDiagnosticsSignError", text = "" },
          { name = "LspDiagnosticsSignWarning", text = "" },
          { name = "LspDiagnosticsSignHint", text = "" },
          { name = "LspDiagnosticsSignInformation", text = "" },
        },
      },
      virtual_text = {
        prefix = "=>",
        spacing = 0,
      },
      underline = true,
      severity_sort = true,
    },
    override = {},
    document_highlight = true,
    popup_border = "single",
    on_attach_callback = nil,
    on_init_callback = nil,
    ---@usage query the project directory from the language server and use it to set the CWD
    smart_cwd = true,
  },

  plugins = {
    -- use config.lua for this not put here
  },

  autocommands = {},
}

local schemas = nil
local lsp = require "lsp"
local common_on_attach = lsp.common_on_attach
local common_capabilities = lsp.common_capabilities()
local common_on_init = lsp.common_on_init
local status_ok, jsonls_settings = pcall(require, "nlspsettings.jsonls")
if status_ok then
  schemas = jsonls_settings.get_default_schemas()
end

-- TODO move all of this into lang specific files, only require when using
-- require("lang")
nvim.lang = {
  c = {
    formatters = {
      {
        -- @usage can be clang_format or uncrustify
        exe = "",
        args = {},
        stdin = true,
      },
    },
    linters = {},
    lsp = {
      provider = "clangd",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/cpp/clangd/bin/clangd",
          "--background-index",
          "--header-insertion=never",
          "--cross-file-rename",
          "--clang-tidy",
          "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  cpp = {
    formatters = {
      {
        -- @usage can be clang_format or uncrustify
        exe = "",
        args = {},
        stdin = true,
      },
    },
    linters = {},
    lsp = {
      provider = "clangd",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/cpp/clangd/bin/clangd",
          "--background-index",
          "--header-insertion=never",
          "--cross-file-rename",
          "--clang-tidy",
          "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  docker = {
    formatters = {
      {
        exe = "",
        args = {},
      },
      -- @usage can be {"hadolint"}
    },
    linters = {},
    lsp = {
      provider = "dockerls",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/dockerfile/node_modules/.bin/docker-langserver",
          "--stdio",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  lua = {
    formatters = {
      {
        -- @usage can be stylua or lua_format
        exe = "",
        args = {},
      },
    },
    linters = {},
    lsp = {
      provider = "sumneko_lua",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/lua/sumneko-lua-language-server",
          "-E",
          DATA_PATH .. "/lspinstall/lua/main.lua",
        },
        capabilities = common_capabilities,
        on_attach = common_on_attach,
        on_init = common_on_init,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
              -- Setup your lua path
              path = vim.split(package.path, ";"),
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = {
                [vim.fn.expand "~/.config/nvim/lua"] = true,
                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
              },
              maxPreload = 100000,
              preloadFileSize = 1000,
            },
          },
        },
      },
    },
  },
  python = {
    formatters = {
      {
        -- @usage can be black or yapf or isort
        exe = "",
        args = {},
      },
    },
    linters = {},
    lsp = {
      provider = "pyright",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver",
          "--stdio",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  rust = {
    formatters = {
      {
        -- @usage can be rustfmt
        exe = "",
        args = {},
      },
    },
    linters = {},
    lsp = {
      provider = "rust_analyzer",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/rust/rust-analyzer",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  sh = {
    formatters = {
      {
        -- @usage can be shfmt
        exe = "",
        args = {},
      },
    },
    linters = {},
    lsp = {
      provider = "bashls",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/bash/node_modules/.bin/bash-language-server",
          "start",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  tex = {
    formatters = {
      {
        exe = "",
        args = {},
        stdin = false,
      },
      -- @usage can be chktex or vale
    },
    linters = {},
    lsp = {
      provider = "texlab",
      setup = {
        cmd = { DATA_PATH .. "/lspinstall/latex/texlab" },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
  vim = {
    formatters = {
      {
        exe = "",
        args = {},
      },
    },
    -- @usage can be {"vint"}
    linters = { "" },
    lsp = {
      provider = "vimls",
      setup = {
        cmd = {
          DATA_PATH .. "/lspinstall/vim/node_modules/.bin/vim-language-server",
          "--stdio",
        },
        on_attach = common_on_attach,
        on_init = common_on_init,
        capabilities = common_capabilities,
      },
    },
  },
}

require("mappings").config()
require("plugin_settings.which-key").config()
require "plugin_settings.status_colors"
require("plugin_settings.gitsigns").config()
require("plugin_settings.compe").config()
--require("plugin_settings.dashboard").config()
--require("plugin_settings.dap").config()
require("plugin_settings.telescope").config()
require("plugin_settings.treesitter").config()
require("plugin_settings.nvimtree").config()
require("plugin_settings.rooter").config()
require("plugin_settings.bufferline").config()

local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 2, -- more space in the neovim command line for displaying messages
	colorcolumn = "99999", -- fixes indentline for now
	completeopt = { "menuone", "noselect" },
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
	foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
	guifont = "monospace:h17", -- the font used in graphical neovim applications
	hidden = true, -- required to keep multiple buffers and open multiple buffers
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 100, -- time to wait for a mapped sequence to complete (in milliseconds)
	title = true, -- set the title of window to the value of the titlestring
	-- opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
	undodir = CACHE_PATH .. "/undo", -- set an undo directory
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = false, -- convert tabs to spaces
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	tabstop = 4, -- insert 2 spaces for a tab
	softtabstop = 4, -- insert 2 spaces for a tab
	cursorline = false, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	spell = false,
	spelllang = "en",
	scrolloff = 8, -- is one of my fav
	sidescrolloff = 8,
	gdefault = true,
	incsearch = true,
	showmatch = true,
	autoindent = true,
	autoread = true,
	undolevels = 1000,
	udf = true,

} ---  VIM ONLY COMMANDS  ---cmd "filetype plugin on"cmd('let &titleold="' .. TERMINAL .. '"')cmd "set inccommand=split"cmd "set iskeyword+=-"

opt.shortmess:append "c"

cmd('highlight LineNr ctermfg=grey')

-- Loop to set all options
for k, v in pairs(options) do
	vim.opt[k] = v
end

if nvim.transparent_window then
	cmd "au ColorScheme * hi Normal ctermbg=none guibg=none"
	cmd "au ColorScheme * hi SignColumn ctermbg=none guibg=none"
	cmd "au ColorScheme * hi NormalNC ctermbg=none guibg=none"
	cmd "au ColorScheme * hi MsgArea ctermbg=none guibg=none"
	cmd "au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none"
	cmd "au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none"
	cmd "let &fcs='eob: '"
end
