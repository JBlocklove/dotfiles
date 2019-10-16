#!/bin/bash

########################################
# Config install for compton
########################################

cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ compton
cd -

