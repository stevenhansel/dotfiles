#!/bin/bash

tmux split-window -h -p 80
tmux select-pane -t 1
tmux split-window -v -p 50
tmux select-pane -t 3
