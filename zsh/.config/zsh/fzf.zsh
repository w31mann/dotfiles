#!/bin/zsh
# shellcheck shell=bash

if [[ "${OSTYPE}" == "darwin"* && ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
    PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

source <(fzf --zsh)

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}

export FZF_DEFAULT_COMMAND="fd --unrestricted --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type directory --unrestricted --exclude .git"

export FZF_DEFAULT_OPTS="--history-size=200000 --cycle --pointer '>'"

# export FZF_DEFAULT_OPTS="--history-size=200000 --cycle \
#     --color fg+:italic:#eceff4 \
#     --color bg+:#3c465a \
#     --color hl+:italic:#ebcb8b \
#     --color hl:bold:#ebcb8b \
#     --color prompt:reverse,input:189 \
#     --color info:#81a1c1 \
#     --color gutter:#2e3440 \
#     --color pointer:bold:#81a1c1 \
#     --pointer '>'"

# catppuccin - macchiato
# export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
# --color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
# --color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
# --color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
# --color=selected-bg:#494D64 \
# --color=border:#6E738D,label:#CAD3F5"

# catppuccin - mocha
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"
