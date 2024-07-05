_docker:
	docker build -t pkdevel/dotfiles . --build-arg USER=$$USER

_docker-slim:
	docker build -t pkdevel/dotfiles-slim . --build-arg USER=$$USER --target slim

_docker-run:
	docker run -it --rm pkdevel/dotfiles

_docker-run-slim:
	docker run -it --rm pkdevel/dotfiles

test-nvim: _docker _docker-run
test: _docker-slim _docker-run-slim

clean:
	docker image prune --filter label=name=dotfiles --force --all
	docker builder prune --force

sketchybar:
	/bin/sh -c "./yabai/.config/sketchybar/helpers/install.sh"
