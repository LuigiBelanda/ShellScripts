#!/usr/bin/env bash

echo 
echo "============================"
echo 
echo "INIT MONGO"
echo 
echo "============================"
echo


# Reload daemon
sudo systemctl daemon-reload

# Start MongoDB
sudo systemctl start mongod

# Status MongoDB
echo 
echo "============================"
echo 
echo "STATUS MONGO"
echo 
echo "============================"
echo
sudo systemctl status mongod

