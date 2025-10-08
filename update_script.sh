#!/bin/bash

echo 'updating your system'
sudo apt -y update && sudo apt -y upgrade
echo 'system updated'
echo 'updating snap packages'
sudo snap refresh
echo 'snap packages updated'
echo 'installing opera'
sudo snap install opera
echo 'opera installed'
echo 'enabling firewall'
ufw enable
echo 'firewall enabled'
echo 'installing useful snap packages'
sudo apt -y install plocate && sudo apt -y install source-highlight && sudo apt -y install gnome-shell-extension-manager
echo 'installed'
echo 'enabling source highlight'
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s" >> ~/.bashrc
export LESS=" -R " >> ~/.bashrc
echo 'source highlight enabled'
echo "thank you for using Xander's update drive"