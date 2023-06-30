#!/bin/bash

for folder in $aur_folder/*/; do
    #Check if PKGBUILD file exists in the folder
    if [[ -f "${folder}PKGBUILD" ]]; then
        # Replace the pkgrel value with the updated one
        sed -i "s/^pkgrel=.*/pkgrel=1/" "${folder}PKGBUILD"

        echo "Updated pkgrel to 1 in ${folder}PKGBUILD"

        # Replace the pkgver value with the updated one
        sed -i "s/^pkgver=.*/pkgver=$tag_name/" "${folder}PKGBUILD"
            
        echo "Updated pkgver to $tag_name in ${folder}PKGBUILD"
    fi
    
    #Check if .SRCINFO file exists in the folder
    if [[ -f "${folder}.SRCINFO" ]]; then
        # Replace the pkgrel value with the updated one
        sed -i "s/^\([[:space:]]*pkgrel =\).*/\1 1/" "${folder}.SRCINFO"

        echo "Updated pkgrel to 1 in ${folder}.SRCINFO"

        # Replace the pkgver value with the updated one
        sed -i "s/^\([[:space:]]*pkgver =\).*/\1 $tag_name/" "${folder}.SRCINFO"
        sed -i "s/\(#tag=\).*$/\1$tag_name/" "${folder}.SRCINFO"
            
        echo "Updated pkgver to $tag_name in ${folder}.SRCINFO"
    fi
done