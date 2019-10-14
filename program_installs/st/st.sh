#!/bin/bash

########################################
# Base install of st
########################################

# config install

cd $DOTFILES_INSTALL
stow --verbose st
cd -

cd st_build
sudo make install
cd -
