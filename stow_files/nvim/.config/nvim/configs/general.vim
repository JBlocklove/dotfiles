"This file is where I put stuff that I couldn't think fit anywhere else
"
"Set syntax on
syntax on
set tabstop=4
set autoindent
set smartindent
set noexpandtab
set shiftwidth=4
set softtabstop=4
set modelines=1
set encoding=utf-8
set title
set hidden
set autoread
set scrolloff=5
set undolevels=1000
set udf

set splitbelow splitright

"number setting toggle
set number
set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set number
	set norelativenumber
  else
	set number
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

"sets line numbers to dark grey so they don't blend in with actual text
hi LineNr ctermfg=DarkGrey
