!/bin/bash


echo 'updating your system'
sudo apt -y update && sudo apt -y upgrade

echo 'updating snap packages'
sudo snap refresh

if ! snap list | grep -q '^opera'; then
    echo 'installing opera'
    sudo snap install opera
else
    echo 'opera already installed, skipping'
fi

echo 'enabling firewall'
sudo ufw enable

if ! dpkg -l | grep -q 'ii  plocate'; then
    echo 'installing plocate'
    sudo apt -y install plocate
else 
    echo 'plocate already installed, skipping'
fi

if ! dpkg -l | grep -q 'ii  curl'; then
    echo 'installing curl'
    sudo apt -y install curl
else 
    echo 'curl already installed, skipping'
fi

if ! dpkg -l | grep -q 'ii  source-highlight'; then
    echo 'enabling source highlight for less'
    sudo apt -y install source-highlight
else 
    echo 'source-highlight already installed, skipping'
fi

if grep -q 'export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"' ~/.bashrc && grep -q "export LESS=' -cR '" ~/.bashrc; then
    echo 'less already configured to use source highlight, skipping'
else
    echo 'configuring less to use source highlight'
    echo -e '\n # enable source highlighting in less' >> ~/.bashrc
    echo 'export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"' >> ~/.bashrc
    echo "export LESS=' -cR '" >> ~/.bashrc
    source ~/.bashrc
fi

# if [ !  -d "~/.local/share/gnome-shell/extensions/custom-hot-corners-extended@G-dH.github.com" ]; then
#     echo 'installing custom hot corners extension'
#     curl -L -o /tmp/custom-hot-corners-extended@G-dH.github.com.zip https://github.com/G-dH/custom-hot-corners-extended/releases/latest/download/custom-hot-corners-extended@G-dH.github.com.zip
#     gnome-extensions install --force /tmp/custom-hot-corners-extended@G-dH.github.com.zip
#     gnome-extensions enable custom-hot-corners-extended@G-dH.github.com
# else"~/.local/share/gnome-shell/extensions/custom-hot-corners-extended@G-dH.github.com"
#     echo 'custom hot corners extension already installed, skipping'
# fi

if ! find /etc/apt/sources.list.d/ -name 'vscode.sources'; then
    echo 'installing visual studio code'
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/keyrings/packages.microsoft.gpg 
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
    sudo apt update && sudo apt install code
else 
    echo 'visual studio code already installed, skipping'
fi


echo 'setting up system preferences'
sudo apt -y install gnome-shell-extension-manager
gsettings set org.gnome.shell favorite-apps "['opera_opera.desktop', 'firefox_firefox.desktop, 'org.gnome.Terminal.desktop', 'org.gnome.Settings.desktop', 'code.desktop', 'org.gnome.Nautilus.desktop']"
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings show org.gnome.shell.extensions.dash-to-dock multi-monitor true


git config --global user.name
read -p 'Is your github username? (y/n)' answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Github already configured, skipping"
else
    echo 'Configuring github'
    read -p "Enter Github Username: " githubusername
    read -p "Enter Github Email: " githubemail
    git config --global user.name "$githubusername"
    git config --global user.email "$githubemail"
fi


echo 'cleaning up'
sudo apt -y autoremove

echo 'hot corners extension needs to be configured. Click the circle on the far right of your task bar (show it by hovering your cursor over the bottom of the screen.) Click Extension manager, click the gear next to Custom Hot Corners - Extended. You can customize from there what certain buttons do.'
echo "thank you for using Xander's update drive"