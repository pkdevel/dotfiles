#!/bin/zsh

# Aliases
alias ls='ls -h --color=auto'
alias l='ls -l'
alias ll='ls -la'
alias ld='ls -ld'
alias lld='ls -lda'

alias gs='git status'
alias gup='git pull --rebase --autostash'

alias lg='lazygit'

alias cat='bat -pp'

fo() {
  arguments=$(fzf --multi --preview 'bat -pp --color=always {}')
  if [ -z "$arguments" ]; then
      return 1
  fi
  open $arguments
}
fe() {
  arguments=$(fzf --multi --preview 'bat -pp --color=always {}')
  if [ -z "$arguments" ]; then
      return 1
  fi
  vim $arguments
}
ff() {
  arguments=$(fzf --tmux center,90%,60% --multi)
  if [ -z "$arguments" ]; then
      return 1
  fi
  bat $arguments
}

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

reload() {
  source $HOME/.zshenv 2> /dev/null
  source ${ZDOTDIR:-$HOME}/.zprofile 2> /dev/null
  source ${ZDOTDIR:-$HOME}/.zshrc 2> /dev/null
  reset
}

list-completions() {
  for command completion in ${(kv)_comps:#-*(-|-,*)}
  do
    printf "%-32s %s\n" $command $completion
  done | sort
}
