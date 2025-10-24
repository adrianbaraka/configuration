#!/bin/bash

#set env variable for ps1
echo export IS_REMOTE="True" >> "$HOME"/.bashrc

#bashrc
cat ../Setup/conf-files/bashrc >> "$HOME"/.bashrc

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

#copy over install apps script
cp -v ../Scripts/Install-apps.sh ./Scripts/

# add the scripts directory to path
srcdir="$(pwd)"/Scripts
echo export PATH="$PATH:$srcdir" >> "$HOME"/.bashrc

#delete everything else
rm -rfv ../Scripts ../Setup
rm -v ../commands.md ../notes.md ../pip_requirements.txt ../programs.md



