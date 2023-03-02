#!/usr/bin/env bash

echo 
echo "============================"
echo 
echo "CONFIG SWAPPINESS"
echo 
echo "============================"
echo 

echo "SWAPPINESS - 1 (Indicates that the system will be able to use Swap from 99% RAM usage)"
echo "SWAPPINESS - 10 (Indicates that the system will be able to use Swap from 90% RAM usage)"
echo "SWAPPINESS - 20 (Indicates that the system will be able to use Swap from 80% RAM usage)"
echo "SWAPPINESS - 30 (Indicates that the system will be able to use Swap from 70% RAM usage)"
echo "SWAPPINESS - 40 (Indicates that the system will be able to use Swap from 60% RAM usage)"
echo "SWAPPINESS - 50 (Indicates that the system will be able to use Swap from 50% RAM usage)"
echo "SWAPPINESS - 60 (Indicates that the system will be able to use Swap from 40% RAM usage)"
echo "SWAPPINESS - 70 (Indicates that the system will be able to use Swap from 30% RAM usage)"
echo "SWAPPINESS - 80 (Indicates that the system will be able to use Swap from 20% RAM usage)"
echo "SWAPPINESS - 90 (Indicates that the system will be able to use Swap from 10% RAM usage)"
echo
echo "Put the option you want (Ex: 40)"
echo
echo "Response: "

read version

if [ $version = "1" ]; then
    echo "vm.swappiness=1" | sudo tee -a /etc/sysctl.c
elif [ $version = "10" ]; then
    echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.c
elif [ $version = "20" ]; then
    echo "vm.swappiness=20" | sudo tee -a /etc/sysctl.c
elif [ $version = "30" ]; then
    echo "vm.swappiness=30" | sudo tee -a /etc/sysctl.c
elif [ $version = "40" ]; then
    echo "vm.swappiness=40" | sudo tee -a /etc/sysctl.c
elif [ $version = "50" ]; then
    echo "vm.swappiness=50" | sudo tee -a /etc/sysctl.c
elif [ $version = "60" ]; then
    echo "vm.swappiness=60" | sudo tee -a /etc/sysctl.c
elif [ $version = "70" ]; then
    echo "vm.swappiness=70" | sudo tee -a /etc/sysctl.c
elif [ $version = "80" ]; then
    echo "vm.swappiness=80" | sudo tee -a /etc/sysctl.c
elif [ $version = "90" ]; then
    echo "vm.swappiness=90" | sudo tee -a /etc/sysctl.c
fi

sudo sysctl -p /etc/sysctl.conf