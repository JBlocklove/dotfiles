" set up vim plug
call plug#begin('~/.config/nvim/plugged')

" Identifies extra whitespace and makes it easy to clear
Plug 'ntpeters/vim-better-whitespace'
" Highlights a unique letter in each word when using f, F, t, T
Plug 'unblevable/quick-scope'
" Snippet engine
Plug 'SirVer/ultisnips'
" Collection of useful snippets
Plug 'honza/vim-snippets'
" Completer for vim
Plug 'ycm-core/YouCompleteMe'
" Syntax checker
Plug 'w0rp/ale'
" Pretty statusline
Plug 'itchyny/lightline.vim'
" Undotree
Plug 'mbbill/undotree'
" Fuzzy finder - added to work with papis
Plug 'junegunn/fzf', {'for': 'tex'}
" Integration with papis for adding citations
Plug 'papis/papis-vim', {'for': 'tex'}
" LaTeX compiler and whatnot
Plug 'lervag/vimtex', {'for': 'tex'}
" Allows entity/component copy/paste
Plug 'JBlocklove/VIP', {'for': 'vhdl'}

""""""""""""""""""""""TESTING""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
call plug#end()
