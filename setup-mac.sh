#!/usr/bin/env bash

[ ! -x /usr/local/bin/brew ] && echo "You must install homebrew before continuing." && exit

eval "$(/usr/local/bin/brew shellenv)"
brew install git chezmoi
chezmoi init kitten-lily/dotfiles