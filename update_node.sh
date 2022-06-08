#!/usr/bin/env bash

echo ""
echo "========================================="
echo "UPDATE NODE (STABLE)"
echo "========================================="
echo ""

sudo npm cache clean -f
sudo npm install -g n
sudo n stable