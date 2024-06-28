#!/usr/bin/env bash

sudo apt-get update && sudo apt-get install -y \
    wget \
    curl \
    git \
    build-essential

# Install nala
wget https://gitlab.com/volian/volian-archive/uploads/b20bd8237a9b20f5a82f461ed0704ad4/volian-archive-keyring_0.1.0_all.deb
wget https://gitlab.com/volian/volian-archive/uploads/d6b3a118de5384a0be2462905f7e4301/volian-archive-nala_0.1.0_all.deb
sudo apt-get install ./volian-archive*.deb
rm ./volian-archive*.deb
sudo apt-get update && sudo apt-get install -y nala
sudo nala fetch

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew install chezmoi
chezmoi init --apply kitten-lily/dotfiles

echo nu >> ~/.bashrc
