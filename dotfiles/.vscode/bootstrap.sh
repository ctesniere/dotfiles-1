#!/usr/bin/env bash

type code > /dev/null 2>&1 || { echo >&2 "ERROR: **code (vscode)** is not installed!"; exit 1; }


PATH_FILE=`pwd`/`dirname $0`


if [ "$(uname)" == "Darwin" ]; then
	ln -sfv ${PATH_FILE}/settings.json ~/Library/Application Support/Code/User/settings.json
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	ln -sfv ${PATH_FILE}/settings.json ~/.config/Code/User/settings.json
fi

# Packages

code --install-extension DavidAnson.vscode-markdownlint
code --install-extension HookyQR.beautify
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install-extension eg2.tslint
code --install-extension robertohuertasm.vscode-icons
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension donjayamanne.githistory
code --install-extension johnpapa.angular2
