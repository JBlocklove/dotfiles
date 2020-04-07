## Run only at login
compton &
#wal -R &

$XDG_CONFIG_HOME/wm/scripts/set_last_wp.sh &
dwm_statusbar &

sleep 1

blueman-applet &

cd $HOME
franz &
sleep 2
signal-desktop-beta &
#$HOME/.local/bin/neomutt_run
