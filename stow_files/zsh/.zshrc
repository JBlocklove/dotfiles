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

## Remap keys to navigate better without arrow keys
bindkey '\C-l' autosuggest-accept
bindkey '\C-k' up-history
bindkey '\C-j' down-history

# Non-controlled custom configs
source ~/.localrc
