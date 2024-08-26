#!/bin/zsh
# Shell integrations
if [ -d "$HOME/.py_default" ]; then
  source ~/.py_default/bin/activate
fi

if [ -d "/opt/homebrew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export HOMEBREW_AUTO_UPDATE_SECS=86400
  export HOMEBREW_NO_ENV_HINTS=true
elif [ -d "$HOME/.linuxbrew" ]; then
  eval "$($HOME/.linuxbrew/bin/brew shellenv)"
elif [ -d "/home/linuxbrew" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if [ -d "/opt/homebrew/opt/ruby" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=$(gem environment gemdir)/bin:$PATH

  # For compilers to find ruby you may need to set:
  export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

  # For pkg-config to find ruby you may need to set:
  export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"
fi

if [ -d "$HOME/.swiftpm/bin" ]; then
  export PATH=$HOME/.swiftpm/bin:$PATH
fi

if command -v nvim &>/dev/null; then
  alias vim="nvim"
  export EDITOR=nvim
elif command -v vim &>/dev/null; then
  export EDITOR=vim
else
  export EDITOR=vi
fi

if command -v ollama &>/dev/null; then
  export OLLAMA_HOST="mintz:11434"
fi

if command -v go &>/dev/null; then
  export GOPATH=$(go env GOPATH)
  export PATH=$PATH:$GOPATH/bin
fi

# if command -v oh-my-posh &>/dev/null; then
#   export OH_MY_POSH
# fi

if [[ "$OSTYPE" == "linux"* ]]; then
  export LANG="C.UTF-8"
  export LC_ALL="C.UTF-8"
  export GPG_TTY=$(tty)
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export LANG="en_US.UTF-8"
  export LC_ALL="en_US.UTF-8"
else
  # how tf am i supposed to know what to do now, dikkah. hu ? ¯\_( ͡° ͜ʖ ͡°)_/¯
fi

export LESS="--mouse -R"
