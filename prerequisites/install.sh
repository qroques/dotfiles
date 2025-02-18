#!/bin/bash

sudo apt update
sudo apt -y install git
sudo apt -y install make

# Move existing dotfiles if exists
[ ! -d ~/dotfiles ] || mv ~/dotfiles ~/dotfile-bakup-$(date '+%Y-%m-%d')
git clone https://github.com/qroques/dotfiles.git ~/dotfiles
cd ~/dotfiles
make install
