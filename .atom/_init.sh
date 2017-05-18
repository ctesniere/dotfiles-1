#!/usr/bin/env bash

PATH_FILE=`pwd`/`dirname $0`

for file in `ls ${PATH_FILE}`; do
	ln -sfv ${PATH_FILE}/${file} ~/.atom
done

apm update

# Packages
apm install angularjs -s
apm install atom-beautify -s
apm install auto-detect-indentation -s
apm install config-import-export -s
apm install docblockr -s
apm install editorconfig -s
apm install file-icons -s
apm install fuzzy-finder -s
apm install git-blame -s
apm install goto-definition -s
apm install highlight-selected -s
apm install less-than-slash -s
apm install linter -s
apm install linter-eslint -s
apm install minimap -s
apm install minimap-git-diff -s
apm install minimap-highlight-selected -s
apm install pdf-view -s
apm install pigments -s
apm install atom-typescript -s
apm install tree-view-git-status -s
apm install zen -s

# Themes
apm install atom-material-ui -s
apm install nord-atom-ui -s
