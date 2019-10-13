#!/bin/bash

########################################
# Base install of vim
# ViImproved
########################################

# config install

cd $DOTFILES_INSTALL
stow nvim
cd -

PLUGGED_DIR=${HOME}/.config/nvim/plugged

echo "Installing plugins"
# Install/update vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins
nvim +PlugInstall +qall

echo "Compiling ycm"
# Compile YouCompleteMe
cd "${PLUGGED_DIR}/YouCompleteMe"

if [ "$DISTRO" == "Arch" ]; then # work around for arch, because smart python linking.
    /usr/bin/env python3 install.py --clang-completer --system-libclang
else
    /usr/bin/env python3 install.py
fi

cd -

# Removing variables
unset PLUGGED_DIR
