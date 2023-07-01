#!/bin/bash

pacman -Syy --noconfirm --needed base-devel git openssh    
echo "Installed Runtime Packages"
mkdir -p /root/.ssh/
echo "Host *
    IdentityFile /root/.ssh/aur
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
    " > /root/.ssh/config
echo "${aur_key}" > /root/.ssh/aur
chmod 0700 /root/.ssh/aur
echo "Configured SSH Credentials"