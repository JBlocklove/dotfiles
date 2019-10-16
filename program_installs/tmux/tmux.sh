#!/bin/bash

########################################
# Base install of tmux
########################################

cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ tmux
cd -
