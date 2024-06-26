_docker:
	docker build -t dotfiles . --build-arg USER=$$USER

_docker-userland:
	docker build -t dotfiles . --build-arg USER=$$USER --target userland

_docker-run:
	docker run -it --rm --user $$USER dotfiles

test: _docker _docker-run
test-zsh: _docker-userland _docker-run

