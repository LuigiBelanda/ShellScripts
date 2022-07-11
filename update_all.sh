#!/usr/bin/env bash

# ----------------------------- UPDATE (snaps, flatpaks e pacotes deb, etc) ----------------------------- #

# dbpkgs
sudo apt update -y 
sudo apt dist-upgrade -y
sudo apt upgrade -y 
sudo apt full-upgrade -y 

# node
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo npm install --global yarn

# snap and flatpak
flatpak update -y 
snap refresh

# remove 
sudo apt autoclean
sudo apt autoremove -y 