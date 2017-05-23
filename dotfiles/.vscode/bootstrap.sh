#!/usr/bin/env bash

check_software_exist code

PATH_FILE=`pwd`/`dirname $0`

if [ "$(uname)" == "Darwin" ]; then
	PATH_CONFIG="${HOME}/Library/Application Support/Code/User"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	PATH_CONFIG="${HOME}/.config/Code/User"
fi

mkdir -p ${PATH_CONFIG}
rm -fr "${PATH_CONFIG}/snippets" && ln -sfv "${PATH_FILE}/snippets/" "${PATH_CONFIG}/"
ln -sfv "${PATH_FILE}/settings.json" "${PATH_CONFIG}/settings.json"
ln -sfv "${PATH_FILE}/keybindings.json" "${PATH_CONFIG}/keybindings.json"

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
