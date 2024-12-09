userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
#sysresources=/etc/X11/xinit/.Xresources
#sysmodmap=/etc/X11/xinit/.Xmodmap
#
## merge in defaults and keymaps
#
#if [ -f $sysresources ]; then
#    xrdb -merge $sysresources
#fi
#
#if [ -f $sysmodmap ]; then
#    xmodmap $sysmodmap
#fi
#
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

#if [ -f "$usermodmap" ]; then
#    #xmodmap "$usermodmap"
#fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

[ -f ~/.xprofile ] && . ~/.xprofile

wm_set_last_wp &
dwm_statusbar &

#mopidy &
#sleep 8
#mpd-notification -t 3 &

neomutt_run &
signal-desktop &
ferdium &

caps_to_esc &
#set_battery_led &

while type dwm >/dev/null ; do dwm && continue || break ; done
#exec awesome
