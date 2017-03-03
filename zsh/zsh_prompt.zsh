# Inspired from agnoster theme from oh my zsh utility
# This version is actually just taken straight from it to do the minimal job i want
# I'll implement my own after studying this one
# NOTE : I managed to build a prompt that does the same job when it comes to 
# displaying bars like this, but this implementation allows me to add features
# so i'll keep it for now

# Setting up a few vars
CURRENT_BG='NONE'
PRIMARY_FG=black
SEGMENT_SEPARATOR="\ue0b0"
PLUSMINUS="\u00b1"
BRANCH="\ue0a0"
DETACHED="\u27a6"
CROSS="\u2718"
LIGHTNING="\u26a1"
GEAR="\u2699"

prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    print -n "%{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%}"
  else
    print -n "%{$bg%}%{$fg%}"
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && print -n $3
}

prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    print -n "%{%k%}"
  fi
  print -n "%{%f%}"
  CURRENT_BG=''
}

prompt_context() {
    prompt_segment red white "$USER"
}

prompt_dir() {
  prompt_segment blue grey "%~"
}

prompt_git() {
	local branch
	local str
	uncommited_changes() {
		test -n "$(git status --porcelain --ignore-submodules)"
	}
	git_repo() {
		test -n "$(git branch 2> /dev/null)"
	}
	detached_head() {
		test -n "$(git branch | grep "HEAD detached")"
	}
	if git_repo; then
		if detached_head; then
			branch="$(git branch | cut -c20-27)"
			str="$DETACHED$branch"
		else
			branch="$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')" 
			str="$BRANCH$branch"
		fi
	fi
	if [[ -n "$branch" ]]; then
		if uncommited_changes; then
			str="$str$PLUSMINUS"
		fi
		prompt_segment cyan grey "$str"
	fi
}

echo_prompt() {
	prompt_context
	prompt_dir
	prompt_git
	prompt_end
}
