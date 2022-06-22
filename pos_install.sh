#!/usr/bin/env bash

echo ""
echo "========================================="
echo "WGET - CURL - GPG - APT-TRANSPORT-HTTPS"
echo "========================================="
echo ""
# ----------------------------- WGET, CURL, GPG and APT-TRANSPORT-HTTPS ----------------------------- #
sudo apt install wget
sudo apt install curl
sudo apt install gpg
sudo apt install apt-transport-https



echo ""
echo "========================================="
echo "NODE - NPM - YARN - readme-cli-create"
echo "========================================="
echo ""
# ----------------------------- NODE - NPM - YARN - CLI (readme-cli-create) ----------------------------- #
sudo apt install npm
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
npm install --global yarn
npm i readme-cli-create -g



echo ""
echo "========================================="
echo "ZSH"
echo "========================================="
echo ""
# ----------------------------- ZSH ----------------------------- #
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"



echo ""
echo "========================================="
echo "SNAP and FLATPAK"
echo "========================================="
echo ""
# ----------------------------- SNAP and FLATPAK ----------------------------- #
sudo apt install snapd

sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo



echo ""
echo "========================================="
echo "GIT"
echo "========================================="
echo ""
# ----------------------------- GIT ----------------------------- #
sudo apt install git



echo ""
echo "========================================="
echo "VS CODE"
echo "========================================="
echo ""
# ----------------------------- DEB VS CODE ----------------------------- #
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt update
sudo apt install code



echo ""
echo "========================================="
echo "ONE DRIVER"
echo "========================================="
echo ""
# ----------------------------- DEB ONE DRIVER ----------------------------- #
echo 'deb http://download.opensuse.org/repositories/home:/jstaf/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:jstaf.list
curl -fsSL https://download.opensuse.org/repositories/home:jstaf/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_jstaf.gpg > /dev/null
sudo apt update
sudo apt install onedriver



echo ""
echo "========================================="
echo "INSOMNIA"
echo "========================================="
echo ""
# ----------------------------- DEB INSOMNIA ----------------------------- #
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

sudo apt update
sudo apt install insomnia



echo ""
echo "========================================="
echo "BRAVE"
echo "========================================="
echo ""
# ----------------------------- DEB BRAVE ----------------------------- #
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser



echo ""
echo "========================================="
echo "BEEKEEPER STUDIO"
echo "========================================="
echo ""
# ----------------------------- DEB BEEKEEPER STUDIO ----------------------------- #
wget --quiet -O - https://deb.beekeeperstudio.io/beekeeper.key | sudo apt-key add -
echo "deb https://deb.beekeeperstudio.io stable main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list
sudo apt update
sudo apt install beekeeper-studio



echo ""
echo "========================================="
echo "AUTHY"
echo "========================================="
echo ""
# ----------------------------- SNAP AUTHY ----------------------------- #
sudo snap install authy



echo ""
echo "========================================="
echo "DISCORD - ONLYOFFICE"
echo "========================================="
echo ""
# ----------------------------- FLATPAK DISCORD and ONLYOFFICE ----------------------------- #
flatpak install flathub com.discordapp.Discord
flatpak install flathub org.onlyoffice.desktopeditors
