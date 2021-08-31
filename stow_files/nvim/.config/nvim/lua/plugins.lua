vim.cmd [[packadd packer.nvim]]

packer = require('packer')

return packer.startup({function(use)

	-- Packer can manage itself as an optional plugin
	use { "wbthomason/packer.nvim" }
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
	use {
	  "nvim-telescope/telescope.nvim",
	  config = function()
	    require("plugin_settings.telescope").setup()
	    if nvim.builtin.telescope.on_config_done then
	      nvim.builtin.telescope.on_config_done(require "telescope")
	    end
	  end,
	}
	
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
		-- wants = "vim-vsnip",
		-- requires = {
		-- {
		--	 "hrsh7th/vim-vsnip",
		--	 wants = "friendly-snippets",
		--	 event = "InsertCharPre",
		-- },
		-- {
		--	 "rafamadriz/friendly-snippets",
		--	 event = "InsertCharPre",
		-- },
		-- },
	}
	--use {
	--	"hrsh7th/vim-vsnip",
	--	-- wants = "friendly-snippets",
	--	event = "InsertEnter",
	--}
	--use {
	--	"rafamadriz/friendly-snippets",
	--	event = "InsertCharPre",
	--}
	
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
		-- event = "BufWinOpen",
		-- cmd = "NvimTreeToggle",
		-- commit = "fd7f60e242205ea9efc9649101c81a07d5f458bb",
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
	
	-- Icons
	--use { "kyazdani42/nvim-web-devicons" }
	
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
	
	-- Dashboard
	--use {
	--	"ChristianChiarulli/dashboard-nvim",
	--	event = "BufWinEnter",
	--	config = function()
	--		require("plugin_settings.dashboard").setup()
	--		if nvim.builtin.dashboard.on_config_done then
	--			nvim.builtin.dashboard.on_config_done(require "dashboard")
	--		end
	--	end,
	--	disable = not nvim.builtin.dashboard.active,
	--}
	
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
		"SirVer/ultisnips",
		config = function()
			require("plugin_settings.ultisnips").setup()
		end,
	}

	use {
		"honza/vim-snippets",
	}

	use {
		"rockerBOO/boo-colorscheme-nvim",
	}

	use {
		"marko-cerovac/material.nvim",
		config = function()
			vim.g.material_style = "deep ocean"
		end
	}

	use {
		"bluz71/vim-nightfly-guicolors"
	}

	use {
		"Th3Whit3Wolf/one-nvim"
	}

	use {
		"arcticicestudio/nord-vim"
	}

	use {
		"Th3Whit3Wolf/space-nvim"
	}

	use {
		"novakne/kosmikoa.nvim"
	}

	use {
		"fenetikm/falcon"
	}

	use {
		"MordechaiHadad/nvim-papadark",
		requires = {"rktjmp/lush.nvim"}
	}

	use {
		"shaunsingh/moonlight.nvim"
	}

	use {
		"projekt0n/github-nvim-theme"
	}

	use {
		"Pocco81/Catppuccino.nvim"
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
