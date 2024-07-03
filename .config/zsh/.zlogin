if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	exec tmux new -A -s $(hostname)
fi
