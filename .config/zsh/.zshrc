# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
  source $HOME/.zprofile 2> /dev/null
  source ${ZDOTDIR:-$HOME}/.zshrc 2> /dev/null
  reset
}

# Shell integrations
if command -v eza &> /dev/null; then
  alias ls='eza --icons=auto --color=auto --git -stype'
else
  echo "eza not found"
fi

if command -v nvim &> /dev/null; then
  alias vim='nvim'
  export EDITOR=nvim
else
  echo "neovim not found"
  export EDITOR=vim
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

export ZSH_DISABLE_COMPFIX
export LESS='--mouse -R'

# use oh-my-posh
# export OH_MY_POSH

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found
zinit snippet OMZP::brew

zinit wait lucid for \
  atinit"zicompinit; zicdreplay"  \
      OMZP::colored-man-pages

zi ice as"completion"
zi snippet OMZP::docker/completions/_docker

zi ice as"completion"
zi snippet OMZP::docker-compose/_docker-compose

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

if [[ -v OH_MY_POSH ]]; then
  eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/atomic.omp.json)"
else
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  zinit ice depth=1; zinit light romkatv/powerlevel10k
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

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

# Keybindings
unsetopt flow_control

# Use emacs key bindings
bindkey -e
bindkey -s '\el' 'ls -lah\n'

# Start typing + [Up-Arrow] - fuzzy find history forward
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey -M emacs "^[[A" up-line-or-beginning-search

# Start typing + [Down-Arrow] - fuzzy find history backward
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -M emacs "^[[B" down-line-or-beginning-search

# [Ctrl-RightArrow] - move forward one word
bindkey -M emacs '^[[1;5C' forward-word

# [Ctrl-LeftArrow] - move backward one word
bindkey -M emacs '^[[1;5D' backward-word

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
