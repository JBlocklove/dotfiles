#!/bin/bash

########################################
# Base install of neovim
########################################

# config install

cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ nvim
cd -

echo "Installing plugins"
# Install/update vim-plug
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install plugins
nvim +PackerSync
