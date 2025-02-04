#!/bin/bash
#!/bin/bash

# Define the list of colors
colors=("Black" "Blue" "Green" "Orange" "Red" "Violet" "Yellow")

# Get a random index based on the array size
random_index=$((RANDOM % ${#colors[@]}))

# Select a random color
selected_color=${colors[random_index]}

# Apply the random color (example usage)
#echo "Selected color: $selected_color"


icon_theme="Flat-Remix-$selected_color-Dark"

#echo $icon_theme
xfconf-query -c xsettings -p /Net/IconThemeName -n -s "$icon_theme"
