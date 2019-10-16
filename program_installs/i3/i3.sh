#!/bin/bash

########################################
# Base install of i3
# Tiled Window Manager
########################################

# i3 install with thanks to
# https://www.reddit.com/r/unixporn/comments/3efhs7/i3_gaps_a_bit_obsessed_with_material_design/
# and
# aur.sh (it's a website and a script)

###############################
#             i3              #
###############################
echo "Installing I3"

mkdir -p $HOME/.config/i3

ln -sfv ${PACKAGE_INSTALL}/config/i3.config ${HOME}/.config/i3/config

mkdir -p $HOME/.config/polybar

ln -sfv ${PACKAGE_INSTALL}/config/polybar.config ${HOME}/.config/polybar/config
ln -sfv ${PACKAGE_INSTALL}/config/polybar_launch.sh ${HOME}/.config/polybar/launch.sh

sudo ln -sfv ${PACKAGE_INSTALL}/config/lock /usr/bin/lock
sudo ln -sfv ${PACKAGE_INSTALL}/config/lock /usr/local/bin/lock

###############################
#     st & URxvt Terminals    #
###############################

echo "Making st terminal"

cd ${PACKAGE_INSTALL}/../st
sudo make install
cd -

echo "Setting up URxvt"

ln -sfv ${PACKAGE_INSTALL}/config/Xdefaults $HOME/.Xdefaults

###############################
#           Rofi              #
###############################

echo "Setting up Rofi"

mkdir -p $HOME/.config/rofi/

ln -sfv ${PACKAGE_INSTALL}/config/rofi.config $HOME/.config/rofi/config
ln -sfv ${PACKAGE_INSTALL}/config/clean_purple.rasi $HOME/.config/rofi/clean_purple.rasi

###############################
#            Compton          #
###############################

echo "Setting up Compton"

ln -sfv ${PACKAGE_INSTALL}/config/compton.conf $HOME/.config/compton.conf

###############################
#            Dunst			  #
###############################

echo "Setting up Dunst"

ln -sfv ${PACKAGE_INSTALL}/config/dunstrc ${HOME}/.config/dunst/dunstrc

