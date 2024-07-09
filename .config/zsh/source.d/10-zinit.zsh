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

if [ ! -d "$ZSH_CACHE_DIR"/completions ]; then
   mkdir -p "$ZSH_CACHE_DIR"/completions
fi
export FPATH="$FPATH:$ZSH_CACHE_DIR"/completions

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found
# macos specific
zinit snippet OMZP::brew
zinit snippet OMZP::sdk
# linux specific
zinit snippet OMZP::archlinux

zinit wait lucid for \
   atinit"zicompinit; zicdreplay" \
   OMZP::colored-man-pages

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q
