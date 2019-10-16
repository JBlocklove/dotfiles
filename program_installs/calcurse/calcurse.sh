#!/bin/bash

########################################
# Base install of calcurse
########################################

cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ calcurse
cd -
