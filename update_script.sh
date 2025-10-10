#!/bin/bash


echo 'updating your system'
sudo apt -y update && sudo apt -y upgrade

echo 'updating snap packages'
sudo snap refresh

echo 'installing opera'
sudo snap install opera

echo 'enabling firewall'
ufw enable

echo 'installing useful packages'
sudo apt -y install plocate curl

echo 'enabling source highlight for less'
sudo apt -y install source-highlight
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s" >> ~/.bashrc
export LESS=" -R " >> ~/.bashrc

echo 'installing custom hot corners extension'
curl -L -o custom-hot-corners-extended@G-dH.github.com.zip https://github.com/G-dH/custom-hot-corners-extended/releases/latest/download/custom-hot-corners-extended@G-dH.github.com.zip && mv custom-hot-corners-extended@G-dH.github.com.zip /tmp/
gnome-extensions install --force /tmp/custom-hot-corners-extended@G-dH.github.com.zip
gnome-extensions enable custom-hot-corners-extended@G-dH.github.com

echo 'installing visual studio code'
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/keyrings/packages.microsoft.gpg 
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update && sudo apt install code

echo 'setting up system preferences'
sudo apt -y install gnome-shell-extension-manager
gsettings set org.gnome.shell favorite-apps "['opera_opera.', 'code_code.desktop', 'org.gnome.Nautilus.desktop', 'gnome-terminal.desktop',]"
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false

echo 'Configuring github'
read -p "Enter Github Username: " githubusername
echo 'put in your Github email'
read -p "enter Github Email:" githubemail
git config --global user.name "$githubusername"
git config --global user.email "$githubemail"

echo 'cleaning up'
sudo apt -y autoremove

echo 'hot corners extension needs to be configured. Click the circle on the far right of your task bar (show it by hovering your cursor over the bottom of the screen.) Click Extension manager, click the gear next to Custom Hot Corners - Extended. You can customize from there what certain buttons do.'
echo "thank you for using Xander's update drive"