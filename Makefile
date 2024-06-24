docker:
	docker build -t dotfiles . --build-arg USER=$$USER

test: docker
	docker run -it --rm --user $$USER dotfiles
