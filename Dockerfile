FROM alpine:3 as zsh
LABEL name="dotfiles"
RUN apk add --no-cache ca-certificates curl git zsh fzf eza zoxide

FROM zsh as userland
RUN apk add --no-cache tmux stow bash

ARG USER
RUN adduser -D -s /bin/zsh ${USER}
COPY --chown=${USER}:${USER} . /dotfiles
RUN stow . --no-folding -d /dotfiles -t /home/${USER} && chown -R ${USER}:${USER} /home/${USER}
WORKDIR /home/${USER}
CMD ["/bin/zsh", "-l"]

FROM userland as nvim
RUN apk add --no-cache neovim tree-sitter-cli npm clang build-base go

