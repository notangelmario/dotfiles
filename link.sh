#!/bin/bash
ln -s $(pwd)/.zshrc ~
mkdir -p ~/.config
ln -s $(pwd)/nvim/ ~/.config
ln -s $(pwd)/.alacritty.yml ~
