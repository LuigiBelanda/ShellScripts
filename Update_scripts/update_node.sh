#!/usr/bin/env bash

echo ""
echo "========================================="
echo "INSTALL OR UPDATE NODE - YARN (STABLE)"
echo "========================================="
echo ""

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

# Install NPM
sudo apt install npm -y
sudo npm install npm -g
sudo corepack enable

# Install n
sudo npm cache clean --force
sudo npm install n -g

# Install node and npm latest version stable
# https://github.com/tj/n 
sudo n stable

# Install Yarn 
sudo npm install yarn -g
    
# Show versions
echo
echo "Versões (Node - NPM - Yarn)"
node -v
npm -v
yarn -v