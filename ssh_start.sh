#!/usr/bin/env bash

# Run ssh agent
eval $(ssh-agent -s)>/dev/null 2>&1
# Add keys to agent
for file in ~/.ssh/*; do
    if [[ -f "$file" && "$file" != *.pub && "$file" != *.sh ]]; then
        ssh-add "$file">/dev/null 2>&1
    fi
done
