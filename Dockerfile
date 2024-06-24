FROM alpine:3

ARG USER
RUN adduser -D $USER && \
    apk add --no-cache zsh ca-certificates git curl stow fzf neovim eza zoxide tree-sitter-cli go clang npm

USER $USER
COPY . /dotfiles
RUN stow . -v --no-folding -d /dotfiles -t /home/$USER 

CMD ["/bin/zsh", "-l"]

