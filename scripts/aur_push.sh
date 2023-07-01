#!/bin/bash

: '
 @license AUR Update
 aur_push.sh

 Copyright (c) 2023, TheWisker.

 This source code is licensed under the GNU license found in the
 LICENSE file in the root directory of this source tree.
'

for folder in $aur_folder/*/; do    
    # Only run if it has a PKGBUILD file
    if [[ -f "${folder}PKGBUILD" ]]; then
        # Only run if it has a .SRCINFO file
        if [[ -f "${folder}.SRCINFO" ]]; then
            pushd $folder
            if [[ -d "./.git" ]]; then
                git add .
                git commit -m "Github Automated: ${tag_name}"
                git push --set-upstream aur master
                rm -fr .git
                echo $folder_name package was updated!
            fi
            popd
        else
            echo $folder_name package lacks a .SRCINFO file
            exit 1
        fi
    else
        echo $folder_name package lacks a PKGBUILD file
        exit 1
    fi 
done