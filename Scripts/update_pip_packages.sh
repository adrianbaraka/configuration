#!/bin/bash
# File: update_requirements.sh

# Path to your requirements file
REQUIREMENTS_FILE="/home/abc/Documents/configuration/pip_requirements.txt"

# Update the requirements file
pip freeze > "$REQUIREMENTS_FILE"

echo "Updated $REQUIREMENTS_FILE with current pip packages."
