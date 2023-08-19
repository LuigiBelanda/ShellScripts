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

# Função para instalar o DBeaver via Flatpak
instalar_dbeaver() {
    verificar_instalar_flatpak
    remover_bloqueios_apt
    flatpak install flathub io.dbeaver.DBeaverCommunity
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

# Função para instalar a Docker Engine
instalar_docker_engine() {
    remover_bloqueios_apt

    # Desinstalar versões antigas
    for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do
        sudo apt remove $pkg
    done

    # Instalação usando repositório APT
    sudo apt update
    sudo apt install ca-certificates curl gnupg

    # Adicionando chave GPG do Docker
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    # Setando o repositório
    echo \
        "deb [arch=\"$(dpkg --print-architecture)\" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $($(. /etc/os-release && echo "$UBUNTU_CODENAME")) stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt update

    # Instalando Docker Engine
    sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # Testando
    sudo docker run hello-world
}

# Exibe o menu de opções
exibir_menu() {
    clear
    echo "MENU DE INSTALAÇÃO DE APPS E FERRAMENTAS"
    echo "-----------------------------------------------------"
    echo "FLATPAKS:"
    echo "1 - Obsidian"
    echo "2 - Discord"
    echo "3 - File Shredder"
    echo "4 - DBeaver"
    echo "-----------------------------------------------------"
    echo "SNAPS:"
    echo "5 - Visual Studio Code"
    echo "6 - Bitwarden"
    echo "7 - Authy"
    echo "8 - Postman"
    echo "9 - IntelliJ IDEA Community Edition"
    echo "-----------------------------------------------------"
    echo "D - Docker Engine"
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
            instalar_dbeaver
            ;;
        "5")
            instalar_vscode
            ;;
        "6")
            instalar_bitwarden
            ;;
        "7")
            instalar_authy
            ;;
        "8")
            instalar_postman
            ;;
        "9")
            instalar_intellij
            ;;
        "D" | "d")
            instalar_docker
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
