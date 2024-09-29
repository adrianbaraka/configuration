#!/bin/bash

# Check the current status of Wi-Fi
status=$(nmcli radio wifi)

if [ "$status" == "enabled" ]; then
    # Turn off Wi-Fi
    nmcli radio wifi off
    notify-send -i airplane-mode-symbolic "Airplane Mode" "Airplane mode enabled"
else
    # Turn on Wi-Fi
    nmcli radio wifi on
    notify-send -i airplane-mode-disabled-symbolic "Airplane Mode" "Airplane mode disabled"
fi

