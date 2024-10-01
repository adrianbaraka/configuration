#!/bin/bash

#This is the configuration that require admin priviledges

sudo apt update
sudo apt upgrade



#Install all programs in conf-files/programs.txt
grep -vE '^\s*#|^\s*$' conf-files/programs.txt | sudo xargs -r apt install -y

#Install vs-code
echo "code code/add-microsoft-repo boolean true" | sudo debconf-set-selections

sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https
sudo apt update
sudo apt install code

#Install Spotify
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

#Google-Chrome
#It will auto add the repo to the sources list...verify
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.

#Only Office
mkdir -p ~/.gnupg
chmod 700 ~/.gnupg
gpg --no-default-keyring --keyring gnupg-ring:/tmp/onlyoffice.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
chmod 644 /tmp/onlyoffice.gpg
sudo chown root:root /tmp/onlyoffice.gpg
sudo mv /tmp/onlyoffice.gpg /usr/share/keyrings/onlyoffice.gpg

echo 'deb [signed-by=/usr/share/keyrings/onlyoffice.gpg] https://download.onlyoffice.com/repo/debian squeeze main' | sudo tee -a /etc/apt/sources.list.d/onlyoffice.list

sudo apt-get update

sudo apt-get install onlyoffice-desktopeditors


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

#Create a shortcut for it
airplane_script_path="$(dirname "$(pwd)")/Scripts/airplane_mode.sh"
xfconf-query --create -c 'xfce4-keyboard-shortcuts' -p '/commands/custom/WLAN' --type 'string' --set "$airplane_script_path"

#########################################################################################################################################################################
#Grub setup
sudo cp -v conf-files/wallpapers/spiderman-upside.png /boot/grub

sudo bash -c 'echo "GRUB_BACKGROUND=/boot/grub/spiderman-upside.png" >> /etc/default/grub'
update-grub



