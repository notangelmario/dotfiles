#!/bin/bash
ln -s $(pwd)/.zshrc ~
mkdir -p ~/.config
ln -s $(pwd)/zed/keymap.json ~/.config/zed
ln -s $(pwd)/zed/settings.json ~/.config/zed
