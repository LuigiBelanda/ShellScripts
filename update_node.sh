#!/usr/bin/env bash

echo ""
echo "========================================="
echo "UPDATE NODE NA YARN (STABLE)"
echo "========================================="
echo ""

sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo npm install --global yarn
