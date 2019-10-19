#/bin/bash

########################################
# Zsh
# Z Shell
########################################
cd $DOTFILES_INSTALL/stow_files
stow --verbose -t ~/ zsh
cd -

echo "Setting zsh as default shell"
chsh -s /bin/zsh
