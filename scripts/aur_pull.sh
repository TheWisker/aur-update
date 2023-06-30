#!/bin/bash

mv ./.git ./.not_git
          
for folder in $aur_folder/*/; do
    pushd $folder

    folder_name=$(basename "${folder}")

    git init
    git remote add aur ssh://aur@aur.archlinux.org/$folder_name.git
    git fetch

    mkdir ./_tmp

    for file in $(find . -mindepth 1 -maxdepth 1 -not -name ".git" -not -name "_tmp"); do
        mv "$file" ./_tmp
    done

    git pull aur master

    for file in $(find ./_tmp -mindepth 1 -maxdepth 1); do
        if ! [[ -f "./$(basename "$file")" ]]; then
            mv "$file" .
        fi
    done

    rm -fr ./_tmp

    echo "Updated local $folder_name from AUR"

    popd
done