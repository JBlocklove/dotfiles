#!/bin/bash

########################################
# Base install of dunst
########################################

cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ dunst
cd -
