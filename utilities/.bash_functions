# Function to change directory and list contents
cdl() {
    if [ $# -eq 0 ]; then
        echo "Usage: cdl <directory>"
        return 1
    fi

    cd "$1" || return 1
    ls -la
}

#Git status alias
gs(){
    git status
}

