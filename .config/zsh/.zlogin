if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_CONNECTION" ]; then
  figlet $(hostname) |lolcat
fi

