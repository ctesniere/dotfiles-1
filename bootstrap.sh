#!/usr/bin/env bash

. mixins.sh


## Exit if execute on Windows
if [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
    output_error "ERROR: This script doesn't work on Windows"
	exit
fi


#git checkout master;
#git pull origin master;


# Pre check
install_or_update_nvm() {
	curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
	cd ~/.nvm
	LAST_TAG=`git describe --abbrev=0 --tags`
	git checkout $LAST_TAG
	cd -
}

create_symlinks() {
	dotfiles=(".gitconfig" ".gitignore" ".hgignore")
	for dotfile in "${dotfiles[@]}"
	do
		ln -sfv ${PWD}/dotfiles/${dotfile} ${HOME}/${dotfile}
	done
}

main() {
	./dotfiles/.atom/bootstrap.sh
	./dotfiles/.vscode/bootstrap.sh
	create_symlinks
	#install_or_update_nvm
}

main

git stash pop stash@\{0\} --quiet

exit


#################

cd "$(dirname "${BASH_SOURCE}")";


function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
