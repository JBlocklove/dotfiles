" set up vim plug
call plug#begin('~/.config/nvim/plugged')

" Highlights a unique letter in each word when using f, F, t, T
Plug 'unblevable/quick-scope'
" Snippet engine
Plug 'SirVer/ultisnips'
" Collection of useful snippets
Plug 'honza/vim-snippets'
" Completer for vim
"Plug 'ycm-core/YouCompleteMe'
"Plug 'Shougo/ddc.vim'
"Plug 'vim-denops/denops.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
"Plug 'hrsh7th/nvim-compe'
" Syntax checker
Plug 'w0rp/ale'
" Pretty statusline
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
" Undotree
Plug 'mbbill/undotree'
" Files exploring and whatnot
Plug 'scrooloose/nerdtree'
" Fuzzy finder - added to work with papis
Plug 'junegunn/fzf', {'for': 'tex'}
" Integration with papis for adding citations
Plug 'JBlocklove/vim-papis', {'for': 'tex'}
" LaTeX compiler and whatnot
Plug 'lervag/vimtex', {'for': 'tex'}
" Highlight hex colors in vim
Plug 'ap/vim-css-color'
" Allows entity/component copy/paste
Plug 'JBlocklove/VIP', {'for': ['vhdl', 'verilog']}

call plug#end()
