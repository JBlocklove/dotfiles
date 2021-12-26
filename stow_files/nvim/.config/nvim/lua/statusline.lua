local M = {}

local colors = require 'moonlight.colors'

local statusline = {
	options = {
	  theme = {
		  normal = { c =  { fg = colors.fg, bg = colors.bg }}},
	  component_separators = '',
	  section_separators = '',
	  disabled_filetypes = {},
	  always_divide_middle = true,
	},
	sections = {
	  lualine_a = {},
	  lualine_b = {},
	  lualine_c = {},
	  lualine_x = {},
	  lualine_y = {},
	  lualine_z = {}
	},
	inactive_sections = {
	  lualine_a = {},
	  lualine_b = {},
	  lualine_c = {},
	  lualine_x = {},
	  lualine_y = {},
	  lualine_z = {}
	},
	tabline = {},
	extensions = {}
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand '%:t') ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand '%:p:h'
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local ins_left = function(component)
  table.insert(statusline.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local ins_right = function(component)
  table.insert(statusline.sections.lualine_x, component)
end


M.setup = function()
	local lualine = require 'lualine'

	-- Mode
	ins_left {
	  function()
	    local mode_color = {
	      n = colors.blue,
	      i = colors.green,
	      v = colors.purple,
	      [''] = colors.purple,
	      V = colors.purple,
	      c = colors.yellow,
	      no = colors.blue,
	      s = colors.orange,
	      S = colors.orange,
	      [''] = colors.orange,
	      ic = colors.yellow,
	      R = colors.purple,
	      Rv = colors.purple,
	      cv = colors.red,
	      ce = colors.red,
	      r = colors.cyan,
	      rm = colors.cyan,
	      ['r?'] = colors.cyan,
	      ['!'] = colors.red,
	      t = colors.red,
	    }
	    vim.api.nvim_command('hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.bg)
	    return '▊'
	  end,
	  color = 'LualineMode',
	  padding = { left = 0, right = 0 },
	}

	ins_left {
	  'branch',
	  icon = '',
	  color = { fg = colors.cyan, gui = 'bold' },
	}

	ins_left {
	  'diff',
	  -- Is it me or the symbol for modified us really weird
	  symbols = { added = ' ', modified = ' ', removed = ' ' },
	  diff_color = {
	    added = { fg = colors.green },
	    modified = { fg = colors.pink },
	    removed = { fg = colors.red },
	  },
	  cond = conditions.hide_in_width,
	}

	ins_left {
	  'filename',
	  cond = conditions.buffer_not_empty,
	  color = { fg = colors.magenta, gui = 'bold' },
	}


	ins_left {
	  'diagnostics',
	  sources = { 'nvim_diagnostic' },
	  symbols = { error = ' ', warn = ' ', info = ' ', hint = " "},
	  diagnostics_color = {
	    color_error = { fg = colors.red },
	    color_warn = { fg = colors.yellow },
	    color_info = { fg = colors.cyan },
	  },
	}

	-- Insert mid section. You can make any number of sections in neovim :)
	-- for lualine it's any number greater then 2
	ins_left {
	  function()
	    return '%='
	  end,
	}

	ins_right {
	  -- Lsp server name .
	  function()
	    local msg = 'No Active Lsp'
	    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
	    local clients = vim.lsp.get_active_clients()
	    if next(clients) == nil then
	      return msg
	    end
	    for _, client in ipairs(clients) do
	      local filetypes = client.config.filetypes
	      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
	        return client.name
	      end
	    end
	    return msg
	  end,
	  icon = 'LSP:',
	  color = { fg = '#ffffff', gui = 'bold' },
	}

	ins_right { 'location' }
	ins_right { 'progress', color = { fg = colors.fg } }

	lualine.setup(statusline)
end

return M
