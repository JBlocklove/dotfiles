#!/bin/bash

########################################
# Arch install of VHDL
# Very hard description language
########################################

cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ vhdl
cd -
