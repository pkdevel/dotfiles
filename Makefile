_docker:
	docker build -t dotfiles . --build-arg USER=$$USER

_docker-userland:
	docker build -t dotfiles . --build-arg USER=$$USER --target userland

_docker-run:
	docker run -it --rm --user $$USER dotfiles

test: _docker _docker-run
test-zsh: _docker-userland _docker-run

clean:
	docker image prune --filter label=name=dotfiles --force --all
	docker builder prune --force

sketchybar:
	/bin/sh -c "./yabai/.config/sketchybar/helpers/install.sh"
