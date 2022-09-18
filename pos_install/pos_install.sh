#!/usr/bin/env bash

# Author: Luigi Belanda
# OS: Pop!_Os 22.04 LTS
# Terminal: Fish + Starship

dir=$HOME/Downloads/ShellScripts/pos_install

init() {
    echo 
    echo "Selecione uma opção!"
    echo
    echo "1 - Instalar programas (instalar snaps, flatpaks, deb etc)"
    echo "2 - Criar pastas pessoais e mover arquivos (SOMENTE APÓS TERMINAR A INSTALAÇÃO)"
    echo "3 - Instalar Fish Shell e Starship (irá sair do script no final!)"
    echo "4 - Install NodeJS + NPM + Yarn"
    echo "5 - Config Git (SOMENTE DEPOIS DO PASSO 1)"
    echo "6 - Sair do Script"
    echo
    echo "Verifique se o arquivo ~/.config/fish/config.fish tem a linha (starship init fish | source)"
    echo 
    echo "Qual opção você escolhe?"

    while :
    do
        read opcao_selecionada
        case $opcao_selecionada in
             
            1) install_apts;;
            2) move_dir;;
            3) install_fish;;
            4) install_node_npm_yarn;;
            5) config_git;;
            6) exit

        esac
    done
}

rem_locks() {
    # Removendo travas eventuais do apt #
    sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ; sudo rm /var/lib/dpkg/lock ;

    # Adicionando/Confirmando arquitetura de 32 bits #
    sudo dpkg --add-architecture i386

    # Atualizando o repositório #
    sudo apt update -y
}

install_apts() {
    rem_locks

    # lendo arquivo com apps apt
    while read line; do
        sudo apt install $line -y
    done < "$dir/list_prog_apt.txt"

    # terminando de instalar NPM - NODE etc
    sudo npm cache clean -f
    sudo npm install -g n
    sudo n stable
    sudo npm install --global yarn

    # flat repo
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    # refresh flat and snap
    flatpak update -y 
    snap refresh

    # proximo passo
    install_snap_and_flat
}

install_snap_and_flat() {
    # lendo arquivo com apps snap
    while read line; do
        sudo snap install $line
    done < "$dir/list_prog_snap.txt"

    # lendo arquivo com apps flatpak
    while read line; do
        sudo flatpak install -y flathub $line
    done < "$dir/list_prog_snap.txt"  

    # proximo passo
    install_deb
}

install_deb() {
    # Code
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg

    # OneDrive
    echo 'deb http://download.opensuse.org/repositories/home:/jstaf/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:jstaf.list
    curl -fsSL https://download.opensuse.org/repositories/home:jstaf/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_jstaf.gpg > /dev/null

    # Insomnia
    echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
        | sudo tee -a /etc/apt/sources.list.d/insomnia.list

    # Brave
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

    # Beekeeper Studio
    wget --quiet -O - https://deb.beekeeperstudio.io/beekeeper.key | sudo apt-key add -
    echo "deb https://deb.beekeeperstudio.io stable main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list

    sudo apt update -y
    sudo apt dist-upgrade -y
    sudo apt upgrade -y 
    sudo apt full-upgrade -y 

    # lendo arquivo com apps deb
    while read line; do
        sudo apt install $line -y
    done < "$dir/list_prog_snap.txt"  

    sudo apt update -y
    sudo apt dist-upgrade -y
    sudo apt upgrade -y 
    sudo apt full-upgrade -y 
    sudo apt autoclean -y 
    sudo apt autoremove -y 

    init
}

move_dir() {
    # Criando pastas de organização pessoal
    mkdir $HOME/Programming -m 777
    mkdir $HOME/OneDriver
    mkdir -p $HOME/OneDriver/FATEC
    mkdir -p $HOME/OneDriver/Pessoal

    # Movendo os scripts para a nova pasta Programming para melhor organização
    mv $HOME/Downloads/ShellScripts $HOME/Programming/

    init
}

install_fish() {
    rem_locks

    # Fish
    sudo apt install fish
    chsh -s /usr/bin/fish
    mkdir -p ~/.config/fish

    # Starship (baixando - criando arquivo de config - colocando preset)
    curl -sS https://starship.rs/install.sh | sh

    # add na linha 3 do arquivo config.fish o conteúdo (starship init fish | source)
    sed -i "3i starship init fish | source" ~/.config/fish/config.fish

    # criando arquivos de config e add preset
    mkdir -p ~/.config && touch ~/.config/starship.toml 
    starship preset bracketed-segments > ~/.config/starship.toml

    exit
}

install_node_npm_yarn() {
    rem_locks

    sudo apt install npm -y
    sudo npm install npm -g
    sudo corepack enable

    sudo npm cache clean --force
    sudo npm install n -g

    # https://github.com/tj/n 
    sudo n stable

    sudo npm install yarn -g

    echo
    echo "Versões (Node - NPM - Yarn)"
    node -v
    npm -v
    yarn -v

    init
}

config_git () {
    echo 
    echo "CONFIG DO GIT"
    echo "Username Git:"
    read userGit
    echo
    echo "Email Git:"
    read emailGit

    git config --global user.name $userGit
    git config --global user.email $emailGit

    echo
    echo "Dados Registrados"
    git config user.name
    git config user.email

    init
}


# ------------------------ Init func ------------------------ #
init