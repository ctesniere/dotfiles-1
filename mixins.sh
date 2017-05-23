#!/usr/bin/env bash

function output_error() {
    printf "\033[0;31m ${1} \033[0m\n"
}
export -f output_error


function check_software_exist() {
    type ${1} > /dev/null 2>&1 || { output_error "ERROR: **${1}** is not installed!"; exit 1; }
}
export -f check_software_exist


