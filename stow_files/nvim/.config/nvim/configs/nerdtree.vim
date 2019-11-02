let NERDTreeShowHidden=1

nnoremap <leader>t :NERDTreeToggle<CR>

let NERDTreeIgnore = ['\.png$','\.jpg$','\.gif$','\.mp3$','\.flac$', '\.mp4$','\.avi$','.mkv$','\.pdf$', '\.zip$', '\.tar.gz$', '\.rar$', '\.7z$']

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
