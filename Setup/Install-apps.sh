#!/bin/bash

#This is the configuration that require admin priviledge

#sudo apt update
#sudo apt upgrade

#Install all programs in conf-files/programs.txt
grep -vE '^\s*#|^\s*$' conf-files/programs.txt | sudo xargs -r apt install -y
