#!/bin/bash

########################################
# Base install of st
########################################

# config install

cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ st
cd -

cd st_build
sudo make install
cd -
