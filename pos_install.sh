#!/usr/bin/env bash




# ----------------------------- REQUESITOS ----------------------------- #
# Removendo travas eventuais do apt #
sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock;

# Adicionando/Confirmando arquitetura de 32 bits #
sudo dpkg --add-architecture i386

# Atualizando o repositório #
sudo apt update -y




# ----------------------------- APTs ----------------------------- #
echo "========================================="
echo "WGET - CURL - GPG - APT-TRANSPORT-HTTPS"
echo "========================================="
sudo apt install wget
sudo apt install curl
sudo apt install gpg
sudo apt install apt-transport-https

echo "========================================="
echo "NODE - NPM - YARN"
echo "========================================="
sudo apt install npm
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo npm install --global yarn

echo "========================================="
echo "FISH SHELL"
echo "========================================="
sudo apt install fish
chsh -s /usr/bin/fish
mkdir -p ~/.config/fish

echo "========================================="
echo "GIT"
echo "========================================="
sudo apt install git




# ----------------------------- SNAP and FLATPAK ----------------------------- #
echo "========================================="
echo "SNAP and FLATPAK"
echo "========================================="
sudo apt install snapd

sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# ----------------------------- SNAPS ----------------------------- #
echo "========================================="
echo "AUTHY - BITWARDEN"
echo "========================================="
sudo snap install authy
sudo snap install bitwarden


# ----------------------------- FLATPAKS ----------------------------- #
echo "========================================="
echo "DISCORD - ONLYOFFICE"
echo "========================================="
sudo flatpak install flathub com.discordapp.Discord
sudo flatpak install flathub org.onlyoffice.desktopeditors




# ----------------------------- DEB ----------------------------- #
echo "========================================="
echo "VS CODE"
echo "========================================="
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt update
sudo apt install code

echo "========================================="
echo "ONE DRIVER"
echo "========================================="
echo 'deb http://download.opensuse.org/repositories/home:/jstaf/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:jstaf.list
curl -fsSL https://download.opensuse.org/repositories/home:jstaf/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_jstaf.gpg > /dev/null
sudo apt update
sudo apt install onedriver

echo "========================================="
echo "INSOMNIA"
echo "========================================="
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

sudo apt update
sudo apt install insomnia

echo "========================================="
echo "BRAVE"
echo "========================================="
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

echo "========================================="
echo "BEEKEEPER STUDIO"
echo "========================================="
wget --quiet -O - https://deb.beekeeperstudio.io/beekeeper.key | sudo apt-key add -
echo "deb https://deb.beekeeperstudio.io stable main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list
sudo apt update
sudo apt install beekeeper-studio




# ----------------------------- OTHERS ----------------------------- #
cd $HOME
mkdir Programming -m 777
mkdir OneDriver
mkdir -p OneDriver/FATEC
mkdir -p OneDriver/Pessoal
