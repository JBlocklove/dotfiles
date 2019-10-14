"let g:ale_open_list = 1
"" Toggle ALE quick list
"noremap <Leader>e :call LoclistToggle()<CR>
"
"function! LoclistToggle()
"  if exists("g:qfix_win")
"    cclose
"    unlet g:qfix_win
"  else
"    copen 10
"    let g:qfix_win = bufnr("$")
"  endif
"endfunction
"
