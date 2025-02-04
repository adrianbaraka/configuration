#!/bin/bash

#This is my configuration for the XFCE Linux desktop environment


#Extract the archive
tar -xvJf conf-files/conf-files.tar.xz -C ./conf-files


#Variables
#Declare an associative array to store shortcuts and their commands [150]
declare -A shortcuts=(
    ["<Super>e"]="nautilus starred:///"
    ["Super_L"]="xfce4-popup-whiskermenu"
    ["<Super>period"]="/usr/bin/gnome-characters"
    ["<Super>v"]="xfce4-clipman-history"
    ["<Super>Tab"]="xfwm4-workspace-settings"
)

# Define the theme and icon names [178]
gtk_theme="Flat-Remix-GTK-Blue-Dark-Solid"
icon_theme="Flat-Remix-Blue-Dark"
wm_theme="Flat-Remix-Dark-XFWM"
mouse_theme="Bibata-Original-Ice"


#####################################################################################################################################################################################
#Panel configuration
#list all 
#xfconf-query --channel xfce4-panel --list --verbose

#Delete all panels
xfconf-query --channel xfce4-panel --reset -R --property /panels
xfconf-query --channel xfce4-panel --reset -R --property /plugins


#Restart xfce panels
xfce4-panel --restart

#Wait for panel to restart
sleep 3

xfconf-query --channel xfce4-panel --property /panels --type int --set 1

#Restart xfce panels
xfce4-panel --restart

#Wait for panel to restart
sleep 3


#Change workspace names and count
xfconf-query --channel xfwm4 --property /general/workspace_count --create --type int --set 2
xfconf-query --channel xfwm4 --property /general/workspace_names --create --type string --type string --set "  Home  " --set "  Code  "

#Set panel 1 to full length
xfconf-query --channel xfce4-panel --property /panels/panel-1/length --create --type int --set 100

#Set row size to 40 
xfconf-query --channel xfce4-panel --property /panels/panel-1/size --create --type int --set 40

#Set panel 1 to top of the screen
xfconf-query --channel xfce4-panel --property /panels/panel-1/position --create --type string --set "p=6;x=960;y=21"

#Lock panel 1
xfconf-query --channel xfce4-panel --property /panels/panel-1/position-locked --create --type bool --set true

#Add plugins to panel 1
xfce4-panel --add whiskermenu
xfce4-panel --add separator
xfce4-panel --add pager
xfce4-panel --add separator
xfce4-panel --add clock
xfce4-panel --add separator
xfce4-panel --add cpugraph
xfce4-panel --add power-manager-plugin
xfce4-panel --add separator
xfce4-panel --add actions



#pager
xfconf-query --channel xfce4-panel --property /plugins/plugin-3/miniature-view --create --type bool --set false
xfconf-query --channel xfce4-panel --property /plugins/plugin-3/numbering --create --type bool --set false
xfconf-query --channel xfce4-panel --property /plugins/plugin-3/rows --create --type int --set 1

#Separator
xfconf-query --channel xfce4-panel --property /plugins/plugin-4/expand --create --type bool --set true
xfconf-query --channel xfce4-panel --property /plugins/plugin-4/style --create --type int --set 0

#Clock
xfconf-query --channel xfce4-panel --property /plugins/plugin-5/digital-layout --create --type int --set 3
xfconf-query --channel xfce4-panel --property /plugins/plugin-5/digital-time-font --create --type string --set "C059 Bold Italic 14"
xfconf-query --channel xfce4-panel --property /plugins/plugin-5/digital-time-format --create --type string --set "%H:%M:%S, %A"
xfconf-query --channel xfce4-panel --property /plugins/plugin-5/tooltip-format --create --type string --set "Week %V"

#Separator
xfconf-query --channel xfce4-panel --property /plugins/plugin-6/expand --create --type bool --set true
xfconf-query --channel xfce4-panel --property /plugins/plugin-6/style --create --type int --set 0



#separator
xfconf-query --channel xfce4-panel --property /plugins/plugin-9/style --create --type int --set 0

#Action buttons
xfconf-query --channel xfce4-panel --property /plugins/plugin-10/appearance --create --type int --set 0
xfconf-query --channel xfce4-panel --property /plugins/plugin-10/items --create --type string --type string --type string --type string --type string --type string --type string --type string --type string --type string --type string --type string  --set -lock-screen --set -switch-user --set -separator --set -suspend --set -hibernate --set -hybrid-sleep --set -separator --set -shutdown --set -restart --set -separator --set +logout --set -logout-dialog

#Add a new panel
##### This is how to specify array values ####
xfconf-query --channel xfce4-panel --property /panels --type int --type int --set 1 --set 2
xfce4-panel --restart

#Wait for panel to restart
sleep 3


#Set panel 2 to full width
xfconf-query --channel xfce4-panel --property /panels/panel-2/length --create --type int --set 100

#Set panel 2 to bottom
xfconf-query --channel xfce4-panel --property /panels/panel-2/position --create --type string --set "p=8;x=960;y=1055"

#panel 2 fixed icon size
xfconf-query --channel xfce4-panel --property /panels/panel-2/icon-size --create --type int --set 32


echo "Select panel 2 in the options for all."
notify-send -i preferences-desktop "Setup" "Select panel 2 in the options for all."


#Plugins for panel 2
xfce4-panel --add showdesktop
xfce4-panel --add separator
xfce4-panel --add tasklist
xfce4-panel --add separator
xfce4-panel --add systray
xfce4-panel --add pulseaudio
xfce4-panel --add notification-plugin

#Tasklist
xfconf-query --channel xfce4-panel --property /plugins/plugin-13/grouping --create --type bool --set true
xfconf-query --channel xfce4-panel --property /plugins/plugin-13/flat-buttons --create --type bool --set false
xfconf-query --channel xfce4-panel --property /plugins/plugin-13/show-handle --create --type bool --set false
xfconf-query --channel xfce4-panel --property /plugins/plugin-13/show-tooltips --create --type bool --set true
xfconf-query --channel xfce4-panel --property /plugins/plugin-13/show-labels --create --type bool --set false
xfconf-query --channel xfce4-panel --property /plugins/plugin-13/sort-order --create --type int --set 0
xfconf-query --channel xfce4-panel --property /plugins/plugin-13/include-all-workspaces --create --type bool --set false

#Separator
xfconf-query --channel xfce4-panel --property /plugins/plugin-14/expand --create --type bool --set true
xfconf-query --channel xfce4-panel --property /plugins/plugin-14/style --create --type int --set 0

#increase icon size systray
xfconf-query --channel xfce4-panel --property /plugins/plugin-15/icon-size  --create --type int --set 29

#Wait 3 sec to view the panel
sleep 3

#Set panel 2 to auto hide
xfconf-query --channel xfce4-panel --property /panels/panel-2/autohide-behavior --create --type int --set 2

#Lock panel 2
xfconf-query --channel xfce4-panel --property /panels/panel-2/position-locked --create --type bool --set true

xfce4-panel --restart
sleep 3

#Whisker-menu
mkdir -p ~/.config/xfce4/panel
cp -v conf-files/whiskermenu-1.rc ~/.config/xfce4/panel

#Cpugraph
echo "TimeScale=0
Size=50
Frame=0
Border=1
Bars=0
PerCore=0
TrackedCore=0
InTerminal=1
StartupNotification=0
ColorMode=0
" > ~/.config/xfce4/panel/cpugraph-7.rc

#Reduce size of audio control and battery plugin
mkdir -p ~/.config/gtk-3.0

echo "#pulseaudio-button * {
    -gtk-icon-transform: scale(.6);
}

 #xfce4-power-manager-plugin * {
    -gtk-icon-transform: scale(.8);
}

#xfce4-notification-plugin * {
  -gtk-icon-transform: scale(.6);
}" >> ~/.config/gtk-3.0/gtk.css


xfce4-panel --restart


#Window layout
xfconf-query --channel xsettings --property /Gtk/DecorationLayout --create --type string --set "menu:minimize,maximize,close"


#########################################################################################################################################################################
#Configure Shortcuts

# Function to set a shortcut and check for errors
set_shortcut() {
    local shortcut_suffix="$1"
    local command="$2"
    local COMMON_PREFIX="/commands/custom/"
    local shortcut_path="${COMMON_PREFIX}${shortcut_suffix}"

    xfconf-query -c xfce4-keyboard-shortcuts -p "$shortcut_path" -n -t string -s "$command"

    # Check the return status of the last command
    # shellcheck disable=SC2181
    if [ $? -eq 0 ]; then
        echo "Shortcut to '$command' set Successfully."
    else
        echo "Error: Failed to set shortcut $shortcut_path to '$command'."
    fi
}

# Iterate over the associative array and set each shortcut
for shortcut_suffix in "${!shortcuts[@]}"; do
    set_shortcut "$shortcut_suffix" "${shortcuts[$shortcut_suffix]}"
done

##Window placement
#primary== R-ctrl
xfconf-query --create -c 'xfce4-keyboard-shortcuts' -p '/xfwm4/custom/<Primary>Up' --type 'string' --set 'tile_up_key'
xfconf-query --create -c 'xfce4-keyboard-shortcuts' -p '/xfwm4/custom/<Primary>Down' --type 'string' --set 'tile_down_key'
xfconf-query --create -c 'xfce4-keyboard-shortcuts' -p '/xfwm4/custom/<Primary>Left' --type 'string' --set 'tile_left_key'
xfconf-query --create -c 'xfce4-keyboard-shortcuts' -p '/xfwm4/custom/<Primary>Right' --type 'string' --set 'tile_right_key'

#########################################################################################################################################################################

# Get the directory of the script
#script_dir=$(dirname "$0")

# Join the script directory with the relative paths
theme_source_dir="conf-files/$gtk_theme"
icon_source_dir="conf-files/$icon_theme"
wm_theme_source_dir="conf-files/$wm_theme"
mouse_theme_source_dir="conf-files/$mouse_theme"

# Define destination directories
theme_dest_dir="$HOME/.themes/$gtk_theme"
icon_dest_dir="$HOME/.icons/$icon_theme"
wm_theme_dest_dir="$HOME/.themes/$wm_theme"
mouse_theme_dest_dir="$HOME/.icons/$mouse_theme"

# Create destination directories if they do not exist
mkdir -p "$theme_dest_dir"
mkdir -p "$icon_dest_dir"
mkdir -p "$wm_theme_dest_dir"
mkdir -p "$mouse_theme_dest_dir"

#For gnome apps config file
mkdir -p ~/.config/gtk-4.0

# Copy themes and icons to the respective directories
cp -r "$theme_source_dir"/* "$theme_dest_dir"
cp -r "$icon_source_dir"/* "$icon_dest_dir"
cp -r "$wm_theme_source_dir"/* "$wm_theme_dest_dir"
cp -r "$mouse_theme_source_dir"/* "$mouse_theme_dest_dir"

#For gnome apps config
cp -r conf-files/gtk-4.0/* ~/.config/gtk-4.0

#Apply themes
xfconf-query -c xsettings -p /Net/ThemeName -n -s "$gtk_theme"
xfconf-query -c xsettings -p /Net/IconThemeName -n -s "$icon_theme"
xfconf-query -c xfwm4 -p /general/theme -n -s "$wm_theme"
xfconf-query -c xsettings -p /Gtk/CursorThemeName -n -s "$mouse_theme"

#Apply for gnome apps
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme "$gtk_theme"
gsettings set org.gnome.desktop.interface icon-theme "$icon_theme"

#Verify changes
current_gtk_theme=$(xfconf-query -c xsettings -p /Net/ThemeName)
current_icon_theme=$(xfconf-query -c xsettings -p /Net/IconThemeName)
current_wm_theme=$(xfconf-query -c xfwm4 -p /general/theme)
current_GDM_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme)
current_mouse_theme=$(xfconf-query -c xsettings -p /Gtk/CursorThemeName)

if [ "$current_gtk_theme" == "$gtk_theme" ] && [ "$current_icon_theme" == "$icon_theme" ] && [ "$current_wm_theme" == "$wm_theme" ] && [ "$current_GDM_THEME" == "'$gtk_theme'" ] && [ "$current_mouse_theme" == "$mouse_theme" ]; then
    echo "Themes successfully applied!"
else
    echo "There was an issue applying the themes."
fi

#########################################################################################################################################################################
#Mouse settings 
#Acceleration
xfconf-query --channel pointers --property /SynPS2_Synaptics_TouchPad/Acceleration --create --type double --set 7.800000

#Enable
xfconf-query --channel pointers --property /SynPS2_Synaptics_TouchPad/Properties/Device_Enabled --create --type int --set 1

#Right-Handed
xfconf-query --channel pointers --property /SynPS2_Synaptics_TouchPad/RightHanded --create --type bool --set true

#Reverse scroll direction
xfconf-query --channel pointers --property /SynPS2_Synaptics_TouchPad/ReverseScrolling --create --type bool --set true

#Tap touchpad to click
xfconf-query --channel pointers --property /SynPS2_Synaptics_TouchPad/Properties/libinput_Tapping_Enabled --create --type int --set 1

#Two finger scrolling
xfconf-query --channel pointers --property /SynPS2_Synaptics_TouchPad/Properties/libinput_Scroll_Method_Enabled --create --type int --type int --type int --set 1 --set 0 --set 0
xfconf-query --channel pointers --property /SynPS2_Synaptics_TouchPad/Properties/Synaptics_Two-Finger_Scrolling --create --type int --type int --set 1 --set 0

#Cursor size 
xfconf-query --channel xsettings --property /Gtk/CursorThemeSize --create --type int --set 26


#########################################################################################################################################################################
#Power manager
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/blank-on-ac --create --type int --set 0
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/blank-on-battery --create --type int --set 0
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/brightness-level-on-ac --create --type int --set 20
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/brightness-level-on-battery --create --type int --set 20
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/brightness-on-ac --create --type int --set 9
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/brightness-on-battery --create --type int --set 9
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/brightness-switch-restore-on-exit --create --type int --set 1
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/critical-power-level --create --type int --set 15
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/dpms-enabled --create --type bool --set true
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/dpms-on-ac-off --create --type int --set 0
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/dpms-on-ac-sleep --create --type int --set 0
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/dpms-on-battery-off --create --type int --set 0
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/dpms-on-battery-sleep --create --type int --set 0
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/general-notification --create --type bool --set false
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/handle-brightness-keys --create --type bool --set true
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/inactivity-on-ac --create --type int --set 14
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/inactivity-on-battery --create --type int --set 14
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/inactivity-sleep-mode-on-battery --create --type int --set 1
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/lid-action-on-ac --create --type int --set 3
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/lid-action-on-battery --create --type int --set 3
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/logind-handle-lid-switch --create --type bool --set false
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/power-button-action --create --type int --set 3
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/show-panel-label --create --type int --set 1
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/show-presentation-indicator --create --type bool --set true
xfconf-query --channel xfce4-power-manager --property /xfce4-power-manager/show-tray-icon --create --type bool --set false

echo "Confirm power manager ☠️☠️"
notify-send -i dialog-error "Setup" "Confirm power manager ☠️☠️"

#########################################################################################################################################################################
#Clipman
xfconf-query --channel xfce4-panel --property /plugins/clipman/settings/enable-actions --create --type bool --set true
xfconf-query --channel xfce4-panel --property /plugins/clipman/settings/max-texts-in-history --create --type int --set 30
xfconf-query --channel xfce4-panel --property /plugins/clipman/tweaks/max-menu-items --create --type int --set 10
xfconf-query --channel xfce4-panel --property /plugins/clipman/tweaks/never-confirm-history-clear --create --type bool --set false
xfconf-query --channel xfce4-panel --property /plugins/clipman/tweaks/skip-action-on-key-down --create --type bool --set false



#########################################################################################################################################################################
#xfce-terminal
mkdir -p ~/.config/xfce4/terminal
cp -v conf-files/terminalrc ~/.config/xfce4/terminal/terminalrc

#########################################################################################################################################################################
#Bash configurations
cat conf-files/bashrc >> ~/.bashrc
cp -v conf-files/bash_aliases ~/.bash_aliases
cp -v conf-files/bash_functions ~/.bash_functions 

notify-send -i preferences-desktop "Setup" "Restart to ensure all changes take effect"

#########################################################################################################################################################################
# QT5 qt5ct
echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> ~/.profile
notify-send -i preferences-desktop "QT settings" "Use QT5ct to change theme for QT apps"

#########################################################################################################################################################################
#Add 1920*1080 resolution for second monitor
#Set it to autostart on login

mkdir -p ~/.config/autostart
exec_path="$(dirname "$(pwd)")/Scripts/resolution.sh"

echo "[Desktop Entry]
Encoding=UTF-8
Version=0.9.4
Type=Application
Name=Resolution add
Comment=Add 1920*1080 resolution to secondary screen
Exec=$exec_path
RunHook=0
StartupNotify=false
Terminal=false
Hidden=false" > ~/.config/autostart/add-resolution.desktop


#########################################################################################################################################################################
#Set up file templates
mkdir -p ~/Templates

cp -r conf-files/Templates/* ~/Templates

#########################################################################################################################################################################
#Nautilus Scripts
mkdir -p ~/.local/share/nautilus/scripts

#Open a file or directory in vs code
cp -v "../Scripts/Open In VS Code" ~/.local/share/nautilus/scripts
chmod 744 "$HOME/.local/share/nautilus/scripts/Open In VS Code"

#Open a directory in baobab
cp -v "../Scripts/Disk Usage Analyser" ~/.local/share/nautilus/scripts
chmod 744 "$HOME/.local/share/nautilus/scripts/Disk Usage Analyser"

#Copy the absolute path of a file or directory selected
cp -v "../Scripts/Copy Path" ~/.local/share/nautilus/scripts
chmod 744 "$HOME/.local/share/nautilus/scripts/Copy Path"

#Install app .deb/latpakref/appimage
cp -v "../Scripts/Install App" ~/.local/share/nautilus/scripts
chmod 744 "$HOME/.local/share/nautilus/scripts/Install App"


#########################################################################################################################################################################
#Copy wallpapers pictures directory
cp -v conf-files/wallpapers/avatar.jpeg ~/Pictures
cp -v conf-files/wallpapers/home.png ~/Pictures

##########################################################################################################################################################################
#Use super key properly
#set to auto start

#mkdir -p ~/.config/autostart

#echo "[Desktop Entry]
#Encoding=UTF-8
#Version=0.9.4
#Type=Application
#Name=Start Xcape
#Comment=Assign Super key properly
#Exec=xcape -e 'Super_L=Alt_L|F1'
#OnlyShowIn=XFCE;
#RunHook=0
#StartupNotify=false
#Terminal=false
#Hidden=false" > ~/.config/autostart/startXcape.desktop

