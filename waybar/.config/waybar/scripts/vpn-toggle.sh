#!/bin/bash

set -eE -o pipefail

# Trap errors and show failure notification
trap 'notify-send --icon=dialog-error --urgency=critical "VPN Toggle Failed"' ERR

if [[ $(networkctl | awk '$2 ~ "wg0" {print $4}') == *routable* ]]; then
    pkexec networkctl down wg0
    notify-send --icon=notification-network-ethernet-disconnected "VPN Disconnected"
else
    pkexec networkctl up wg0
    notify-send --icon=notification-network-ethernet-connected "VPN Connected"
fi
