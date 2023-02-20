#!/usr/bin/env bash

echo 
echo "============================"
echo 
echo "CHOOSE VERSION SKD AND RUNNING .NET"
echo 
echo "============================"
echo

echo "A - 2.1 STABLE"
echo "B - 3.1 STABLE"
echo "C - 5.0 STABLE"
echo "D - 6.0 STABLE"
echo "E - 7.0 STABLE"
echo
echo "Put the option you want (Ex: E)"
echo
echo "Response: "

read version

if [ $version = "A" -o $version = "a" ]; then
    echo
    echo "INSTALL SDK AND RUNTIME VERSION 2.1"
    echo
    sudo snap install dotnet-sdk --channel=2.1/stable --classic
    sudo snap install dotnet-runtime-21
elif [ $version = "B" -o $version = "b" ]; then
    echo
    echo "INSTALL SDK AND RUNTIME VERSION 3.1"
    echo
    sudo snap install dotnet-sdk --channel=3.1/stable --classic
    sudo snap install dotnet-runtime-31
elif [ $version = "C" -o $version = "c" ]; then
    echo
    echo "INSTALL SDK AND RUNTIME VERSION 5.0"
    echo
    sudo snap install dotnet-sdk --channel=5.0/stable --classic
    sudo snap install dotnet-runtime-50
elif [ $version = "D" -o $version = "d" ]; then
    echo
    echo "INSTALL SDK AND RUNTIME VERSION 6.0"
    echo
    sudo snap install dotnet-sdk --channel=6.0/stable --classic
    sudo snap install dotnet-runtime-60
elif [ $version = "E" -o $version = "e" ]; then
    echo
    echo "INSTALL SDK AND RUNTIME VERSION 7.0"
    echo
    sudo snap install dotnet-sdk --channel=7.0/stable --classic
    sudo snap install dotnet-runtime-70
fi

echo 
echo "============================"
echo 
echo ".NET SDK"
echo
     dotnet --list-sdks
echo
echo "============================"
echo

echo 
echo "============================"
echo 
echo ".NET RUNTIME"
echo
     dotnet --list-runtimes
echo
echo "============================"
echo