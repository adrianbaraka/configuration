#!/bin/bash
# File: pip_wrapper.sh

# Path to your virtual environment's activate script
VENV_PATH="/home/abc/Utilities/myenv/bin/activate"

# Check if the virtual environment is active
if [ -z "$VIRTUAL_ENV" ]; then
    echo "Activating virtual environment from $VENV_PATH"
    source "$VENV_PATH"
fi


# Run the pip install command with all provided arguments
pip install "$@"

# Run your custom script
/home/abc/Utilities/scripts/update_pip_packages.sh

