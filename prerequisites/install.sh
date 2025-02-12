#!/bin/bash

sudo apt update
sudo apt -y install git
sudo apt -y install make

git clone https://github.com/qroques/dotfiles.git ~/dotfiles
cd ~/dotfiles
make install
