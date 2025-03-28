#!/bin/bash

# Client Packaging
tmux new-window -t dty-sdks:2 -n client-packaging 'cd ~/Workspaces/devity/sdks/client-packaging && /bin/zsh;'

# Conf-man
tmux new-window -t dty-sdks:3 -n conf-man 'cd ~/Workspaces/devity/sdks/conf-man-v2 && /bin/zsh;'

# EST Client C
tmux new-window -t dty-sdks:4 -n est-client 'cd ~/Workspaces/devity/sdks/devity-est-client-c && /bin/zsh;'

# FIDO IoT
tmux new-window -t dty-sdks:5 -n fidoiot 'cd ~/Workspaces/devity/sdks/client-sdk-fidoiot && /bin/zsh;'

# Azure SDK
tmux new-window -t dty-sdks:6 -n azure-sdk 'cd ~/Workspaces/devity/sdks/azure-sdk-for-c && /bin/zsh;'

# MQTT Client
tmux new-window -t dty-sdks:7 -n mqtt-client 'cd ~/Workspaces/devity/sdks/mqtt-on-device && /bin/zsh;'


