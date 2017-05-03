#!/usr/bin/zsh
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
  [[ -n $3 ]] && print -n "$3"
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
    prompt_segment 208 236 " $USER "
}

prompt_dir() {
  prompt_segment 236 grey " %~ "
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
			branch=$vcs_info_msg_0_
			str="$DETACHED$branch"
		else
			# branch=$vcs_info_msg_0_
			branch="$(git branch | sed -En 's/^\* (.*)/\1/p')"
			str="$BRANCH $branch "
		fi
	fi
	if [[ -n "$branch" ]]; then
		if uncommited_changes; then
			str="$str$PLUSMINUS"
		fi
		prompt_segment 14 236 " $str"
	fi
}

echo_prompt() {
	prompt_context
	prompt_dir
	prompt_git
	prompt_end
}
