#!/usr/bin/env bash

Apt_packages=(
    'plocate'
    'smartmontools'
    'VSCode'
    'shellcheck'
    'glmark2 (benchmarking tool)'
    'net-tools'
    'gnome-shell-extension-manager'
    'curl'
    'source-highlight'
)

for package in "${Apt_packages[@]}"; do
    echo "${package}"
done