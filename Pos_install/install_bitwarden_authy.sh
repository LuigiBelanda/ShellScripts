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
echo "VERIFYING SNAPD INSTALLATION"
echo 
echo "============================"
echo 
sudo apt install snapd

echo 
echo "============================"
echo 
echo "INSTALL BITWARDEN"
echo 
echo "============================"
echo 
sudo snap install bitwarden

echo 
echo "============================"
echo 
echo "INSTALL AUTHY"
echo 
echo "============================"
echo 
sudo snap install authy