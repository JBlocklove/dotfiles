local M = {}

local colors = require 'moonlight.colors'

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

local statusline = {
	options = {
		theme = {
			normal = {
				a = { fg = colors.fg, bg = colors.bg },
				b = { fg = colors.fg, bg = colors.bg },
				c = { fg = colors.fg, bg = colors.bg },
			},
		},
		component_separators = '',
		section_separators = '',
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {
			{
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
			},
		},
		lualine_b = {
			{
				'branch',
				icon = '',
				color = { fg = colors.cyan, gui = 'bold' }
			},
			{
				'diff',
				symbols = { added = ' ', modified = ' ', removed = ' ' },
				diff_color = {
					added = { fg = colors.green },
					modified = { fg = colors.pink },
					removed = { fg = colors.red },
				},
				cond = conditions.hide_in_width,
			}
		},
		lualine_c = {
			{
				'filename',
				cond = conditions.buffer_not_empty,
				color = { fg = colors.magenta, gui = 'bold' },
			},
			{
				'diagnostics',
				sources = { 'nvim_diagnostic' },
				symbols = { error = ' ', warn = ' ', info = ' ', hint = " "},
				diagnostics_color = {
					color_error = { fg = colors.red },
					color_warn = { fg = colors.yellow },
					color_info = { fg = colors.cyan },
				}
			},
		},
		lualine_x = {
			--{
			--	function()
			--		local msg = 'No Active Lsp'
			--		local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
			--		local clients = vim.lsp.get_active_clients()
			--		if next(clients) == nil then
			--			return msg
			--		end
			--		for _, client in ipairs(clients) do
			--			local filetypes = client.config.filetypes
			--			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			--				return client.name
			--			end
			--		end
			--		return msg
			--	end,
			--	icon = 'LSP:',
			--	color = { fg = '#ffffff', gui = 'bold' },
			--},
			{
				'filetype', icons_enabled=false
			},
		},
		lualine_y = { 'location' },
		lualine_z = {
			{
				'progress',
				color = { fg = colors.fg },
			}
		}
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


local ins_left = function(component)
  table.insert(statusline.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local ins_right = function(component)
  table.insert(statusline.sections.lualine_x, component)
end


M.setup = function()
	local lualine = require 'lualine'
	lualine.setup(statusline)
end

return M