#!/bin/bash

########################################
# Base install of st
########################################

# config install
pushd .
cd /tmp
git clone https://github.com/JBlocklove/dwm.git
git clone https://github.com/JBlocklove/dmenu.git
cd dwm
sudo make install
cd ../dmenu
sudo make install
popd
rm -rf /tmp/st

cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ dwm wm pywal dmenu
cd -
