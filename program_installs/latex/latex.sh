#!/bin/bash

########################################
# Base install of LaTeX
# A Markup Language
########################################


cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ latex
cd -

# Vimtex needs --remote in vim, so this puts it back for neovim
#pip3 install --user neovim-remote
