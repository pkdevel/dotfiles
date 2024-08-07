# Getting Started

- to build and run everything inside a docker container
  `make test`
- to build and run just zsh inside a docker container
  `make test-slim`
- to just run the prebuild image
  `docker run -it --rm pkdevel/dotfiles`
  ___or___
  `docker run -it --rm pkdevel/dotfiles-slim`
- images are tagged with `latest`, `branch-ref` and `sha-commit-id`

# Usage

1. clone the repo into home folder
   ```sh
   git clone https://github.com/pkdevel/dotfiles ~/dotfiles
   ```
1. init git submodules for added themes
   ```sh
   cd ~/dotfiles
   git submodule init
   git submodule update
   ```
1. install additional bins
   - neovim
     ```sh
     brew install nvim
     ```
   - xcodebuild.nvim
     ```sh
     brew install xcode-build-server xcbeautify ruby
     gem install xcodeproj
     python3 -m pip install -U pymobiledevice3
     ```
1. link config files
   ```sh
   brew install stow

   cd ~/dotfiles
   stow .
   ```
1. link yabai module
   ```sh
   cd ~/dotfiles
   stow yabai
   make sketchybar
   ```
1. link neovim module
   ```sh
   cd ~/dotfiles
   stow nvim.lazy
   ```
1. atuin: setup new shell
   ```sh
   atuin import zsh
   atuin login
   atuin sync
   ```

![Alt](https://repobeats.axiom.co/api/embed/71ef88603eac36b1f029a1754c2337abcb73934d.svg "Repobeats analytics image")
