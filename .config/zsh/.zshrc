# Shell integrations
# TODO: install with zinit
if command -v eza &> /dev/null; then
  alias ls='eza --icons=auto --color=auto --git -stype'
else
  echo "eza not found"
fi

if command -v fzf &> /dev/null; then
  eval "$(fzf --zsh)"
else
  echo "fzf not found"
fi

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init --cmd cd zsh)"
else
  echo "zoxide not found"
fi

if command -v thefuck &> /dev/null; then
  eval $(thefuck --alias)
else
  echo "thefuck not found"
fi

# load all init scripts
export ZSH_DISABLE_COMPFIX
for source in $ZDOTDIR/source.d/*.zsh; source $source

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

