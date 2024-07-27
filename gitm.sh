#!/usr/bin/env bash

option=$1
name=$2
name2=$3

print_help() {
	echo -e "gitm (option) (repo) (... repo)"
	echo -e "\toption:"
	echo -e "\t\tnew : creates a new repository"
	echo -e "\t\tmov : moves a repository"
	echo -e "\t\tdel : deletes a repository"
	echo -e "\trepo : name of repository"
	echo 
	echo -e "Example: gitm mov my_repo new_repo_name"
	echo -e "Example: gitm new my_new_repo_name"
	echo -e "WARNING: removing a repository will delete it forever! This can not be undone."
}

if [ -z "$option" ] || [ -z "$name" ]; then
	print_help
	exit
fi

if [ "$option" = "mov" ] && [ -z "$name2" ]; then
	print_help
	exit
fi


new_repo() {
	sudo mkdir -p /srv/git/$name.git && cd /srv/git/$name.git && sudo git init --bare && cd - && sudo chown -R git /srv/git/$name.git && sudo chgrp -R git /srv/git/$name.git && echo "Created new repository \"$name\"."

}

del_repo() {
	sudo rm -rf /srv/git/$name.git && echo "Deleted repository \"$name\"."
}

mov_repo() {
	sudo mv /srv/git/$name.git /srv/git/$name2.git && echo "Renamed repository \"$name\" to \"$name2\"."
}

if [ "$option" = "new" ]; then
	new_repo
elif [ "$option" = "mov" ]; then
	mov_repo

elif [ "$option" = "del" ]; then
	del_repo
else
	print_help
fi


