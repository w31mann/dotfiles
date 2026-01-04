#!/bin/zsh
# shellcheck shell=bash

export SHELL="/usr/bin/zsh"
export EDITOR=nvim
export SUDO_EDITOR="nvim"
export SYSTEMD_EDITOR=nvim
export DIFFPROG="nvim -d"
export BROWSER="/usr/bin/brave"

export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-c"

export PATH="${PATH}:${HOME}/.cargo/bin"

export STARSHIP_CONFIG="${HOME}/.config/zsh/starship.toml"

export OGL_DEDICATED_HW_STATE_PER_CONTEXT="ENABLE_ROBUST"

export TAVILY_API_KEY="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"
export GOOGLE_SEARCH_API_KEY="AIzaSyB_kiqYa8XcqWszDzGaciP7dEg6iBOalUA"
export GOOGLE_SEARCH_ENGINE_ID="aptiv"

export QT_QPA_PLATFORMTHEME=gtk3
