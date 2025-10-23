#!/bin/bash

#bashrc
echo ../Setup/conf-files/bashrc >> "$HOME"/.bashrc

#bash aliases
file=../Setup/conf-files/bash_aliases
while read -r line; do
    if [ "$line" = "# [Home PC]" ]; then
        break
    else
        echo "$line" >> "$HOME"/.bash_aliases
    fi
done <$file

#bash functions
filef=../Setup/conf-files/bash_functions
while read -r line; do
    if [ "$line" = "# [Home PC]" ]; then
        break
    else
        echo "$line" >> "$HOME"/.bash_functions
    fi
done <$filef

#delete everything else
rm -rf ../Scripts ./Setup
rm ../commands.md ../notes.md ../pip_requirements.txt ../programs.md


