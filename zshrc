# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=4000
setopt appendhistory extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# Arch relative part : for my laptop
if [ "$(uname -s)" = "Linux" ]; then
	eval $(keychain --eval --quiet ~/.ssh/id_rsa)
	export HOST="ade-sede-arch"
fi

# Variables for each config file of my env and comfort settings
export DOTFILES="$HOME/projects/dotfiles"
export MYVIMRC="$HOME/.vimrc"
export TMUXRC="$HOME/.tmux.conf"
export ZSHRC="$HOME/.zshrc"
export i3RC="$HOME/.config/i3/config"
export TERMRC="/home/ade-sede/.config/terminator/config"
export TPLUGS="$HOME/.tmux/plugins/"
export MAIL="adrien.de.sede@gmail.com"
export PS1="[$USER %20<...<%~%<<]$ "
export VISUAL="vim"

# Lazy alias
alias gww="gcc -Wall -Wextra -Werror"
alias ll="ls -alsh"
alias grep="grep --color"
alias 42fc="sh ~/42FileChecker/42FileChecker.sh"
alias v="vim"
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to\ full|percentage"'
alias clean_tmux="rm ~/.tmux/resurrect/*.txt"
alias clean_swp="rm -rf /var/tmp/*.swp"
# Startx on boot
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
fi

# The following lines were added by compinstall
autoload -Uz compinit
zstyle :compinstall filename '$HOME/.zshrc'
compinit
# End of lines added by compinstall

# Load Homebrew config script
if [ -e "$HOME/.brewconfig.zsh" ]; then
	source $HOME/.brewconfig.zsh
fi
