## This file contains any additions to a bashrc file 

#Include the current git branch if a git repo is detected in the prompt
PROMPT_COMMAND='
	PS1_CMD1=$(git branch --show-current 2>/dev/null);
	PS1="\[\e[92;1m\]┌──(\[\e[22;3m\]\u\[\e[23;1m\]@\h\[\e[22m\])\[\e[1m\]-[\[\e[38;5;38;3m\]\w\[\e[23;92m\]]\[\e[0m\] ";
	if [ -n "$PS1_CMD1" ]; then
	    PS1+="(\[\e[93m\]$PS1_CMD1\[\e[0m\])";
	fi;
	PS1+="\n\[\e[92;1m\]└─\[\e[38;5;202m\]\\$ \[\e[0m\]";
	export PS1'


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Source .bashfunctions file
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

#Include snap in path
export PATH=$PATH:/snap/bin

##Start ssh ssh-agent and add the github key redirect output to /dev/null
# Start the sshd service termux
sshd

# Initialize the ssh-agent
eval "$(ssh-agent -s)" > /dev/null 
# Add the SSH key
ssh-add -q ~/.ssh/github_id_ed25519	
