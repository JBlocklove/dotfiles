# JBlocklove's Dotfiles
#### Includes configs linked through [GNU Stow](https://www.gnu.org/software/stow/) and installation scripts for all my programs

## Installation
```git clone --recursive https://github.com/JBlocklove/dotfiles.git ~/.dotfiles && cd ~/.dotfiles```

To install individual programs run:

```./install_and_link <prog1> <prog2> ... <progN>```

or to install all of my programs and configs:

```./install_and_link all```

*Note: most of the installation mechanisms were taken from https://github.com/Serubin/dotfiles*

## Linking
If you want to link the dotfiles for a program but not install that program using `install_and_link`:

```cd stow_files```

```stow -t ~/ <prog1> <prog2> ... <progN>```

## OS Support
Automatic installation is now only supported on Arch Linux, primarily using yay
