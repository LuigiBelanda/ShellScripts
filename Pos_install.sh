#!/usr/bin/env bash

# Função para verificar e instalar Flatpak (caso não esteja instalado)
check_install_flatpak() {
    if ! command -v flatpak &>/dev/null; then
        sudo apt install flatpak -y
    fi
}

# Função para verificar e instalar Snap (caso não esteja instalado)
check_install_snap() {
    if ! command -v snap &>/dev/null; then
        sudo apt install snapd -y
    fi
}

# Função para remover bloqueios do apt
remove_apt_locks() {
    if [[ -f "/var/lib/dpkg/lock-frontend" ]]; then
        sudo rm /var/lib/dpkg/lock-frontend
    fi

    if [[ -f "/var/lib/dpkg/lock" ]]; then
        sudo rm /var/lib/dpkg/lock
    fi

    if [[ -f "/var/cache/apt/archives/lock" ]]; then
        sudo rm /var/cache/apt/archives/lock
    fi
}

# Função para instalar o Obsidian via Flatpak
install_obsidian() {
    check_install_flatpak
    remove_apt_locks
    flatpak install flathub md.obsidian.Obsidian
}

# Função para instalar o Discord via Flatpak
install_discord() {
    check_install_flatpak
    remove_apt_locks
    flatpak install flathub com.discordapp.Discord
}

# Função para instalar o Visual Studio Code via Snap
install_vscode() {
    check_install_snap
    remove_apt_locks
    sudo snap install code --classic
}

# Função para instalar o File Shredder via Flatpak
install_file_shredder() {
    check_install_flatpak
    remove_apt_locks
    flatpak install flathub com.github.ADBeveridge.Raider
}

# Função para instalar o Bitwarden via Snap
install_bitwarden() {
    check_install_snap
    remove_apt_locks
    sudo snap install bitwarden
}

# Função para instalar o Authy via Snap
install_authy() {
    check_install_snap
    remove_apt_locks
    sudo snap install authy
}

# Função para instalar o Postman via Snap
install_postman() {
    check_install_snap
    remove_apt_locks
    sudo snap install postman
}

# Função para instalar o IntelliJ IDEA Community Edition via Snap
install_intellij() {
    check_install_snap
    remove_apt_locks
    sudo snap install intellij-idea-community --classic
}

# Função para configurar o .gitconfig
configure_gitconfig() {
    gitconfig_folder="/home/luigibelanda/Área de Trabalho/Programming/ShellScripts/Dotfiles"
    gitconfig_file="$gitconfig_folder/.gitconfig"

    if [[ -d "$gitconfig_folder" ]]; then
        if [[ -e "$gitconfig_file" ]]; then
            # Remove ~/.gitconfig file
            rm ~/.gitconfig

            # Create a symbolic link
            ln -s "$gitconfig_file" ~/.gitconfig

            echo
            echo -e "Criou um link simbólico ($gitconfig_file ----> ~/.gitconfig)"
        else
            echo
            echo -e "$gitconfig_file - O ARQUIVO NÃO EXISTE OU O CAMINHO ESTÁ INCORRETO"
        fi
    else
        echo
        echo -e "$gitconfig_folder - A PASTA DOTFILES NÃO EXISTE OU O CAMINHO ESTÁ INCORRETO"
    fi
}

# Exibe o menu de opções
show_menu() {
    clear
    echo "MENU DE INSTALAÇÃO DE APPS E CONFIGURAÇÃO DO .gitconfig"
    echo "-----------------------------------------------------"
    echo "FLATPAKS:"
    echo "1 - Obsidian"
    echo "2 - Discord"
    echo "3 - File Shredder"
    echo "-----------------------------------------------------"
    echo "SNAPS:"
    echo "4 - Visual Studio Code"
    echo "5 - Bitwarden"
    echo "6 - Authy"
    echo "7 - Postman"
    echo "8 - IntelliJ IDEA Community Edition"
    echo "-----------------------------------------------------"
    echo "G - Configurar .gitconfig"
    echo "Q - Sair"
    echo "-----------------------------------------------------"
}

# Loop principal
while true; do
    show_menu
    read -p "Escolha uma opção: " option

    case $option in
        "1")
            install_obsidian
            ;;
        "2")
            install_discord
            ;;
        "3")
            install_file_shredder
            ;;
        "4")
            install_vscode
            ;;
        "5")
            install_bitwarden
            ;;
        "6")
            install_authy
            ;;
        "7")
            install_postman
            ;;
        "8")
            install_intellij
            ;;
        "G" | "g")
            configure_gitconfig
            ;;
        "Q" | "q")
            echo "Saindo..."
            break
            ;;
        *)
            echo "Opção inválida! Tente novamente."
            ;;
    esac

    read -p "Pressione ENTER para continuar..."
done

