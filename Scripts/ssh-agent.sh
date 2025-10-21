#!/bin/bash

# start ssh-agent and add any key listed here
# some other process already starts it just add the key[s]
eval "$(ssh-agent -s)"

# github ssh-key
ssh-add -q ~/.ssh/github_id_ed25519
