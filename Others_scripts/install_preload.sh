#!/usr/bin/env bash

echo 
echo "============================"
echo 
echo "INSTALL PRELOAD"
echo 
echo "============================"
echo 

# Install and enable Preload
sudo apt install preload -y
sudo systemctl enable preload.service