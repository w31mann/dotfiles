#!/bin/bash

# Query: temp, gpu load, mem used, mem total, power draw, fan speed
INFO=$(nvidia-smi --query-gpu=temperature.gpu,utilization.gpu,memory.used,memory.total,power.draw,fan.speed --format=csv,noheader,nounits)

TEMP=$(echo "$INFO" | cut -d',' -f1 | xargs)
LOAD=$(echo "$INFO" | cut -d',' -f2 | xargs)
MEM_USED=$(echo "$INFO" | cut -d',' -f3 | xargs)
MEM_TOTAL=$(echo "$INFO" | cut -d',' -f4 | xargs)
POWER=$(echo "$INFO" | cut -d',' -f5 | xargs)
FAN=$(echo "$INFO" | cut -d',' -f6 | xargs)

TOOLTIP="<b>GPU Metrics</b>\n"
TOOLTIP="${TOOLTIP}Load: ${LOAD}%\n"
TOOLTIP="${TOOLTIP}Power: ${POWER}W\n"
TOOLTIP="${TOOLTIP}Fan: ${FAN}%\n"
TOOLTIP="${TOOLTIP}VRAM: ${MEM_USED}MB / ${MEM_TOTAL}MB"

if [ "$TEMP" -ge 80 ]; then
    printf '{"text": "%s", "class": "critical", "tooltip": "%s"}\n' "$TEMP" "$TOOLTIP"
else
    printf '{"text": "%s", "tooltip": "%s"}\n' "$TEMP" "$TOOLTIP"
fi
