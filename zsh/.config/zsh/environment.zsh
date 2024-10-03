#!/bin/zsh
# shellcheck shell=bash

export SHELL="/usr/bin/zsh"
export EDITOR=nvim
export SUDO_EDITOR="nvim"
export DIFFPROG="nvim -d"
export SYSTEMD_EDITOR=nvim

export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-c"

export PATH="${PATH}:${HOME}/.cargo/bin"
export PATH="${PATH}:${HOME}/src/bsp/wrlinux/studio-cli"
export PATH="${PATH}:/mnt/c/Program Files/win32yank-x64"

export STARSHIP_CONFIG="${HOME}/.config/zsh/starship.toml"
