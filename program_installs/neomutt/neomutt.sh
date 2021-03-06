#!/bin/bash

########################################
# Base install of neomutt
########################################

# mutt-wizard install
pushd .
cd /tmp
git clone https://github.com/LukeSmithxyz/mutt-wizard.git
cd mutt-wizard
sudo make install
popd
rm -rf /tmp/mutt-wizard

cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ neomutt
cd -
