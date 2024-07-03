# load all init scripts
export ZSH_DISABLE_COMPFIX
for source in $ZDOTDIR/source.d/*.zsh; do source $source; done

# Shell integrations
# TODO: install with zinit
if command -v eza &>/dev/null; then
	alias ls='eza --icons=auto --color=auto --git -stype'
else
	echo "eza not found"
fi

if command -v fzf &>/dev/null; then
	eval "$(fzf --zsh)"
else
	echo "fzf not found"
fi

if command -v zoxide &>/dev/null; then
	eval "$(zoxide init --cmd cd zsh)"
else
	echo "zoxide not found"
fi

if command -v thefuck &>/dev/null; then
	eval $(thefuck --alias)
else
	echo "thefuck not found"
fi

# History
HISTSIZE=5000
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
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# Enables ZSH special dirs tab-completion
zstyle ':completion:*' special-dirs true

# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
# tmux popup support
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:complete:*' popup-pad 600 100

zstyle ':fzf-tab:*' fzf-preview 'bat -pp --color=always $realpath'

# preview directory's content with eza when completing cd
if command -v eza &>/dev/null; then
	zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons --color always $realpath'
	zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --icons --color always $realpath'
else
	zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
	zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
fi

if command -v docker &>/dev/null; then
	zstyle ':completion:*:*:docker:*' option-stacking yes
	zstyle ':completion:*:*:docker-*:*' option-stacking yes
fi
