#!/bin/bash

if [ $# != 1 ]; then
    echo "Error: need to specify a project!"
    exit 1
fi

# Set Session Name
SESSION="${1//./-}"
SESSION="${SESSION//\//}"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then
    proj=$1
    # Start New Session with our name
    tmux new-session -d -s $SESSION

    # Name first Pane and start zsh
    tmux rename-window -t 0 'nvim'
    tmux send-keys -t 'nvim' "cd ~/Documents/$proj; nvim" C-m " nt" C-m " nd" C-m " gt" C-m

    tmux new-window -t $SESSION:1 -n 'aft'
    tmux send-keys -t 'aft' "cd ~/Documents/$proj" C-m
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:0
