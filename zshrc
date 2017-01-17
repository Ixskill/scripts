# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=4000
setopt appendhistory extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
export MYVIMRC="$HOME/.vimrc"
export MAIL="adrien.de.sede@gmail.com"
########## SETTING UP VARIABLE FOR CONF FILES ####
export TMUXRC="$HOME/.tmux.conf"
export ZSHRC="$HOME/.zshrc"
export i3RC="$HOME/.i3/config"
export TERMRC="/home/ade-sede/.config/termite/config"
#################### ALIAS ###########
alias gww="gcc -Wall -Wextra -Werror"
alias ll="ls -alsh"
alias grep="grep --color"
alias v="vim"
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to\ full|percentage"'
###################### Startx on boot\
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
fi
compinit
########
# End of lines added by compinstall
