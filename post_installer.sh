#!/bin/bash

source /etc/os-release

if [[($ID == "fedora")]]
then
  DISTRO=$ID
  pkmngr="dnf"
  #google-chrome
  sudo $pkmngr install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
  #ocs-url
  sudo $pkmngr install https://dl.opendesktop.org/api/files/download/id/1488740868/ocs-url-3.0.0-1.fc20.x86_64.rpm
elif [[($ID == "ubuntu")]]
then
  DISTRO=$ID
  pkmngr="apt"
  #google-chrome
  sudo $pkmngr install https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  #ocs-url
  sudo $pkmngr install https://dl.opendesktop.org/api/files/download/id/1488740853/ocs-url_3.0.0-0ubuntu1_amd64.deb
fi

#Update & Upgrade
sudo $pkmngr update && sudo $pkmngr upgrade

#gnome-tweaks
sudo $pkmngr install gnome-tweaks

#ZSH
sudo $pkmngr install zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)

