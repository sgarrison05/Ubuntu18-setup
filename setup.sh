#!/bin/bash

# Ubuntu/Debian Desktop setup script.


# Initial Software

sudo apt update

sudo apt install \
net-tools htop git vim calcurse elinks sc vifm \
ubuntu-restricted-extras figlet newsboat \
openssh netcat nmap traceroute gufw terminator -yy

# Add me to any groups I might need to be a part of:

sudo adduser $USER vboxusers

# Remove undesirable packages:

sudo apt purge deja-dup -yy

# Purge Firefox, install Brave:

sudo apt purge firefox -yy
sudo apt purge firefox-locale-en -yy
if [ -d "/home/$USER/.mozilla" ]; then
    rm -rf /home/$USER/.mozilla
fi
if [ -d "/home/$USER/.cache/mozilla" ]; then
    rm -rf /home/$USER/.cache/mozilla
fi

sudo apt install -y  brave-browser

sudo apt remove ubuntu-web-launchers thunderbird rhythmbox -y

## Multimedia
sudo apt install -y gimp scribus vlc dia kazam vym

## Utilities
sudo apt install -y diodon filezilla bleachbit gparted bluefish \
    libreoffice-base libreoffice-draw calibre 

## Games
sudo apt-get install -y gweled armagetronad lightsoff

## Disable Apport
sudo sed -i 's/enabled=1/enabled=0/g' /etc/default/apport

# Gotta reboot now:
sudo apt update && sudo apt upgrade -y

echo $'\n'$"*** All done! Please reboot now. ***"

sleep 10

sudo reboot now
