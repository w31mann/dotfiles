#!/bin/bash

if [[ $(networkctl | awk '$2 ~ "wg0" {print $4}') == *routable* ]]; then
    pkexec networkctl down wg0
else
    pkexec networkctl up wg0
fi
