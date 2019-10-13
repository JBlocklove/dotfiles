" enforce purity
nnoremap  <Up> <Nop>
nnoremap  <Down> <Nop>
nnoremap  <Left> <Nop>
nnoremap <Right> <Nop>
"enfore purity in INSERT mode
inoremap  <Up> <Nop>
inoremap  <Down> <Nop>
inoremap  <Left> <Nop>
inoremap <Right> <Nop>



"Remaps vim commands ':W',':Wq', and ':Q' to ':w',':wq', and ':q'
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))

"Makes switching through splits much easier
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Tab> :n<cr><cr>
nnoremap <S-Tab> :N<cr><cr>

"""""""""""""""""LEADER MAPPING"""""""""""""""""""""
"Various remaps which use the <leader> key
nnoremap <leader>0 :StripWhitespace <return>

nnoremap <leader>w <C-w>v<C-w>l

nnoremap <leader>v :vsplit <cr>
nnoremap <leader>h :split <cr>
