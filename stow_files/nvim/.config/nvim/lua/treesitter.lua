local ts = require('nvim-treesitter.configs')
ts.setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = true
  },
  rainbow = { -- added by p00f/nvim-ts-rainbow
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  },
  autotag = { -- added by windwp/nvim-ts-autotag
    enable = true,
  },
  context = { -- added by romgrk/nvim-treesitter-context
    enable = true,
  },
  matchup = {
    enable = true,
  },
}
--local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
--parser_config.vhdl = {
--  install_info = {
--    url = "~/.local/share/tree-sitter/tree-sitter-vhdl",
--    files = {"src/parser.c"}
--  },
--  filetype = "vhdl"
--}
