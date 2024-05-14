#!/bin/bash
echo "1) Installing necessary packages"
sudo pacman -S git make ruby-sass --noconfirm
echo "2) Creating folder"
mkdir mint && cd mint
echo "3) Cloning Mint themes from github"
git clone https://github.com/linuxmint/mint-themes.git && cd mint-themes
echo "4) Make themes and copy files to themes"
make
sudo cp -r usr/share/themes/* /usr/share/themes
cd ..
echo "5) Cloning Mint Icons X and Y"
git clone https://github.com/linuxmint/mint-x-icons.git && git clone https://github.com/linuxmint/mint-y-icons.git 
echo "6) Copy files to icons"
sudo cp -r mint-x-icons/usr/share/icons/* /usr/share/icons && sudo cp -r mint-y-icons/usr/share/icons/* /usr/share/icons
cd ..
echo "7) Clean up"
rm -rf mint
gsettings set org.cinnamon.theme name "Mint-Y-Dark"
gsettings set org.cinnamon.desktop.interface gtk-theme "Mint-Y-Dark"
gsettings set org.cinnamon.desktop.wm.preferences theme "Mint-Y-Dark"
