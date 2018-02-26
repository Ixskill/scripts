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
if [ "$(uname -s)" = "Linux" ]; then
	export TMPDIR="/var/tmp"
	export HOSTNAME="ade-sede-arch"
	alias pbcopy='xsel --clipboard --input'
	alias pbpaste='xsel --clipboard --output'
	alias docker="sudo docker"
	alias ls="ls --colo=auto"
	alias ll="ls --color=auto -alsh"
	# source $HOME/.locale.conf
fi

# Variables for each config file of my env and comfort settings
if [ "$(uname -s)" = "Darwin" ]; then
	# export VAGRANT_HOME="/sgoinfre/goinfre/Perso/ade-sede/vagrant_home"
	# mkdir -p "/sgoinfre/goinfre/Perso/ade-sede/vagrant_home"
	alias ls="ls -G"
fi

export LLDB="/usr/bin/lldb"
export DOTFILES="$HOME/.dotfiles"
export MYVIMRC="$DOTFILES/vim/.vimrc"
export EMACSRC="$DOTFILES/emacs/.emacs"
export TMUXRC="$DOTFILES/tmux/.tmux.conf"
export ZSHRC="$DOTFILES/zsh/.zshrc"
export i3RC="$DOTFILES/config/.config/i3/config"
export TERMITERC="$DOTFILES/config/.config/termite/config"
export TPLUGS="$DOTFILES/tmux/.tmux/plugins/"
export TODO="$DOTFILES/TODO"
export MAIL="adrien.de.sede@gmail.com"
# export VISUAL="vim"
export VISUAL="emacsclient -nw -a ''"
export EDITOR="$VISUAL"
export PROMPT_FILE="$DOTFILES/zsh/.zsh_prompt.zsh"
export BAR="$DOTFILES/config/.config/i3blocks/config"


# Cd and git resets prompt

# [ -f $PROMPT_FILE ] && source $PROMPT_FILE || echo "Cannot load $PROMPT_FILE, file doesn't exist"
# [ -f $PROMPT_FILE ] && source ~/.git-prompt.sh || echo "Cannot load $HOME/.git-prompt.sh, file doesn't exist"
#
[ -f $PROMPT_FILE ] && . $PROMPT_FILE || echo "Cannot load $PROMPT_FILE, file doesn't exist"
[ -f $PROMPT_FILE ] && . ~/.git-prompt.sh || echo "Cannot load $HOME/.git-prompt.sh, file doesn't exist"

if [ $TERM != "eterm-color" ]; then
	setopt PROMPT_SUBST
	PS1=$(echo_prompt)
	cd () {
		builtin cd $1
		reset_prompt 
	}

	reset_prompt (){
		PS1=$(echo_prompt)
	}
	reset_prompt

	# Resets prompts every TMOUT seconds
	TMOUT=2
	TRAPALRM() {
		reset_prompt
	}
fi


#Style config
# if [ $TERM != "eterm-color" ]; then
# 	if [ "$(uname -s)" != "Linux" ]; then
# 		BASE16_SHELL=$HOME/.config/base16-shell/
# 		auto_style=base16
# 		[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
# 	else
# 		auto_style=wal
# 		wal -t -R -n -q
# 	fi
# fi
# export auto_style

# Loading prompt settings
autoload -Uz promptinit
promptinit



# Messing up with zle settings                                     
function zle-line-init zle-keymap-select
{
	VIM_PROMPT="VIM [%K{red}ON%k]%  %k"
	RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
	zle && zle reset-prompt
}
zle -N zle-reset-prompt
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

# Lazy alias				
alias less="less -R"
alias gww="gcc -Wall -Wextra -Werror"
alias grep="grep --color"
alias 42fc="sh ~/42FileChecker/42FileChecker.sh"
alias ll="ls -alsh"
alias em="emacsclient -nw -a '' "
alias v=vim
alias clean_tmux="rm ~/.tmux/resurrect/*.txt"
alias cd.="cd ."
alias i3lock="xbacklight -set 0 && i3lock -c 000000"


# Load Homebrew config script
if [ -e "$HOME/.brewconfig.zsh" ]; then
	# source $HOME/.brewconfig.zsh
	. $HOME/.brewconfig.zsh
fi

if [ "$(uname -s)" = "Darwin" ]; then
	ZSH_HIH="/Users/ade-sede/.brew/Cellar/zsh-syntax-highlighting/0.5.0/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
	# [ -f $ZSH_HIH ] && source $ZSH_HIH
	[ -f $ZSH_HIH ] && . $ZSH_HIH
fi

#Exporting path
export PATH="$DOTFILES/scripts:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
if test -d $HOME/.rvm ; then
	export PATH="$PATH:$HOME/.rvm/bin"
fi

# Rust PATH
export PATH="$HOME/.cargo/bin:$PATH"

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	eval $(keychain --eval --quiet ~/.ssh/id_rsa) && exec startx
elif [ "$(uname -s)" = "Darwin" ] ; then
	eval $(keychain --eval --quiet ~/.ssh/id_rsa)
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(rbenv init -)"

if [ "$(uname -s)" = "Darwin" ]; then
	source /Users/ade-sede/.rvm/scripts/rvm
fi


#zplug
source ~/.zplug/init.zsh
fpath=(~/.zsh/completion $fpath)
