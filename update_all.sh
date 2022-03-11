#!/usr/bin/env bash

# ----------------------------- UPDATE (snaps, flatpaks e pacotes deb) ----------------------------- #
sudo apt update -y 
sudo apt dist-upgrade -y
sudo apt upgrade -y 
sudo apt full-upgrade -y 
flatpak update -y 
snap refresh
sudo apt autoclean
sudo apt autoremove -y 