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

# User exports
export PROJ="/var/opt/devfiles/knathan1/projects"

# User aliases
alias tm="tmux attach || tmux new"
alias tms="bash ~/scripts/tmux-setup-project.sh"
alias proj="cd $PROJ"

# CE Specific Aliases
# alias build="bash $curr_proj/devtools/scripts/dev_build.sh"
alias build="bash ./devtools/scripts/dev_build.sh"
alias test="bash ./devtools/scripts/dev_build_and_test.sh"
# alias aft="ruby $curr_proj/functest/bin/test_main.rb --bindir=$curr_proj/build --testdatadir=$curr_proj/functest/data --cemroot=$curr_proj"
alias aft="ruby ./functest/bin/test_main.rb --bindir=./build --testdatadir=./functest/data --cemroot=."


# Exports
export CEM_BUILD_CACHE_PATH=/var/opt/devfiles/$USER/.build-cache
export CMAKE_EXPORT_COMPILE_COMMANDS=1
export PATH="$PATH:/opt/homebrew/bin/"
export EDITOR="/opt/homebrew/nvim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export HTTP_PROXY=http://proxy:8080
# export HTTPS_PROXY=http://proxy:8080
# export http_proxy=http://proxy:8080
# export https_proxy=http://proxy:8080
# export NO_PROXY="localhost|*.theice.com|*.intcx.net|*.cpex.com"
# export no_proxy="localhost|*.theice.com|*.intcx.net|*.cpex.com"
# export NODE_EXTRA_CA_CERTS='/home/knathan1/certs/nscacert.pem'
