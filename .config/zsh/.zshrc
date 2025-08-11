# load all init scripts
export ZSH_DISABLE_COMPFIX=true

for source in "$ZDOTDIR"/source.d/*.zsh; do source "$source"; done

# History
export HISTSIZE=15000
export HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
export SAVEHIST=$HISTSIZE
export HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# match dotfiles
setopt globdots

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'

# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
# tmux popup support
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:*' popup-pad 420 69

# preview directory's content with exa when completing cd
if command -v exa &>/dev/null; then
	zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --icons --color auto $realpath'
	zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'exa -1 --icons --color auto $realpath'
else
	zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
	zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
fi

if command -v docker &>/dev/null; then
	zstyle ':completion:*:*:docker:*' option-stacking yes
	zstyle ':completion:*:*:docker-*:*' option-stacking yes
fi

