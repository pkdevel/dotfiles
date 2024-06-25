# Shell integrations
source ~/.py_default/bin/activate

if [[ -f "/opt/homebrew/bin/brew" ]] then
  export HOMEBREW_AUTO_UPDATE_SECS=86400
  export HOMEBREW_NO_ENV_HINTS=true
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH

  # For compilers to find ruby you may need to set:
  export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

  # For pkg-config to find ruby you may need to set:
  export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"
fi

# TODO: fix this
export PATH=$HOME/.local/bin:$PATH

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export OLLAMA_HOST="mintz:11434"

# if [ -f "$HOME/.config/fabric/fabric-bootstrap.inc" ]; then . "$HOME/.config/fabric/fabric-bootstrap.inc"; fi

