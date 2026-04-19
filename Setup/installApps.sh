#!/usr/bin/env bash

apps=()

while read -r line; do
    firstChar="${line:0:1}"
    # ignore comments and blank lines
    if [[ "$firstChar" == "" || "$firstChar" == "#" ]]; then
        continue
    fi
    apps+=("$line")
done < "conf-files/programs.txt"

sudo apt update
sudo apt install "${apps[@]}"
