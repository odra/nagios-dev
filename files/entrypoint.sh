#!/bin/bash

SCRIPTS_FOLDER='/opt/setup-scripts'

if [[ -d "$SCRIPTS_FOLDER" ]]; then
    for script in /opt/setup-scripts/*; do
        if [[ -x "$script" ]]; then
            `$script`
        fi
    done 
fi

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
