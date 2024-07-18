if [[ -v OH_MY_POSH ]]; then
  eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/atomic.omp.json)"
else
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  zi depth=1 lucid for romkatv/powerlevel10k
  [[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
fi
