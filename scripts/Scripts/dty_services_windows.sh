#!/bin/bash

# dty-ngx-frontend
tmux new-window -t dty-services:2 -n dty-ngx-frontend 'cd ~/Workspaces/devity/keynoa/dty-ngx-frontend && /bin/zsh;'

# dty-ocs-iot-sdk
tmux new-window -t dty-services:3 -n dty-ocs-iot-sdk 'cd ~/Workspaces/devity/keynoa/dty-ocs-iot-sdk && /bin/zsh;'

# est-server-kotlin
tmux new-window -t dty-services:4 -n est-server-kotlin 'cd ~/Workspaces/devity/keynoa/est-server-kotlin && /bin/zsh;'

# rendezvous-service
tmux new-window -t dty-services:5 -n rendezvous-service 'cd ~/Workspaces/devity/keynoa/rendezvous-service && /bin/zsh;'

# GDS Adapter
tmux new-window -t dty-services:6 -n gds-adapter 'cd ~/Workspaces/devity/keynoa/gds-adapter && /bin/zsh;'

# attributor-ui
tmux new-window -t dty-services:7 -n attributor-ui 'cd ~/Workspaces/devity/keynoa/attributor-ui && /bin/zsh;'

