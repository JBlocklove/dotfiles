#!/bin/sh

SSH_CMD="st -e ssh "

COLOR_DMENU="$HOME/.config/dmenu/scripts/color_dmenu.sh "

function get_hosts(){
	readarray -t ssh_configs < $HOME/.ssh/config
	for (( i = 0; i < ${#ssh_configs[@]}; i++ )); do
		line=${ssh_configs[$i]}
		label=$(echo $line | cut -d' ' -f1)
		if [[ $label == "Host" ]]; then
			if [[ $(echo ${ssh_configs[$i+1]} |  cut -d' ' -f1) == "HostName" ]]; then
				host=$(echo $line | cut -d' ' -f2)
				echo $host
			fi
		fi
	done

}

SEL=$( get_hosts | $COLOR_DMENU -c -l 10 -p "ssh:" | awk '{print $1}' )

if [[ ! -z $SEL ]]; then
	$SSH_CMD $SEL
fi
