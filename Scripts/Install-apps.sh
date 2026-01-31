#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Pass in text file containing programs to install"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "$1" is not a file
    exit 1
fi

#Install all programs in passed txt file
grep -vE '^\s*#|^\s*$' "$1" | sudo xargs -r apt install -y
