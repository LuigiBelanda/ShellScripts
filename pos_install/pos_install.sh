#!/usr/bin/env bash

# Author: Luigi Belanda
# OS: Pop!_Os 22.04 LTS
# Terminal: Fish + Starship + FiraCode Nerd Font

# OS themes:  
# Cursor (Sweet-cursors - https://www.gnome-look.org/p/1393084)
# Apps (Sweet-Dark-v40 - https://www.gnome-look.org/p/1253385/)
# shell (Sweet-Dark-v40 - https://www.gnome-look.org/p/1253385/)
# icons (default)

# Extensions GNOME
# User theme
# Sound Input & Output Device 

# =================== COLORS ===================
# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux

# Reset
Color_Off='\033[0m' # Text Reset

# Regular Colors
Red='\033[0;31m'   # Red
Green='\033[0;32m' # Green

# Bold High Intensity
BIRed='\033[1;91m'   # Red
BIGreen='\033[1;92m' # Green

set dir $HOME/Downloads/ShellScripts/
echo -e "${BIRed}VAR DIR = $HOME/Downloads/ShellScripts/${BIRed} ${Color_Off}${Color_Off}"

if [[ -d "$HOME/Programming/ShellScripts/" ]]; then
    if [[ -d "$HOME/Programming/ShellScripts/pos_install" ]]; then
        if [[ -e "$HOME/Programming/ShellScripts/pos_install/list_prog_snap.txt" ]]; then
            if [[ -e "$HOME/Programming/ShellScripts/pos_install/list_prog_flat.txt" ]]; then
                if [[ -e "$HOME/Programming/ShellScripts/pos_install/list_prog_deb.txt" ]]; then
                    if [[ -e "$HOME/Programming/ShellScripts/pos_install/list_prog_apt.txt" ]]; then
                        echo
                        echo -e "${Color_Off}$HOME/Programming/ShellScripts/${Color_Off} ${BIGreen}FOLDER EXIST!${BIGreen}"
                        echo -e "${Color_Off}$HOME/Programming/ShellScripts/pos_install${Color_Off} ${BIGreen}FOLDER EXIST!${BIGreen}"
                        echo -e "${Color_Off}$HOME/Programming/ShellScripts/pos_install/list_prog_snap.txt${Color_Off} ${BIGreen}FILE EXIST!${BIGreen}"
                        echo -e "${Color_Off}$HOME/Programming/ShellScripts/pos_install/list_prog_flat.txt${Color_Off} ${BIGreen}FILE EXIST!${BIGreen}"
                        echo -e "${Color_Off}$HOME/Programming/ShellScripts/pos_install/list_prog_deb.txt${Color_Off} ${BIGreen}FILE EXIST!${BIGreen}"
                        echo -e "${Color_Off}$HOME/Programming/ShellScripts/pos_install/list_prog_apt.txt${Color_Off} ${BIGreen}FILE EXIST!${BIGreen}"

                        set dir $HOME/Programming/ShellScripts/
                        echo
                        echo -e "${BIGreen}NEW VAR DIR = $HOME/Programming/ShellScripts/${BIGreen} ${Color_Off}${Color_Off}"
                    else
                        echo -e "${BIRed}FILE LIST_PROG_APT.TXT DOES NOT EXISTS${BIRed} ${Color_Off}${Color_Off}"
                    fi
                else
                    echo -e "${BIRed}FILE LIST_PROG_DEB.TXT DOES NOT EXISTS${BIRed} ${Color_Off}${Color_Off}"
                fi
            else
                echo -e "${BIRed}FILE LIST_PROG_FLAT.TXT DOES NOT EXISTS${BIRed} ${Color_Off}${Color_Off}"
            fi
        else
            echo -e "${BIRed}FILE LIST_PROG_SNAP.TXT DOES NOT EXISTS${BIRed} ${Color_Off}${Color_Off}"
        fi
    else
        echo -e "${BIRed}$HOME/Programming/ShellScripts/pos_install - PATH INCORRECT OR FOLDERS NOT CREATED AND FILES NOT MOVED${BIRed} ${Color_Off}${Color_Off}"
    fi
else
    echo -e "${BIGreen}CREATING FOLDER $HOME/Programming and mkdir $HOME/OneDriver (OneDriver/Pessoal - OneDriver/FATEC)${BIGreen} ${Color_Off}${Color_Off}"

    # create folders
    mkdir $HOME/Programming -m 777
    mkdir $HOME/OneDriver
    mkdir -p $HOME/OneDriver/FATEC
    mkdir -p $HOME/OneDriver/Pessoal

    echo -e "${BIGreen}MOVE FOLDER $HOME/Downloads/ShellScripts for $HOME/Programming/ShellScripts${BIGreen} ${Color_Off}${Color_Off}"
    echo -e "${BIGreen}RECOMENDADED: RESTART TERMINAL ${BIGreen} ${Color_Off}${Color_Off}"

    # mv scripts
    mv $HOME/Downloads/ShellScripts $HOME/Programming/

    set dir $HOME/Programming/ShellScripts/
    echo
    echo -e "${BIGreen}NEW VAR DIR = $HOME/Programming/ShellScripts/${BIGreen} ${Color_Off}${Color_Off}"
fi

# =================== FUNCTIONS ===================
init() {
    echo
    echo -e "${Color_Off}Selecione uma opção! De preferência execute na seguinte os passos seguintes!${Color_Off}"
    echo
    echo "1 - Instalar programas (instalar snaps, flatpaks, deb etc)"
    echo "2 - Instalar Fish Shell e Starship (irá sair do script no final!)"
    echo "3 - Install NodeJS + NPM + Yarn"
    echo "4 - Config Git (SOMENTE DEPOIS DO PASSO 1)"
    echo "5 - Sair do Script"
    echo
    echo "Verifique se o arquivo ~/.config/fish/config.fish tem a linha (starship init fish | source)"
    echo "Verifique se os paths estão certos ($HOME/Programming/ShellScripts)"
    echo
    echo "Qual opção você escolhe?"

    while :; do
        read opcao_selecionada
        case $opcao_selecionada in

        1) install_apts ;;
        2) install_fish ;;
        3) install_node_npm_yarn ;;
        4) config_git ;;
        5) exit ;;

        esac
    done
}

rem_locks() {
    # rm locks apt
    sudo rm /var/lib/dpkg/lock-frontend
    sudo rm /var/cache/apt/archives/lock
    sudo rm /var/lib/dpkg/lock

    # Add/Confirm 32 bits
    sudo dpkg --add-architecture i386

    # update
    sudo apt update -y
}

install_apts() {
    # functions
    rem_locks

    # read lines -> list_prog_apt.txt
    while read line; do
        sudo apt install $line -y
    done <"$dir/pos_install/list_prog_apt.txt"

    # flat repo
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    # refresh flat and snap
    flatpak update -y
    snap refresh

    # next
    install_snap_and_flat
}

install_snap_and_flat() {
    # read lines -> list_prog_snap.txt
    while read line; do
        sudo snap install $line
    done <"$dir/pos_install/list_prog_snap.txt"

    # read lines -> list_prog_flat.txt
    while read line; do
        sudo flatpak install -y flathub $line
    done <"$dir/pos_install/list_prog_flat.txt"

    # next
    install_deb
}

install_deb() {
    # Code
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg

    # OneDrive
    echo 'deb http://download.opensuse.org/repositories/home:/jstaf/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:jstaf.list
    curl -fsSL https://download.opensuse.org/repositories/home:jstaf/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_jstaf.gpg >/dev/null

    # Brave
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

    # Beekeeper Studio
    wget --quiet -O - https://deb.beekeeperstudio.io/beekeeper.key | sudo apt-key add -
    echo "deb https://deb.beekeeperstudio.io stable main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list

    sudo apt update -y
    sudo apt dist-upgrade -y
    sudo apt upgrade -y
    sudo apt full-upgrade -y

    # read lines -> list_prog_deb.txt
    while read line; do
        sudo apt install $line -y
    done <"$dir/pos_install/list_prog_deb.txt"

    sudo apt update -y
    sudo apt dist-upgrade -y
    sudo apt upgrade -y
    sudo apt full-upgrade -y
    sudo apt autoclean -y
    sudo apt autoremove -y

    init
}

install_fish() {
    # functions
    rem_locks

    if [[ -d "$HOME/Programming/ShellScripts/" ]]; then
        # Fish
        sudo apt install fish
        chsh -s /usr/bin/fish
        mkdir -p ~/.config/fish

        # Fisher and plugins
        curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
        fisher install jorgebucaran/autopair.fish

        # Starship (download)
        curl -sS https://starship.rs/install.sh | sh

        # create files (config and add preset)
        mkdir -p ~/.config && touch ~/.config/starship.toml
        starship preset bracketed-segments >~/.config/starship.toml

        # add in line 3 -> arquivo config.fish -> content (starship init fish | source)
        sed -i "3i starship init fish | source" ~/.config/fish/config.fish

        # Fish alias
        if [[ -e "$HOME/Programming/ShellScripts/update_all.sh" ]]; then
            alias update_all $HOME/Programming/ShellScripts/update_all.sh
            chmod +x $HOME/Programming/ShellScripts/update_all.sh
        fi

        # set default shell
        which fish
        echo /usr/local/bin/fish | sudo tee -a /etc/shells
        chsh -s /usr/local/bin/fish

        exit
    else
        echo -e "${BIRed}ERROR! $HOME/Programming/ShellScripts/update_all.sh NOT EXISTS OR PATH INCORRECT${BIRed} ${Color_Off}${Color_Off}"
        init
    fi

}

install_node_npm_yarn() {
    rem_locks

    # install npm and corepack enable
    sudo apt install npm -y
    sudo npm install npm -g
    sudo corepack enable

    # install n
    sudo npm cache clean --force
    sudo npm install n -g

    # install node and npm latest version stable
    # https://github.com/tj/n
    sudo n stable

    # install yarn
    sudo npm install yarn -g

    # versions
    echo
    echo "Versões (Node - NPM - Yarn)"
    node -v
    npm -v
    yarn -v

    init
}

config_git() {
    if [[ -d "$HOME/Programming/ShellScripts/" ]]; then
        if [[ -d "$HOME/Programming/ShellScripts/dotfiles" ]]; then
            if [[ -e "$HOME/Programming/ShellScripts/dotfiles/.gitconfig" ]]; then
                #remove ~/.gitconfig file 
                rm ~/.gitconfig

                # create a simbolic link 
                ln -s ~/Programming/ShellScripts/dotfiles/.gitconfig ~/.gitconfig

                echo
                echo -e "${BIGreen}Create a simbolic link (~/Programming/ShellScripts/dotfiles/.gitconfig ----> ~/.gitconfig)${BIGreen} ${Color_Off}${Color_Off}"
            else
                echo
                echo -e "${BIRed}$HOME/Programming/ShellScripts/dotfiles/.gitconfig - FILE DOES NOT EXISTS OR PATH IS INCORRECT${BIRed} ${Color_Off}${Color_Off}"
            fi
        else
            echo
            echo -e "${BIRed}$HOME/Programming/ShellScripts/dotfiles - DOTFILES FOLDER DOES NOT EXISTS OR PATH IS INCORRECT${BIRed} ${Color_Off}${Color_Off}"
        fi
    else
        echo
        echo -e "${BIRed}$HOME/Programming/ShellScripts/ - PATH IS INCORRECT OR FOLDER NOT EXISTS${BIRed} ${Color_Off}${Color_Off}"
    fi

    init
}

# =================== INIT FUNC / PROGRAM ===================
init
