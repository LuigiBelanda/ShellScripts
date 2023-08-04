#!/usr/bin/env bash

# Função para verificar e instalar Flatpak (caso não esteja instalado)
verificar_instalar_flatpak() {
    if ! command -v flatpak &>/dev/null; then
        sudo apt install flatpak -y
    fi
}

# Função para verificar e instalar Snap (caso não esteja instalado)
verificar_instalar_snap() {
    if ! command -v snap &>/dev/null; then
        sudo apt install snapd -y
    fi
}

# Função para remover bloqueios do apt
remover_bloqueios_apt() {
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
instalar_obsidian() {
    verificar_instalar_flatpak
    remover_bloqueios_apt
    flatpak install flathub md.obsidian.Obsidian
}

# Função para instalar o Discord via Flatpak
instalar_discord() {
    verificar_instalar_flatpak
    remover_bloqueios_apt
    flatpak install flathub com.discordapp.Discord
}

# Função para instalar o Visual Studio Code via Snap
instalar_vscode() {
    verificar_instalar_snap
    remover_bloqueios_apt
    sudo snap install code --classic
}

# Função para instalar o File Shredder via Flatpak
instalar_file_shredder() {
    verificar_instalar_flatpak
    remover_bloqueios_apt
    flatpak install flathub com.github.ADBeveridge.Raider
}

# Função para instalar o Bitwarden via Snap
instalar_bitwarden() {
    verificar_instalar_snap
    remover_bloqueios_apt
    sudo snap install bitwarden
}

# Função para instalar o Authy via Snap
instalar_authy() {
    verificar_instalar_snap
    remover_bloqueios_apt
    sudo snap install authy
}

# Função para instalar o Postman via Snap
instalar_postman() {
    verificar_instalar_snap
    remover_bloqueios_apt
    sudo snap install postman
}

# Função para instalar o IntelliJ IDEA Community Edition via Snap
instalar_intellij() {
    verificar_instalar_snap
    remover_bloqueios_apt
    sudo snap install intellij-idea-community --classic
}

# Função para configurar o .gitconfig
configurar_gitconfig() {
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
exibir_menu() {
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
    exibir_menu
    read -p "Escolha uma opção: " option

    case $option in
        "1")
            instalar_obsidian
            ;;
        "2")
            instalar_discord
            ;;
        "3")
            instalar_file_shredder
            ;;
        "4")
            instalar_vscode
            ;;
        "5")
            instalar_bitwarden
            ;;
        "6")
            instalar_authy
            ;;
        "7")
            instalar_postman
            ;;
        "8")
            instalar_intellij
            ;;
        "G" | "g")
            configurar_gitconfig
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

