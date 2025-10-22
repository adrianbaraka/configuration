#!/bin/bash

#This is the configuration that require admin priviledge


#########################################################################################################################################################################
#Recognize wireless button
sudo cp -v ../Scripts/setkeycodes.service /etc/systemd/system

#Enable the service for on startup
sudo systemctl enable setkeycodes.service

sleep 3

#Create a shortcut for it
airplane_script_path="$(dirname "$(pwd)")/Scripts/airplane_mode.sh"
xfconf-query --create -c 'xfce4-keyboard-shortcuts' -p '/commands/custom/WLAN' --type 'string' --set "$airplane_script_path"

#########################################################################################################################################################################
#Grub setup
sudo cp -v conf-files/wallpapers/spiderman-upside.png /boot/grub

sudo bash -c 'echo "GRUB_BACKGROUND=/boot/grub/spiderman-upside.png" >> /etc/default/grub'
sudo update-grub

#########################################################################################################################################################################
#Fonts
sudo mkdir -p "/usr/share/fonts/User Installed"

sudo cp -vr "conf-files/Fonts"/* "/usr/share/fonts/User Installed"
sudo fc-cache -fv



#########################################################################################################################################################################
#disable audio beep

sudo bash -c 'echo "blacklist pcspkr" >> /etc/modprobe.d/blacklist.conf'
#########################################################################################################################################################################
# cpu governor to performance
sudo cp -v "$(dirname "$(pwd)")"/Scripts/cpuPower.service /etc/systemd/system

sudo systemctl enable cpuPower.service
