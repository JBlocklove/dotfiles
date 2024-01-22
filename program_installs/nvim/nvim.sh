#!/bin/bash

########################################
# Base install of neovim
########################################

# config install

cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ nvim
cd -
