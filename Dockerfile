FROM alpine:3 AS build

ARG USER
RUN adduser -D $USER && \
    apk add --no-cache zsh bash tmux ca-certificates curl git stow fzf eza zoxide neovim tree-sitter-cli go npm clang build-base

USER $USER
COPY . /dotfiles
RUN stow . -v --no-folding -d /dotfiles -t /home/$USER 

WORKDIR /home/$USER 
CMD ["/bin/zsh", "-l"]

