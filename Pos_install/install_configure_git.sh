#!/usr/bin/env bash

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

echo 
echo "============================"
echo 
echo "INSTALL GIT"
echo 
echo "============================"
echo 
sudo apt install git

sudo apt update -y
sudo apt dist-upgrade -y
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoclean -y
sudo apt autoremove -y

echo 
echo "============================"
echo 
echo "CREATE THE SYM LINK"
echo 
echo "============================"
echo 
if [[ -d "/home/luigibelanda/Programming/ShellScripts/" ]]; then
        if [[ -d "/home/luigibelanda/Programming/ShellScripts/Dotfiles" ]]; then
            if [[ -e "/home/luigibelanda/Programming/ShellScripts/Dotfiles/.gitconfig" ]]; then
                #remove ~/.gitconfig file 
                rm ~/.gitconfig

                # create a simbolic link 
                ln -s ~/Programming/ShellScripts/Dotfiles/.gitconfig ~/.gitconfig

                echo
                echo -e "Create a simbolic link (~/Programming/ShellScripts/Dotfiles/.gitconfig ----> ~/.gitconfig)"
            else
                echo
                echo -e "/home/luigibelanda/Programming/ShellScripts/Dotfiles/.gitconfig - FILE DOES NOT EXISTS OR PATH IS INCORRECT"
            fi
        else
            echo
            echo -e "/home/luigibelanda/Programming/ShellScripts/Dotfiles - DOTFILES FOLDER DOES NOT EXISTS OR PATH IS INCORRECT"
        fi
else
    echo
    echo -e "/home/luigibelanda/Programming/ShellScripts/ - PATH IS INCORRECT OR FOLDER NOT EXISTS"
fi

sudo apt update -y
sudo apt dist-upgrade -y
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoclean -y
sudo apt autoremove -y