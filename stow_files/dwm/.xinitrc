userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

[ -f ~/.xprofile ] && . ~/.xprofile

compton &
wal -R &

wm_set_last_wp &
dwm_statusbar &

mopidy &
sshfs erebor:/homes/media/Music ~/Music/remote_lib -o reconnect &
sshfs erebor:/homes/media/Podcasts ~/Music/remote_podcasts -o reconnect &
sshfs erebor:/homes/media/Audiobooks ~/Music/remote_audiobooks -o reconnect &

blueman-applet &
#
#cd $HOME
discord &
signal-desktop &
neomutt_run &

while type dwm >/dev/null ; do dwm && continue || break ; done
