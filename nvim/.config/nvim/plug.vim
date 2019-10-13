" set up vim plug
call plug#begin('~/.config/nvim/plugged')

" Identifies extra whitespace and makes it easy to clear
Plug 'ntpeters/vim-better-whitespace'
" Highlights letters when using f, F, t, T
Plug 'unblevable/quick-scope'
" Snippet engine
Plug 'SirVer/ultisnips'
" Collection of useful snippets
Plug 'honza/vim-snippets'
" Completer for vim
Plug 'ycm-core/YouCompleteMe'
" Syntax checker - currently testing ALE
"Plug 'scrooloose/syntastic'
Plug 'dense-analysis/ale'
" Pretty statusline
Plug 'itchyny/lightline.vim'
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
Plug 'mbbill/undotree'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
call plug#end()
