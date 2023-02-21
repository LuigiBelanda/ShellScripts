#!/usr/bin/env bash

echo 
echo "============================"
echo 
echo "INSTALL STARSHIP PRESET - VERIFY ~/.ZSHRC"
echo 
echo "============================"
echo 

echo "" >> ~/.zshrc
echo "# PERSONAL ALIAS" >> ~/.zshrc
echo 'alias upd_all="./Programming/ShellScripts/Update_scripts/update_all.sh"' >> ~/.zshrc
echo 'alias upd_node="./Programming/ShellScripts/Update_scripts/update_node_npm_yarn.sh"' >> ~/.zshrc


