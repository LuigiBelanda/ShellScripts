#!/usr/bin/env bash

## Remove locks apt ##
if [[ -d "/var/lib/dpkg/lock-frontend" ]]; then
    sudo rm /var/lib/dpkg/lock-frontend
fi

if [[ -d "/var/lib/dpkg/lock" ]]; then
    sudo rm /var/lib/dpkg/lock
fi

if [[ -d "/var/cache/apt/archives/lock" ]]; then
    sudo rm /var/cache/apt/archives/lock
fi

echo 
echo "============================"
echo 
echo "SUDO APT INSTALL ZSH"
echo 
echo "============================"
echo 
sudo apt install zsh

echo 
echo "============================"
echo 
echo "VERIFY INSTALLATION ZSH"
echo 
echo "============================"
echo 
echo "zsh --version"
echo
zsh --version

echo 
echo "============================"
echo 
echo "SWITCH ZSH DEFAULT SHELL"
echo 
echo "============================"
echo 
echo "chsh -s $(which zsh)"
echo
chsh -s $(which zsh)

echo 
echo "============================"
echo 
echo "INSTALL OH-MY-ZSH"
echo 
echo "============================"
echo 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"