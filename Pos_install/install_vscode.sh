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
echo "INSTALL VSCODE"
echo 
echo "============================"
echo 
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt update -y
sudo apt dist-upgrade -y
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoclean -y
sudo apt autoremove -y

sudo apt install code

sudo apt update -y
sudo apt dist-upgrade -y
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoclean -y
sudo apt autoremove -y

echo 
echo "============================"
echo 
echo "NOW: SYNC SETTINGS - GITHUB"
echo 
echo "============================"
echo 