#!/bin/bash

# Set Session Name
SESSION="${1//./-}"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then
    proj=$1
    # Start New Session with our name
    tmux new-session -d -s $SESSION

    # Name first Pane and start zsh
    tmux rename-window -t 0 'nvim'
    tmux send-keys -t 'nvim' "proj; cd $proj; nvim" C-m

    tmux new-window -t $SESSION:1 -n 'term'
    tmux send-keys -t 'term' "proj; cd $proj" C-m

    tmux new-window -t $SESSION:2 -n 'aft'
    tmux send-keys -t 'aft' "proj; cd $proj" C-m
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:0
