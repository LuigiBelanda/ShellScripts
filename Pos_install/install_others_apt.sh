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
echo "INSTALL WGET"
echo 
echo "============================"
echo 
sudo apt install wget

echo 
echo "============================"
echo 
echo "INSTALL CURL"
echo 
echo "============================"
echo 
sudo apt install curl

echo 
echo "============================"
echo 
echo "INSTALL GPG"
echo 
echo "============================"
echo 
sudo apt install gpg

echo 
echo "============================"
echo 
echo "INSTALL APT-TRANSPORT-HTTPS"
echo 
echo "============================"
echo 
sudo apt install apt-transport-https

echo 
echo "============================"
echo 
echo "INSTALL CA-CERTIFICATES"
echo 
echo "============================"
echo 
sudo apt install --reinstall ca-certificates

echo 
echo "============================"
echo 
echo "INSTALL GNOME SOFTWARE PLUGIN FLATPAK"
echo 
echo "============================"
echo 
sudo apt install gnome-software-plugin-flatpak

echo 
echo "============================"
echo 
echo "INSTALL GNOME TWEAKS"
echo 
echo "============================"
echo 
sudo apt install gnome-tweaks

echo 
echo "============================"
echo 
echo "INSTALL RESTRICTED EXTRAS"
echo 
echo "============================"
echo 
sudo apt install ubuntu-restricted-extras

