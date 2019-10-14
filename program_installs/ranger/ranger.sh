#!/bin/bash

##############################
# Base install of Ranger
##############################

cd $DOTFILES_INSTALL
stow --verbose ranger
cd -

pushd .
cd /tmp
git clone https://github.com/alexanderjeurissen/ranger_devicons
cd ranger_devicons
make install
popd
rm -rf /tmp/ranger_devicons
