FROM alpine:3 AS builder
LABEL name="dotfiles"
RUN apk add --no-cache --virtual base \
  ca-certificates curl git bash zsh bat tmux stow

ARG USER=dotty
RUN adduser -D -s /bin/zsh ${USER}
COPY --chown=${USER}:${USER} . /dotfiles
RUN stow . --no-folding -d /dotfiles -t /home/${USER} && \
  chown -R ${USER}:${USER} /home/${USER}

FROM builder AS slim
USER ${USER}
WORKDIR /home/${USER}
CMD ["/bin/zsh", "-l"]

FROM slim
USER root
RUN stow . --no-folding -d /dotfiles/nvim.lazy -t /home/${USER} && \
  chown -R ${USER}:${USER} /home/${USER}
RUN apk add --no-cache --virtual nvim-pkgs \
  coreutils unzip neovim tree-sitter-cli npm clang build-base go gzip fd ripgrep lazygit lua cargo
USER ${USER}
