" Persistent undo stuff
if has('persistent_undo')
	silent !mkdir ~/.config/nvim/undo > /dev/null 2>&1
	set undodir=~/.config/nvim/undo
	set undofile
endif

" Toggles the undotree plugin
nmap <leader>u :UndotreeToggle<CR>
