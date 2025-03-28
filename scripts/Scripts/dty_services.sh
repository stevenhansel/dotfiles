#!/bin/bash

tmux new-session -s dty-services -n common-pipelines 'cd ~/Workspaces/devity/devops/common-pipelines && zsh ~/Scripts/dty_services_windows.sh && /bin/zsh;'
