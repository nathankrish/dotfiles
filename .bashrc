# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Colors

export COLOR_NC='\e[0m' # No Color
export COLOR_BLACK='\e[0;30m'
export COLOR_GRAY='\e[1;30m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_LIGHT_GRAY='\e[0;37m'
export COLOR_WHITE='\e[1;37m'
UC=$COLOR_WHITE               # user's color

[ $UID -eq "0" ] && UC=$COLOR_RED   # root's color

PS1="\n\[${UC}\]\u\[${COLOR_LIGHT_PURPLE}\]@\H: \[${COLOR_LIGHT_BLUE}\]\${PWD} \$(~/scripts/git_status.sh) \n\[${COLOR_LIGHT_GREEN}\]→\[${COLOR_NC}\] "  

# User aliases
alias tm="tmux attach || tmux new"
alias tms="bash ~/scripts/tmux-setup-project.sh"

# CE Specific Aliases
alias build="bash ./devtools/scripts/dev_build.sh"
alias tests="cd build; ctest .; cd .."
alias aft="ruby ./functest/bin/test_main.rb --bindir=./build --testdatadir=./functest/data --cemroot=."
alias aftl="bash ~/scripts/run-aft-list.sh"
alias proj="ln -s build/compile_commands.json .; build"

function aftr() {
    rm -f aft_run.txt
    num_runs=1
    AFT_COMMAND="ruby ./functest/bin/test_main.rb --bindir=./build --testdatadir=./functest/data --cemroot=. --filter=\"$1\""

    eval "$AFT_COMMAND >> aft_run.txt"
    exit_code=$?

    while [ $exit_code -ne 0 ]; do
	    num_runs=$((num_runs + 1))
	    eval "$AFT_COMMAND >> aft_run.txt"
	    exit_code=$?
    done

    echo "Num runs for AFT [$1] -> $num_runs"
}

function aftf() {
    ruby ./functest/bin/test_main.rb --bindir=./build --testdatadir=./functest/data --cemroot=. --filter="$1"
}

alias aftc="bash ~/scripts/rerun-failed-list.sh"

function rd() {
    export DISPLAY=$(tmux show-environment | grep DISPLAY | sed 's/^DISPLAY=//')
}

# set -o vi

# Exports
export PROJ="/var/opt/devfiles/knathan1/projects"
export CEM_BUILD_CACHE_PATH=/var/opt/devfiles/$USER/.build-cache
export CMAKE_EXPORT_COMPILE_COMMANDS=1
export PATH="$PATH:/home/knathan1/bin/nvim/bin"
export PATH="$PATH:/home/knathan1/bin/ripgrep"
export PATH="$PATH:/home/knathan1/bin/fd"
export PATH="$PATH:/home/knathan1/bin/btop/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#
export HTTP_PROXY=http://proxy:8080
export HTTPS_PROXY=http://proxy:8080
export http_proxy=http://proxy:8080
export https_proxy=http://proxy:8080
export NO_PROXY="localhost|*.theice.com|*.intcx.net|*.cpex.com"
export no_proxy="localhost|*.theice.com|*.intcx.net|*.cpex.com"
export NODE_EXTRA_CA_CERTS='/home/knathan1/certs/nscacert.pem'
alias idlc="/var/opt/devfiles/knathan1/.build-cache/.conan/data/ifl/15.100.9/ice/stable/package/cc94916525099443c3e55b06a26ab3e30e807376/bin/idlc"

export MANPAGER='nvim +Man!' 
