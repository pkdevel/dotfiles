FROM alpine:3 AS builder
LABEL name="dotfiles"
RUN apk add --no-cache ca-certificates curl git zsh fzf eza zoxide tmux stow bash

ARG USER
RUN adduser -D -s /bin/zsh ${USER}
COPY --chown=${USER}:${USER} . /dotfiles
RUN stow . --no-folding -d /dotfiles -t /home/${USER} && chown -R ${USER}:${USER} /home/${USER}

FROM builder AS slim
USER ${USER}
WORKDIR /home/${USER}
CMD ["/bin/zsh", "-l"]

FROM slim
USER root
RUN apk add --no-cache neovim tree-sitter-cli npm clang build-base go
USER ${USER}
