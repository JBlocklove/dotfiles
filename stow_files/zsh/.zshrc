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

# remap autosuggestion complete to <C-p> to match my nvim github copilot map
bindkey '\C-p' autosuggest-accept

# Non-controlled custom configs
source ~/.localrc
