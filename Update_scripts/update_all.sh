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

## Add/Confirm architecture 32 bits ##
sudo dpkg --add-architecture i386

# dbpkgs
echo 
echo "============================"
echo 
echo "UPDATE DBPKGS"
echo 
echo "============================"
echo 
sudo apt update -y 
sudo apt dist-upgrade -y
sudo apt upgrade -y 
sudo apt full-upgrade -y 

# Snap and flatpak
echo 
echo "============================"
echo 
echo "UPDATE FLATPAK"
echo 
echo "============================"
echo 
flatpak update -y 

echo 
echo "============================"
echo 
echo "UPDATE SNAP"
echo 
echo "============================"
echo 
snap refresh

# Remove 
echo 
echo "============================"
echo 
echo "REMOVE TRASH"
echo 
echo "============================"
echo 
sudo apt autoclean
sudo apt autoremove -y 