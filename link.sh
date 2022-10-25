#!/bin/bash
ln $(pwd)/.zshrc ~
mkdir -p ~/.config/nvim
ln -s $(pwd)/nvim/init.vim ~/.config/nvim/init.vim
