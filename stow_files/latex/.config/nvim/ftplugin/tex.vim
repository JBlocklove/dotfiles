" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
    finish
endif

setlocal spell spelllang=en_us

augroup latex
    autocmd!
    autocmd BufWinEnter *.tex :VimtexCompile
augroup END

"augroup quickfix
"  autocmd!
"  autocmd Syntax qf wincmd p
"augroup END

let g:tex_flavor='latex'
let g:vimtex_fold_enabled = '1'
let g:vimtex_fold_manual = '0'
let g:vimtex_toc_fold = '1'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_general_viewer = 'zathura'

" Testing Tex stuff (not really sure what it does yet)
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
      \ 're!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*'
        \ ]

" Move visible line-by-line
map J gj
map K gk

nnoremap <buffer> <leader><leader>p :Papis <CR>
