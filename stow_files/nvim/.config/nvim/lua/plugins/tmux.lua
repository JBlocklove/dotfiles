return {
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		cmd = {
		  "TmuxNavigateLeft",
  		  "TmuxNavigateDown",
  		  "TmuxNavigateUp",
  		  "TmuxNavigateRight",
  		},
  		keys = {
  		  { "<C-S-h>", "<cmd>TmuxNavigateLeft<cr>" },
  		  { "<C-S-j>", "<cmd>TmuxNavigateDown<cr>" },
  		  { "<C-S-k>", "<cmd>TmuxNavigateUp<cr>" },
  		  { "<C-S-l>", "<cmd>TmuxNavigateRight<cr>" },
  		},
	},
}
