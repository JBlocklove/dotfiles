" Sets filetypes for all files with certain extensions. This exists purely to
" solve issues with ftplugins and snippets not properly recognizing files

" .tex files are now filetype tex
autocmd BufRead,BufNewFile *.tex setlocal filetype=tex

" .cls files are now filetype tex
autocmd BufRead,BufNewFile *.cls setlocal filetype=tex

" constraint files
autocmd BufRead,BufNewFile *.xdc setlocal filetype=xdc

" ms files are now groff filetype
autocmd BufRead,BufNewFile *.ms setlocal filetype=groff
