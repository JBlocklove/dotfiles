#!/bin/bash

########################################
# Base install of git
# Version Control
########################################

cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ git
cd -
