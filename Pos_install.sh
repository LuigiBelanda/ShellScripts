#!/bin/bash

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
    remove_apt_locks
    flatpak install flathub md.obsidian.Obsidian
}

# Função para instalar o Discord via Flatpak
install_discord() {
    remove_apt_locks
    flatpak install flathub com.discordapp.Discord
}

# Função para instalar o Visual Studio Code via Flatpak
install_vscode() {
    remove_apt_locks
    flatpak install flathub com.visualstudio.code
}

# Função para instalar o Bitwarden via Snap
install_bitwarden() {
    remove_apt_locks
    sudo snap install bitwarden
}

# Função para instalar o Authy via Snap
install_authy() {
    remove_apt_locks
    sudo snap install authy
}

# Função para instalar o Postman via Snap
install_postman() {
    remove_apt_locks
    sudo snap install postman
}

# Função para instalar o IntelliJ IDEA Community Edition via Snap
install_intellij() {
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
    echo "3 - Visual Studio Code"
    echo "-----------------------------------------------------"
    echo "SNAPS:"
    echo "4 - Bitwarden"
    echo "5 - Authy"
    echo "6 - Postman"
    echo "7 - IntelliJ IDEA Community Edition"
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
            install_vscode
            ;;
        "4")
            install_bitwarden
            ;;
        "5")
            install_authy
            ;;
        "6")
            install_postman
            ;;
        "7")
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

