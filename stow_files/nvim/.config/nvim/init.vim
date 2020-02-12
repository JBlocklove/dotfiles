"My init.vim is split into several files for the purposes of keeping things as
"modular and portable as possible

filetype plugin on

"Sourcing for all of my settings
if filereadable(expand("~/.config/nvim/plug.vim"))
	source ~/.config/nvim/plug.vim
endif

source ~/.config/nvim/colors/colorrc.vim
source ~/.config/nvim/configs/ale.vim
source ~/.config/nvim/configs/sniprc.vim
source ~/.config/nvim/configs/map.vim
source ~/.config/nvim/configs/general.vim
source ~/.config/nvim/configs/searching.vim
source ~/.config/nvim/configs/ycmrc.vim
source ~/.config/nvim/configs/lightLinerc.vim
source ~/.config/nvim/configs/filetype.vim
source ~/.config/nvim/configs/undo.vim
source ~/.config/nvim/configs/nerdtree.vim
source ~/.config/nvim/configs/quickscope.vim
"source ~/.config/nvim/configs/statusline.vim
