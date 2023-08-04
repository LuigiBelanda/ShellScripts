#!/usr/bin/env bash

# Script para atualizar o sistema, Snap, Flatpak e remover arquivos temporários

# Verificar a conexão de internet
ping -c 1 google.com >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Sem conexão de internet. Verifique sua conexão e tente novamente."
    exit 1
fi

# Remover bloqueios do apt
if [[ -d "/var/lib/dpkg/lock-frontend" ]]; then
    sudo rm /var/lib/dpkg/lock-frontend
fi

if [[ -d "/var/lib/dpkg/lock" ]]; then
    sudo rm /var/lib/dpkg/lock
fi

if [[ -d "/var/cache/apt/archives/lock" ]]; then
    sudo rm /var/cache/apt/archives/lock
fi

# Adicionar/Confirmar arquitetura 32 bits
sudo dpkg --add-architecture i386

# Atualizar banco de pacotes
echo 
echo "============================"
echo 
echo "ATUALIZAR BANCO DE PACOTES"
echo 
echo "============================"
echo 
sudo apt update -y 
sudo apt dist-upgrade -y
sudo apt upgrade -y 
sudo apt full-upgrade -y 

# Atualizar Flatpak
echo 
echo "============================"
echo 
echo "ATUALIZAR FLATPAK"
echo 
echo "============================"
echo 
flatpak update -y 

# Atualizar Snap
echo 
echo "============================"
echo 
echo "ATUALIZAR SNAP"
echo 
echo "============================"
echo 
snap refresh

# Remover arquivos temporários
echo 
echo "============================"
echo 
echo "REMOVER ARQUIVOS TEMPORÁRIOS"
echo 
echo "============================"
echo 
sudo apt autoclean
sudo apt clean
sudo apt autoremove -y 

# Verificar e corrigir dependências quebradas
sudo apt --fix-broken install

# Limpar registros antigos do kernel
sudo apt autoremove --purge

# Limpar logs do sistema
sudo journalctl --vacuum-size=100M
