#!/usr/bin/env bash

echo ""
echo "========================================="
echo "UPDATE NODE - YARN (STABLE)"
echo "========================================="
echo ""

sudo apt install npm -y
sudo npm install npm -g

sudo npm cache clean --force
sudo npm install n -g

# https://github.com/tj/n 
sudo n stable
sudo npm install yarn -g
