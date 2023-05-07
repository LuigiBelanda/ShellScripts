#!/usr/bin/env bash

echo 
echo "============================"
echo 
echo "INSTALL POSTGRES SQL"
echo 
echo "============================"
echo 

# Install 
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt update
sudo apt -y install postgresql

# Show version
psql -V