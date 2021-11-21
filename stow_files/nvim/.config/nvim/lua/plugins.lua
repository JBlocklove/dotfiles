vim.cmd [[packadd packer.nvim]]

packer = require('packer')

return packer.startup({function(use)

	-- Packer can manage itself as an optional plugin
	use { "wbthomason/packer.nvim" }

	-- LSP
	use { "neovim/nvim-lspconfig" }
	use { "tamago324/nlsp-settings.nvim" }
	use { "jose-elias-alvarez/null-ls.nvim" }
	use {
		"kabouzeid/nvim-lspinstall",
		event = "VimEnter",
		config = function()
			local lspinstall = require "lspinstall"
			lspinstall.setup()
			if nvim.builtin.lspinstall.on_config_done then
				nvim.builtin.lspinstall.on_config_done(lspinstall)
			end
		end,
	}

	use { "nvim-lua/popup.nvim" }
	use { "nvim-lua/plenary.nvim" }
	-- Telescope
	--use {
	--  "nvim-telescope/telescope.nvim",
	--  config = function()
	--    require("plugin_settings.telescope").setup()
	--    if nvim.builtin.telescope.on_config_done then
	--      nvim.builtin.telescope.on_config_done(require "telescope")
	--    end
	--  end,
	--}

	-- Completion & Snippets
	use {
		"hrsh7th/nvim-compe",
		event = "InsertEnter",
		config = function()
			require("plugin_settings.compe").setup()
			if nvim.builtin.compe.on_config_done then
				nvim.builtin.compe.on_config_done(require "compe")
			end
		end,
	}

	use {
		"SirVer/ultisnips",
		config = function()
			require("plugin_settings.ultisnips").setup()
		end,
	}

	use {
		"honza/vim-snippets",
	}

	-- Autopairs
	use {
		"windwp/nvim-autopairs",
		-- event = "InsertEnter",
		after = "nvim-compe",
		config = function()
			require "plugin_settings.autopairs"
			if nvim.builtin.autopairs.on_config_done then
				nvim.builtin.autopairs.on_config_done(require "nvim-autopairs")
			end
		end,
	}

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		branch = "0.5-compat",
		-- run = ":TSUpdate",
		config = function()
			require("plugin_settings.treesitter").setup()
			if nvim.builtin.treesitter.on_config_done then
				nvim.builtin.treesitter.on_config_done(require "nvim-treesitter.configs")
			end
		end,
	}

	-- NvimTree
	use {
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("plugin_settings.nvimtree").setup()
			if nvim.builtin.nvimtree.on_config_done then
				nvim.builtin.nvimtree.on_config_done(require "nvim-tree.config")
			end
		end,
	}

	use {
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugin_settings.gitsigns").setup()
			if nvim.builtin.gitsigns.on_config_done then
				nvim.builtin.gitsigns.on_config_done(require "gitsigns")
			end
		end,
		event = "BufRead",
	}

	-- Whichkey
	use {
		"folke/which-key.nvim",
		config = function()
			require("plugin_settings.which-key").setup()
			if nvim.builtin.which_key.on_config_done then
				nvim.builtin.which_key.on_config_done(require "which-key")
			end
		end,
		event = "BufWinEnter",
	}

	-- Comments
	--use {
	--	"terrortylor/nvim-comment",
	--	event = "BufRead",
	--	config = function()
	--		local status_ok, nvim_comment = pcall(require, "nvim_comment")
	--		if not status_ok then
	--			return
	--		end
	--		nvim_comment.setup()
	--		if nvim.builtin.comment.on_config_done then
	--			nvim.builtin.comment.on_config_done(nvim_comment)
	--		end
	--	end,
	--}

	-- vim-rooter
	use {
		"airblade/vim-rooter",
		-- event = "BufReadPre",
		config = function()
			require("plugin_settings.rooter").setup()
			if nvim.builtin.rooter.on_config_done then
				nvim.builtin.rooter.on_config_done()
			end
		end,
		disable = not nvim.builtin.rooter.active,
	}

	-- Status Line and Bufferline
	use {
		"glepnir/galaxyline.nvim",
		config = function()
			require "plugin_settings.galaxyline"
			if nvim.builtin.galaxyline.on_config_done then
				nvim.builtin.galaxyline.on_config_done(require "galaxyline")
			end
		end,
		event = "BufWinEnter",
		disable = not nvim.builtin.galaxyline.active,
	}

	use {
		"romgrk/barbar.nvim",
		config = function()
			require("plugin_settings.bufferline").setup()
			if nvim.builtin.bufferline.on_config_done then
				nvim.builtin.bufferline.on_config_done()
			end
		end,
		event = "BufWinEnter",
		disable = not nvim.builtin.bufferline.active,
	}

	-- Quickscope
	use {
		"unblevable/quick-scope",
		config = function()
			require("plugin_settings.quick-scope").setup()
		end
	}

	-- VimTex
	use {
		"lervag/vimtex",
		ft = "tex",
		opt = "true",
		config = function()
			require("plugin_settings.vimtex").setup()
		end,
	}

	-- Copying/pasting VHDL entities
	use {
		"JBlocklove/VIP",
		ft = "vhdl",
		opt = "true"
	}

	use {
		"shaunsingh/moonlight.nvim",
		config = function()
			require("plugin_settings.moonlight").setup()
		end
	}

	use {
		"Pocco81/Catppuccino.nvim",
		--config = function()
		--	require("plugin_settings.catppuccino").setup()
		--end
	}

	use {
		"rose-pine/neovim"
	}
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}}
)
