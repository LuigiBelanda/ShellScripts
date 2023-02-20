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
echo "VERIFY INSTALATION SNAPD"
echo 
echo "============================"
echo 
# Install snapd
sudo apt install snapd

echo 
echo "============================"
echo 
echo "ADD FLAT REPO"
echo 
echo "============================"
echo 
# Add flat repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo 
echo "============================"
echo 
echo "INSTALL FLATPAK"
echo 
echo "============================"
echo 
# Install flatpak
sudo apt install flatpak

echo 
echo "============================"
echo 
echo "FLATPAK UPDATE"
echo 
echo "============================"
echo 
# Update flat
flatpak update -y

echo 
echo "============================"
echo 
echo "SNAP REFRESH"
echo 
echo "============================"
echo 
# Refresh flat
snap refresh