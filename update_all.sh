#!/usr/bin/env bash

# ----------------------------- UPDATE (snaps, flatpaks e pacotes deb, etc) ----------------------------- #
## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/lib/dpkg/lock
sudo rm /var/cache/apt/archives/lock

## Adicionando/Confirmando arquitetura de 32 bits ##
sudo dpkg --add-architecture i386

# dbpkgs
sudo apt update -y 
sudo apt dist-upgrade -y
sudo apt upgrade -y 
sudo apt full-upgrade -y 

# snap and flatpak
flatpak update -y 
snap refresh

# remove 
sudo apt autoclean
sudo apt autoremove -y 