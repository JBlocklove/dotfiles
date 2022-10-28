local M = {}

local servers = {
	'python',
	'lua',
	'verilog',
	'latex',
}

M.setup = function()
	require('nvim-treesitter.configs').setup{
		ensure_installed = servers,
		highlight = {
			enable = true,
			disable = { "" },
			additional_vim_regex_highlighting = true,
		},
		indent = {
			enable = true
		},
		autotag = { -- added by windwp/nvim-ts-autotag
			enable = true,
		},
		matchup = {
			enable = true,
		},
		playground = {
		    enable = true,
		    disable = {},
		    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		    persist_queries = false, -- Whether the query persists across vim sessions
		    keybindings = {
		      toggle_query_editor = 'o',
		      toggle_hl_groups = 'i',
		      toggle_injected_languages = 't',
		      toggle_anonymous_nodes = 'a',
		      toggle_language_display = 'I',
		      focus_language = 'f',
		      unfocus_language = 'F',
		      update = 'R',
		      goto_node = '<cr>',
		      show_help = '?',
		    },
		},
	}
end

return M

--local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
--parser_config.vhdl = {
--  install_info = {
--    url = "~/.local/share/tree-sitter/tree-sitter-vhdl",
--    files = {"src/parser.c"}
--  },
--  filetype = "vhdl"
--}
