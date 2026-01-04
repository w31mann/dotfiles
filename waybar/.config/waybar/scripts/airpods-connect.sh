#!/bin/bash

set -eE -o pipefail

declare -r dev="14:28:76:CC:67:C1"

bluetoothctl disconnect "$dev" || true
bluetoothctl discoverable on || true
systemctl --user start pipewire-pulse.service

sleep 2

if bluetoothctl connect "$dev"; then
    notify-send --icon=blueman-headset "Airpods connected"
else
    notify-send --icon=dialog-error --urgency=critical "Airpods connection failed"
fi

bluetoothctl discoverable off || true
