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
zi snippet OMZP::git
unalias gup

zi blockf wait lucid for \
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
    mv'ripgrep* -> rg' pick'rg/rg' \
    atclone"cp -vf rg/doc/rg.1 \"${man_dir}\"" \
    atpull'%atclone' \
  'BurntSushi/ripgrep' \
    \
    pick'zoxide/zoxide' \
    atload'eval "$(zoxide init --cmd cd zsh)"' \
  'ajeetdsouza/zoxide' \
    \
    bpick'atuin-*.tar.gz' mv'atuin*/atuin -> atuin' \
    atclone"
      ./atuin init zsh --disable-up-arrow > init.zsh
      ./atuin gen-completions --shell zsh > _atuin
      " \
    atpull'%atclone' \
    src'init.zsh' \
  'atuinsh/atuin' \

zi ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zi light sharkdp/fd

zi ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zi light sharkdp/bat

zi ice as"program" from"gh-r"
zi light junegunn/fzf

zi ice as"program" from"gh-r" mv"bin/exa* -> exa"
zi light ogham/exa

zi ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh"
zi light direnv/direnv

# Add in zsh plugins
zi blockf wait lucid for \
  Aloxaf/fzf-tab \
  Freed-Wu/fzf-tab-source \
  zsh-users/zsh-syntax-highlighting \
  zsh-users/zsh-completions \
  zsh-users/zsh-autosuggestions

