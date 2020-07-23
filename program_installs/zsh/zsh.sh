#/bin/bash

########################################
# Zsh
# Z Shell
########################################
cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ zsh
cd -

touch ~/.localrc ~/.local_profile

echo "Setting zsh as default shell"
chsh -s /bin/zsh
