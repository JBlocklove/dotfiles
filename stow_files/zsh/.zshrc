# Skip if non-interactive
[[ $- != *i* ]] && return

# source all base config files
for DOTFILE in $HOME/.shellrc/.*; do
	[ -d "$DOTFILE" ] && continue;
	[ -r "$DOTFILE" ] && source "$DOTFILE"
done

if [ -r ~/.dir_colors ]; then
    eval $(dircolors ~/.dir_colors);
fi

# Non-controlled custom configs
source ~/.localrc
