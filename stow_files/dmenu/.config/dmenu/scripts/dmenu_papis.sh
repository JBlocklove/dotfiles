#!/bin/sh

COLOR_DMENU=$HOME/.config/dmenu/scripts/color_dmenu.sh

PAPIS_OPEN="papis open "

SEL=$(papis list --all --format '{doc[title]} - {doc[author]}' | $COLOR_DMENU -i -F -c -l 20 -p "paper:" | awk "{print $1}" )
SEL=$(echo "$SEL" | sed "s/{//g" | sed "s/}//g")

if [[ ! -z $SEL ]]; then
	echo "$SEL"
	#$PAPIS_OPEN "$SEL"
fi
