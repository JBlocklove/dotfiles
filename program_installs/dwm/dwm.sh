#!/bin/bash

########################################
# Base install of st
########################################

# config install
pushd .
git clone https://github.com/JBlocklove/dwm.git /tmp/dwm
git clone https://github.com/JBlocklove/dmenu.git /tmp/dmenu
cd /tmp/dwm
sudo make install
cd /tmp/dmenu
sudo make install
popd
rm -rf /tmp/dwm /tmp/dmenu

cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ dwm wm dmenu
cd -
