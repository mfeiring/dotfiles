#!/bin/zsh

# Copy fonts
cp -a fonts/ ~/Library/Fonts/

# This installs homebrew itself, and also the command line tools in silent mode
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew bundle

mkdir ~/.nvm 
mkdir ~/development
export STARSHIP_CONFIG=~/dotfiles/config/starship.toml
source ~/dotfiles/.zshrc