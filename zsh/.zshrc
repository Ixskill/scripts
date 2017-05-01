# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=4000
setopt appendhistory extendedglob nomatch notify
unsetopt beep
bindkey -v
bindkey '^R' history-incremental-pattern-search-backward
# End of lines configured by zsh-newuser-install

## Autoloads :
autoload -Uz compinit
zstyle :compinstall filename '$HOME/.zshrc'
compinit
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() {
	vcs_info
}
zstyle ':vcs_info:git*' formats " %b "


### Arch relative part : for my laptop only
# Startx on boot
if [[ "$(uname -s)" == "Linux" ]]; then
	export TMPDIR="/var/tmp"
	export HOSTNAME="ade-sede-arch"
fi

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	eval $(keychain --eval --quiet ~/.ssh/id_rsa) && exec startx
fi


# Variables for each config file of my env and comfort settings
export LLDB="/usr/bin/lldb"
export DOTFILES="$HOME/.dotfiles"
export MYVIMRC="$DOTFILES/vim/.vimrc"
export TMUXRC="$DOTFILES/tmux/.tmux.conf"
export ZSHRC="$DOTFILES/zsh/.zshrc"
export i3RC="$DOTFILES/config/.config/i3/config"
export TERMITERC="$DOTFILES/config/.config/termite/config"
export TPLUGS="$DOTFILES/tmux/.tmux/plugins/"
export TODO="$DOTFILES/TODO"
export MAIL="adrien.de.sede@gmail.com"
export VISUAL="vim"
export EDITOR="$VISUAL"
export PROMPT_FILE="$DOTFILES/zsh/.zsh_prompt.zsh"
export BAR="$DOTFILES/config/.config/i3blocks/config"

#Exporting path
export OLD_PATH="$PATH"
export PATH="$OLD_PATH:$DOTFILES/scripts"

# Cd and git resets prompt

source $PROMPT_FILE

setopt PROMPT_SUBST
cd () {
	builtin cd $1 && reset_prompt 
}


reset_prompt (){
	PS1=$(echo_prompt)
}
reset_prompt

# Loading prompt settings
autoload -Uz promptinit
promptinit



# Messing up with zle settings                                     
function zle-line-init zle-keymap-select
{
	VIM_PROMPT="VIM [%K{red}ON%k]%  %k"
	RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
	zle reset-prompt
}
function zle-reset-prompt
{
	PS1=$(echo_prompt)
}
zle -N zle-reset-prompt
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

# Lazy alias				
alias gww="gcc -Wall -Wextra -Werror"
alias ll="ls -alsh"
alias grep="grep --color"
alias 42fc="sh ~/42FileChecker/42FileChecker.sh"
alias v="vim -u $MYVIMRC"
alias clean_tmux="rm ~/.tmux/resurrect/*.txt"
alias clean_swp="rm -rf /var/tmp/*.swp"
alias cd.="cd ."
alias i3lock="xbacklight -set 0 && i3lock -c 000000"


# Load Homebrew config script
if [ -e "$HOME/.brewconfig.zsh" ]; then
	source $HOME/.brewconfig.zsh
fi



