if [ -d "$HOME/.cargo/bin" ] ; then
  PATH="$PATH:$HOME/.cargo/bin:$HOME/bin"
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$PATH:$HOME/.local/bin"
fi

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

#if [[ ! -z $DISPLAY ]]; then
#	xset +fp $HOME/.local/share/fonts
#	xset fp rehash
#fi

# source local non-version controlled profile
source ~/.local_profile
