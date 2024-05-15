#!/bin/bash
echo "1) Installing unzip from pacman..."
sudo pacman -S unzip --noconfirm
echo "2) Downloading FiraCode from nerdfonts.com"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
echo "3) Unziping FiraCode..."
unzip FiraCode.zip -d firacode && cd firacode
echo "4) Moving all fonts..."
sudo mv *.ttf /usr/share/fonts
cd ..
echo "5) Cleaning up..."
rm -rf firacode && rm -rf FiraCode.zip
echo "6) Done!"
