# JBlocklove's Dotfiles
#### Includes configs linked through [GNU Stow](https://www.gnu.org/software/stow/) and installation scripts for all my programs

## Installation
```git clone --recursive https://github.com/JBlocklove/new_dotfiles.git ~/.dotfiles && cd ~/.dotfiles```

To install individual programs run:

```./install_and_link <prog1> <prog2> ... <progN>```

or to install all of my programs and configs:

```./install_and_link all```

*Note: most of the installation mechanisms were taken from https://github.com/Serubin/dotfiles*

## Linking
If you want to link the dotfiles for a program but not install that program using `install_and_link`:
```cd stow_files```
```stow -t ~/ <prog1> <prog2> ... <progN>````

## OS Support
Due to the different ways with which each OS installs its programs, each OS has to use its own install script for now. As a result, not all are currently supported for all programs.
### Most installs working
* Debian/Ubuntu
* Fedora
* OS X (with brew)
### All installs working
* Arch

## TODO
There's still a lot to be done in terms of moving my old dotfiles over and cleaning up this repo
- [x] Shell install and configs
- [ ] WM install and configs
- [x] Implementing `all` option in `install_and_link`
- [x] Implementing options like `-l` to list available programs in `install_and_link`
- [x] Cleaning up directory structure so it still works with stow
