#!/bin/sh

#shamelessly stolen from https://github.com/LukeSmithxyz/voidrice/blob/master/.local/bin/dmenuunicode

# The famous "get a menu of emojis to copy" script.

COLOR_DMENU=$HOME/.config/dmenu/scripts/color_dmenu.sh

# Must have xclip installed to even show menu.
xclip -h 2>/dev/null || exit 1

chosen=$(cut -d ';' -f1 ~/.emoji | $COLOR_DMENU -i -c -l 20 | sed "s/ .*//")

[ "$chosen" != "" ] || exit

# If you run this command with an argument, it will automatically insert the character.
if [ -n "$1" ]; then
	xdotool key Shift+Insert
else
	echo "$chosen" | tr -d '\n' | xclip -selection clipboard
	notify-send "'$chosen' copied to clipboard." &
fi
