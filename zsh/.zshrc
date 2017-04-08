# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=4000
setopt appendhistory extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install




### Arch relative part : for my laptop only
# Startx on boot
if [[ "$(uname -s)" == "Linux" ]]; then
	export TMPDIR="/var/tmp"
fi
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	eval $(keychain --eval --quiet ~/.ssh/id_rsa) && exec startx
fi

# Variables for each config file of my env and comfort settings
export DOTFILES="$HOME/.dotfiles"
export MYVIMRC="$DOTFILES/vim/.vimrc"
export TMUXRC="$DOTFILES/tmux/.tmux.conf"
export ZSHRC="$DOTFILES/zsh/.zshrc"
export i3RC="$DOTFILES/config/.config/i3/config"
export TERMRC="$DOTFILES/config/.config/terminator/config"
export TPLUGS="$DOTFILES/tmux/.tmux/plugins/"
export TODO="$DOTFILES/TODO"
export MAIL="adrien.de.sede@gmail.com"
export VISUAL="vim"
export EDITOR="$VISUAL"
export PROMPT_FILE="$DOTFILES/zsh/.zsh_prompt.zsh"

#Exporting path
export OLD_PATH="$PATH"
export PATH="$OLD_PATH:$DOTFILES/scripts"

# Cd and git resets prompt
cd () {
	builtin cd $1 && PS1=$(echo_prompt)
}

# Loading prompt settings
autoload -Uz promptinit
promptinit

source $PROMPT_FILE
export PS1=$(echo_prompt)
# ref = #source $DOTFILES/themes/agnoster.zsh-theme

# Messing up with zle settings                                     
function zle-line-init zle-keymap-select
{
	VIM_PROMPT="VIM [%K{red}ON%k]%  %k"
	RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
	zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1


# Lazy alias														
alias gww="gcc -Wall -Wextra -Werror"
alias ll="ls -alsh"
alias grep="grep --color"
alias 42fc="sh ~/42FileChecker/42FileChecker.sh"
alias v="vim"
alias clean_tmux="rm ~/.tmux/resurrect/*.txt"
alias clean_swp="rm -rf /var/tmp/*.swp"
alias mute="amixer sset 'Master' 0%"

#			This one is for my prompt to reset when i co
#alias "git checkout"="git co && PS1=$(echo_prompt) && echo "lol""


# The following lines were added by compinstall
autoload -Uz compinit
zstyle :compinstall filename '$HOME/.zshrc'
compinit
# End of lines added by compinstall


# Load Homebrew config script
if [ -e "$HOME/.brewconfig.zsh" ]; then
	source $HOME/.brewconfig.zsh
fi
