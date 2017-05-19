#!/usr/bin/env bash

git stash --include-untracked;
git checkout master;
git pull origin master;

# Pre check
check_software_exist() {
	softwares=("atom" "git")
	for sw in "${softwares[@]}"
	do
		# Notice the semicolon
		type ${sw} > /dev/null 2>&1 ||
			{ echo >&2 "ERROR: **${sw}** is not installed!"; exit 1; }
	done
}

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
		ln -sfv ${PWD}/${dotfile} ${HOME}/${dotfile}
	done
}

main() {
	check_software_exist
	./.atom/bootstrap.sh
	./.vscode/bootstrap.sh
	install_or_update_nvm
	create_symlinks
}

main
git stash pop stash@\{0\}
exit
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
