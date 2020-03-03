#!/bin/sh

source $HOME/.cache/wal/colors.sh

if [[ $1 == "run" ]]; then
	shift 1
	dmenu_run -nf $foreground -nb $background -sf $foreground -sb $color5 $@
else
	dmenu -nf $foreground -nb $background -sf $foreground -sb $color5 $@
fi
