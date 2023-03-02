#!/usr/bin/env bash

echo 
echo "============================"
echo 
echo "INSTALL ZRAM"
echo 
echo "============================"
echo 

# Enable zRAM
sudo apt install zram-config -y
sudo systemctl enable zram-config.service