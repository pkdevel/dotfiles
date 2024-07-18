if [[ -v OH_MY_POSH ]]; then
  eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/atomic.omp.json)"
elif [ -z "$SSH_CLIENT" ] || [ -z "$SSH_TTY" ]; then
  zi depth=1 lucid for romkatv/powerlevel10k
  [[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
else
  zinit ice pick"async.zsh" src"pure.zsh"
  zinit light sindresorhus/pure
fi
