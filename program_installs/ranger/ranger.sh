#!/bin/bash

##############################
# Base install of Ranger
##############################

cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ ranger
cd -
