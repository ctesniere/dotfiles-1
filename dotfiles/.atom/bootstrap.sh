#!/usr/bin/env bash

PATH_FILE=`pwd`/`dirname $0`

for file in `ls ${PATH_FILE}`; do
	ln -sfv ${PATH_FILE}/${file} ~/.atom
done

apm update

function install-package-atom() {
	[ -d ~/.atom/packages/${1} ] && echo "Extension '${1}' is already installed." || apm install --production ${1}
}

# Packages

install-package-atom angularjs
install-package-atom atom-beautify
install-package-atom auto-detect-indentation
install-package-atom config-import-export
install-package-atom docblockr
install-package-atom editorconfig
install-package-atom file-icons
install-package-atom fuzzy-finder
install-package-atom git-blame
install-package-atom goto-definition
install-package-atom highlight-selected
install-package-atom less-than-slash
install-package-atom linter
install-package-atom linter-eslint
install-package-atom minimap
install-package-atom minimap-git-diff
install-package-atom minimap-highlight-selected
install-package-atom pdf-view
install-package-atom pigments
install-package-atom atom-typescript
install-package-atom tree-view-git-status
install-package-atom Zen

# # Themes
install-package-atom atom-material-ui
install-package-atom nord-atom-ui
