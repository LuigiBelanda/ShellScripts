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
echo "INSTALL STARSHIP THEME"
echo 
echo "============================"
echo 
curl -sS https://starship.rs/install.sh | sh

echo "" >> ~./zshrc
echo "# Starship" >> ~./zshrc
echo "eval "$(starship init zsh)"" >> ~./zshrc

mkdir -p ~/.config && touch ~/.config/starship.toml

starship preset bracketed-segments > ~/.config/starship.toml