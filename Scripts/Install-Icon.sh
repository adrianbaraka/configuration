#!/bin/bash

# install-icon.sh
# Installs an icon into a custom theme AND symlinks it into hicolor
# so notify-send works without affecting other app icons.

SOURCE="$1"

if [[ -z "$SOURCE" ]]; then
    echo "Usage: $0 <icon-file.svg|icon-file.png>"
    exit 1
fi

if [[ ! -f "$SOURCE" ]]; then
    echo "Error: '$SOURCE' is not a file."
    exit 1
fi

ICON_NAME=$(basename "$SOURCE")
ICON_BASENAME="${ICON_NAME%.*}"

# --- Custom theme folder ---
CUSTOM_THEME="$HOME/.local/share/icons/custom-notify"
CUSTOM_APPS_DIR="$CUSTOM_THEME/scalable/apps"

mkdir -p "$CUSTOM_APPS_DIR"

# Create index.theme if missing
if [[ ! -f "$CUSTOM_THEME/index.theme" ]]; then
    cat > "$CUSTOM_THEME/index.theme" <<'EOF'
[Icon Theme]
Name=CustomNotify
Comment=Custom icons for notify-send
Example=folder
EOF
    echo "Created index.theme in $CUSTOM_THEME"
fi

# Copy icon to custom theme
cp "$SOURCE" "$CUSTOM_APPS_DIR/$ICON_NAME"
echo "Copied '$SOURCE' to '$CUSTOM_APPS_DIR/$ICON_NAME'"

gtk-update-icon-cache "$CUSTOM_THEME"
echo "Updated icon cache for custom-notify theme"

# --- Symlink into hicolor so GTK can find it ---
HICOLOR_DIR="$HOME/.local/share/icons/hicolor/scalable/apps"
mkdir -p "$HICOLOR_DIR"

ln -sf "$CUSTOM_APPS_DIR/$ICON_NAME" "$HICOLOR_DIR/$ICON_NAME"
echo "Linked icon into hicolor: $HICOLOR_DIR/$ICON_NAME"

gtk-update-icon-cache "$HOME/.local/share/icons/hicolor"
echo "Updated icon cache for hicolor theme"

# --- Test notification ---
notify-send --icon="$ICON_BASENAME" "Icon Test" "Installed icon is now available!"
echo "Sent test notification using icon '$ICON_BASENAME'"

