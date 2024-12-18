return {

	-- Bufferline
	{
		"akinsho/bufferline.nvim",
		requires = {"nvim-tree/nvim-web-devicons"},
		config = function()
			require('bufferline').setup{ ---@diagnostic disable-line: redundant-parameter
				options = {
					--highlights = require("catppuccin.groups.integrations.bufferline").get(),

					right_mouse_command = nil,
					left_mouse_command = nil,
					middle_mouse_command = nil,
					indicator = {
						style = 'none'
					},
					diagnostics = false,
					offsets = {
					    {
					        filetype = "NvimTree",
					        text = "File Explorer",
							highlight = "PanelHeading",
							padding = 1,
					        separator = true,
					    },
						{
							filetype = "packer",
							text = "Packer",
							highlight = "PanelHeading",
							padding = 1,
					        separator = true,
						},
					},
					color_icons = true, -- whether or not to add the filetype icon highlights
					show_buffer_icons = true, -- disable filetype icons for buffers
					show_buffer_close_icons = false,
					show_close_icon = false,
					show_tab_indicators = true,
					persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
					enforce_regular_tabs = false,
					always_show_bufferline = true,
					sort_by = 'id',
			        max_name_length = 15,
			        tab_size = 15,
					separator_style = {"│", "│"},
				}
			}
		end,
	},

}
