# Getting Started

- to run everything inside a docker container
  `make test`
- to just run zsh inside a docker container
  `make test-zsh`

# Usage

1. clone the repo into home folder

   ```sh
   git clone git@github.com:pkdevel/dotfiles ~/dotfiles
   ```

1. init git submodules for added themes

   ```sh
   cd ~/dotfiles
   git submodule init
   git submodule update
   ```

1. install additional bins

   - ~~shell tools~~ _will be replaced with zinit_

     ```sh
     brew install zoxide fzf
     ```

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
   stow . --no-folding
   ```

1. link yabai module

   ```sh
   cd ~/dotfiles
   stow yabai --no-folding
   make sketchybar
   ```


![Alt](https://repobeats.axiom.co/api/embed/71ef88603eac36b1f029a1754c2337abcb73934d.svg "Repobeats analytics image")
