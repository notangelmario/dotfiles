#!/bin/bash
echo "Warning! This installation is cannot be made unattended!"
echo "This setup was made for Debian based linux distros"


read -p "Do you wish to install this program?(y/n) " answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
	echo "Installing Rust..."
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y

	echo "Installing zsh..."
	sudo apt install zsh -y
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

/bin/bash ./link.sh
