#!/usr/bin/env bash

CONTAINER_NAME="goofy_heisenberg"

# If first argument is "true", wait 60 seconds before checking
if [[ "$1" == "true" ]]; then
    sleep 60
fi

# Get container health status
STATUS=$(docker inspect --format='{{.State.Health.Status}}' "$CONTAINER_NAME" 2>/dev/null)

if [[ "$STATUS" == "healthy" ]]; then
    # Send a desktop notification
    notify-send -i jellyfin "Jellyfin" "Jellyfin Server is running. $CONTAINER_NAME is healthy!"
else
    notify-send -i jellyfin "Jellyfin" "$CONTAINER_NAME is not healthy! (status: $STATUS)"
fi

