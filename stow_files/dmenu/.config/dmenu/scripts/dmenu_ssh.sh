#!/bin/sh

SSH_CMD="st -e ssh "

function get_hosts(){
	while read line; do
		label=$(echo $line | cut -d' ' -f1)
		if [[ $label == "Host" ]]; then
			host=$(echo $line | cut -d' ' -f2)
			echo $host
		fi
	done < $HOME/.ssh/config

}

SEL=$( get_hosts | dmenu -c -l 10 -p "ssh:" | awk '{print $1}' )

$SSH_CMD $SEL
