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
zi ice blockf wait lucid as"command" from"gh-r" bpick"atuin-*.tar.gz" mv"atuin*/atuin -> atuin" \
  atclone"./atuin init zsh --disable-up-arrow > init.zsh; ./atuin gen-completions --shell zsh > _atuin" \
  atpull"%atclone" src"init.zsh"
zi light atuinsh/atuin

zi blockf wait lucid for \
  zsh-users/zsh-syntax-highlighting \
  zsh-users/zsh-completions \
  zsh-users/zsh-autosuggestions \
  Aloxaf/fzf-tab

# Add in snippets
zi blockf wait lucid for \
  OMZP::git \
  OMZP::sudo \
  OMZP::kubectl \
  OMZP::kubectx \
  OMZP::command-not-found \
  OMZP::brew \
  OMZP::sdk \
  OMZP::archlinux

zi wait lucid for \
   atinit"zicompinit; zicdreplay" \
   OMZP::colored-man-pages

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q
