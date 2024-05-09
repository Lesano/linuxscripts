#!/bin/bash
echo "Remove all snap apps"
sudo snap remove --purge firefox
sudo snap remove --purge snap-store
sudo snap remove --purge gnome-42-2204
sudo snap remove --purge gtk-common-themes
sudo snap remove --purge snapd-desktop-integration
sudo snap remove --purge bare
sudo snap remove --purge core202
sudo snap remove --purge snapd
sudo apt remove --autoremove snapd -y

sudo echo -e "Package: snapd\nPin: release a=*\nPin-Priority: -10" >> /etc/apt/preferences.d/nosnap.pref
sudo apt update -y
echo "Install Firefox"
sudo apt install --install-suggests gnome-software -y
sudo apt install gnome-software-plugin-flatpak -y
sudo add-apt-repository ppa:mozillateam/ppa -y
sudo apt update -y
sudo apt install -t 'o=LP-PPA-mozillateam' firefox -y
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
sudo echo -e "Package: firefox*\nPin: release o=LP-PPA-mozillateam\nPin-Priority: 501" >> /etc/apt/preferences.d/mozillateamppa
reboot
