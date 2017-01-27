# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=4000
setopt appendhistory extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# Exporting a few variables
export MYVIMRC="$HOME/.vimrc"
export MAIL="adrien.de.sede@gmail.com"
export HOST="ade-sede-arch"

# Variables for each config file of my env
export TMUXRC="$HOME/.tmux.conf"
export ZSHRC="$HOME/.zshrc"
export i3RC="$HOME/.i3/config"
export TERMRC="/home/ade-sede/.config/termite/config"
export TPLUGS="$HOME/.tmux/plugins/"

# Lazy alias
alias gww="gcc -Wall -Wextra -Werror"
alias ll="ls -alsh"
alias grep="grep --color"
alias v="vim"
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to\ full|percentage"'
alias save="sh $TPLUGS/tmux-resurrect/scripts/save.sh"
alias restore="sh $TPLUGS/tmux-resurrect/scripts/restore.sh"

# Startx on boot
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
fi

# Start TMUX session if the opened shell inst tmux's child process
#if [ -z "$TMUX" ]; then
#	exec tmux
#fi

# The following lines were added by compinstall
autoload -Uz compinit
zstyle :compinstall filename '$HOME/.zshrc'
compinit
# End of lines added by compinstall
