#!/bin/bash

#########################
# Config install of rofi
#########################

echo "Linking rofi configs"
cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ rofi
cd -
