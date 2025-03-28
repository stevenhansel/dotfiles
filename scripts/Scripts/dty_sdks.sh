#!/bin/bash

tmux new-session -s dty-sdks -n common-pipelines 'cd ~/Workspaces/devity/devops/common-pipelines && ~/Scripts/dty_sdks_windows.sh && /bin/zsh;'

