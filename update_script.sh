#!/bin/bash

echo 'updating your system'
sudo apt -y update && sudo apt -y upgrade

echo 'updating snap packages'
sudo snap refresh

echo 'installing opera'
sudo snap install opera

echo 'enabling firewall'
ufw enable

echo 'installing useful snap packages'
sudo apt -y install plocate && sudo apt -y install source-highlight && sudo apt -y install gnome-shell-extension-manager

echo 'enabling source highlight'
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s" >> ~/.bashrc
export LESS=" -R " >> ~/.bashrc

echo 'installing visual studio code'
chmod 666 code_1.103.1-1755017277_amd64.deb
mv code_1.103.1-1755017277_amd64.deb /tmp
sudo apt install /tmp/code_1.103.1-1755017277_amd64.deb

echo "thank you for using Xander's update drive"