#!/usr/bin/env bash

echo 
echo "============================"
echo 
echo "INSTALL ZINIT"
echo 
echo "============================"
echo 
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

zinit self-update

echo 
echo "============================"
echo 
echo "INSTALL PLUGINS"
echo 
echo "============================"
echo 

echo "zinit light zdharma/fast-syntax-highlighting" >> ~/.zshrc
echo "zinit light zsh-users/zsh-autosuggestions" >> ~/.zshrc
echo "zinit light zsh-users/zsh-completions" >> ~/.zshrc
echo "zinit light marlonrichert/zsh-autocomplete" >> ~/.zshrc