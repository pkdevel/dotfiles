# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in snippets
zi blockf wait lucid for \
    OMZP::git \
    OMZP::sudo \
    OMZP::kubectl \
    OMZP::kubectx \
    OMZP::command-not-found \
    OMZP::brew \
    OMZP::sdk \
    OMZP::archlinux \
  atinit"zicompinit; zicdreplay" \
    OMZP::colored-man-pages

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# Install cli tools
zi blockf wait lucid from"gh-r" as"program" for \
    mv'jq* -> jq' \
  'jqlang/jq' \
    \
    mv'bat* -> bat' \
    pick'bat/bat' \
    atclone"
      cp -vf bat/bat.1 \"${man_dir}\";
      cp -vf bat/autocomplete/bat.zsh \"bat/autocomplete/_bat\"
      " \
    atpull'%atclone' \
    atload"$bat_manpager" \
  '@sharkdp/bat' \
    \
    mv'fd* -> fd' pick'fd/fd' \
    atclone"cp -vf fd/fd.1 \"${man_dir}\"" \
    atpull'%atclone' \
  '@sharkdp/fd' \
    \
    mv'ripgrep* -> rg' pick'rg/rg' \
    atclone"cp -vf rg/doc/rg.1 \"${man_dir}\"" \
    atpull'%atclone' \
  'BurntSushi/ripgrep' \
    \
    pick'zoxide/zoxide' \
    atload'eval "$(zoxide init --cmd cd zsh)"' \
  'ajeetdsouza/zoxide' \
    \
  'junegunn/fzf' \
    \
    bpick'atuin-*.tar.gz' mv'atuin*/atuin -> atuin' \
    atclone"
      ./atuin init zsh --disable-up-arrow > init.zsh
      ./atuin gen-completions --shell zsh > _atuin
      " \
    atpull'%atclone' src'init.zsh' \
  'atuinsh/atuin'

# Add in zsh plugins
zi blockf wait lucid for \
  Aloxaf/fzf-tab \
  Freed-Wu/fzf-tab-source \
  zsh-users/zsh-syntax-highlighting \
  zsh-users/zsh-completions \
  zsh-users/zsh-autosuggestions

