#!/bin/bash

##############################
# Config install of polybar
##############################

echo "Linking polybar configs"
cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ polybar
cd -
