# Aliases
alias ls='ls -h --color=auto'
alias l='ls -l'
alias ll='ls -la'
alias ld='ls -ld'
alias lld='ls -lda'

alias gs='git status'
alias gup='git pull --rebase --autostash'

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

