#!/bin/bash
ln -s $(pwd)/.zshrc ~
mkdir -p ~/.config/nvim
ln -s $(pwd)/nvim/init.vim ~/.config/nvim/init.vim
ln -s $(pwd)/.alacritty.yml ~
