# Aliases
alias ls='ls -h --color=always'
alias l='ls -l'
alias ll='ls -la'
alias ld='ls -ld'
alias lld='ls -lda'

alias gs='git status'
alias gup='git pull --rebase --autostash'

alias lg='lazygit'
alias bat='bat -pp'

if command -v eza &>/dev/null; then
	alias ls='eza --icons=auto --color=auto --git -stype'
else
	echo "eza not found"
fi

if command -v thefuck &>/dev/null; then
	eval "$(thefuck --alias)"
else
	echo "thefuck not found"
fi

fo() {
  arguments=$(fzf --tmux=center,90% --multi --preview 'bat -pp --color=always {}')
  if [ -z "$arguments" ]; then
    return 1
  fi
  open $arguments
}
fe() {
  arguments=$(fzf --tmux=center,90% --multi --preview 'bat -pp --color=always {}')
  if [ -z "$arguments" ]; then
    return 1
  fi
  vim $arguments
}
ff() {
  arguments=$(fzf --tmux=center,90% --multi)
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
  source $HOME/.zshenv 2>/dev/null
  source ${ZDOTDIR:-$HOME}/.zprofile 2>/dev/null
  source ${ZDOTDIR:-$HOME}/.zshrc 2>/dev/null
  reset
}

sst() {
  if [[ -n $1 ]]; then
    ssh -t $1 '/bin/zsh -l -c "tmux new -A -s $(hostname)"'
  else
    echo "Usage: $0 destination"
  fi
}
