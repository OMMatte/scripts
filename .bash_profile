export PGHOST=localhost
export PATH=/usr/gcc-4.8.1/bin:$PATH
alias ls="ls -GFh"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export GREP_OPTIONS="--color"

# Source a git completion script
if [ -f $HOME/bin/git-completion.sh ]; then
       . $HOME/bin/git-completion.sh
else
  echo "Could not find git completion script"
fi

function we_are_in_git_work_tree {
    git rev-parse --is-inside-work-tree &> /dev/null
}

function parse_git_status {
    if we_are_in_git_work_tree
    then 
    local ST=$(git status --short 2> /dev/null)
    if [ -n "$ST" ]
    then echo -en ${COLRED}
    else echo -en ${COLGREEN}
    fi
    fi
}


COLGREEN="\033[m"
COLRED="\033[1;31m"
COLCLEAR="\[\033[0m\]"
 

source ~/bin/git-prompt.sh
# Sets the look of the prefix in the command prompt. Also displays the current git branch in the command prompt with colors
export PS1='\[\033[33;1m\]\W$(__git_ps1 "\[\033[m\] (\[$(parse_git_status)\]%s\[\e[0m\])")\[\033[m\]\$ '

# Alias
alias gs='git status'
alias gp='git pull'
alias gpush='git push'
alias gc='git commit -m'
alias ga='git add'
alias gac='git commit -am'
alias gAc='git add -A && git commit -m'
alias gd="git diff"


# EVRY RELATED

function setLocalEvryRepoSettings {
    git config user.name "Mathias Lindblom"
    git config user.email "mathias.lindblom@evry.com"
    git config url."https://".insteadOf git://
}

alias initEvryRepo=setLocalEvryRepoSettings

# AUTOMATICALLY ADDED


##
# Your previous /Users/mathiaslindblom/.bash_profile file was backed up as /Users/mathiaslindblom/.bash_profile.macports-saved_2014-03-16_at_11:36:56
##

# MacPorts Installer addition on 2014-04-17_at_11:54:08: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH
