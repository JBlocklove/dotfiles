#!/bin/bash

########################################
# Base install of st
########################################

# config install
pushd .
cd /tmp
git clone https://github.com/JBlocklove/dwm.git
cd dwm
sudo make install
popd
rm -rf /tmp/st

cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ dwm wm
cd -
