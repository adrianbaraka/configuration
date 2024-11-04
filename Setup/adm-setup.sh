#!/bin/bash

#This is the configuration that require admin priviledges

#########################################################################################################################################################################
#LightDM conf
#Copy background image
#bash -c Executes the following string as a command in a new Bash shell.

mkdir -p /usr/share/images/desktop-base
mkdir -p /etc/lightdm

sudo cp -v conf-files/wallpapers/spiderman-home.jpeg /usr/share/images/desktop-base

sudo bash -c 'echo "[greeter]
background = /usr/share/images/desktop-base/spiderman-home.jpeg
theme-name = Adwaita-dark
icon-theme-name = gnome
font-name = Lato Semi-Bold Italic 13
position = 80%,center 36%,center
indicators = ~spacer;~clock;~spacer;~session;~a11y;~power
clock-format = %A, %H:%M:%S" > /etc/lightdm/lightdm-gtk-greeter.conf'


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

sudo apt update
sudo apt upgrade

#Install all programs in conf-files/programs.txt
grep -vE '^\s*#|^\s*$' conf-files/programs.txt | sudo xargs -r apt install -y
