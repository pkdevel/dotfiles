if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	tmux a -t $(hostname) || tmux new -s $(hostname)
fi
