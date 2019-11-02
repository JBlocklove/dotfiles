let g:ale_fix_on_save = 1

let g:ale_fixers = {
			\ '*' : ['remove_trailing_lines', 'trim_whitespace'],
			\}

nnoremap <leader>0 :ALEFix<cr>
