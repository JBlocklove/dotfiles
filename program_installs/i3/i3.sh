#!/bin/bash

########################################
# Base install of i3
# Tiled Window Manager
########################################

echo "Configuring i3"
cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ i3 dunst qutebrowser polybar
cd -
