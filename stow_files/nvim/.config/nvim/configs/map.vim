" enforce purity nnoremap  <Up> <Nop>
nnoremap  <Down> <Nop>
nnoremap  <Left> <Nop>
nnoremap <Right> <Nop>
"enfore purity in INSERT mode
inoremap    <Up> <Nop>
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

nnoremap <S-j> :resize +5 <cr>
nnoremap <S-k> :resize -5 <cr>
nnoremap <S-h> :vertical resize -5 <cr>
nnoremap <S-l> :vertical resize +5 <cr>


nnoremap <Tab> :bn<cr>
nnoremap <S-Tab> :bp<cr>

nnoremap <leader>v :vsplit <cr>
nnoremap <leader>h :split <cr>
