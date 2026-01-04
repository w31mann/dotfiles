#!/bin/bash

HWMON_PATH="/sys/class/hwmon/hwmon1"

# Get the main display temp (Tctl)
MAIN_TEMP_RAW=$(cat "$HWMON_PATH/temp1_input")
MAIN_TEMP=$((MAIN_TEMP_RAW / 1000))

TOOLTIP="<b>CPU Temperatur</b>"

# Loop through all available sensors in your k10temp dir
for label_file in "$HWMON_PATH"/temp*_label; do
    # Get the label name
    LABEL=$(cat "$label_file")

    # Get the corresponding input file (tempX_input)
    INPUT_FILE="${label_file%_label}_input"

    if [ -f "$INPUT_FILE" ]; then
        TEMP_RAW=$(cat "$INPUT_FILE")
        TEMP=$((TEMP_RAW / 1000))
        TOOLTIP="${TOOLTIP}\n${LABEL}: ${TEMP}°C"
    fi
done

if [ "$MAIN_TEMP" -ge 80 ]; then
    printf '{"text": "%s", "class": "critical", "tooltip": "%s"}\n' "$MAIN_TEMP" "$TOOLTIP"
else
    printf '{"text": "%s", "tooltip": "%s"}\n' "$MAIN_TEMP" "$TOOLTIP"
fi
