#/bin/bash

########################################
# Base install of htop
# Top for humans
########################################

cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ htop
cd -
