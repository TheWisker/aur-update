#!/bin/bash

: '
 @license AUR Update
 setup.sh

 Copyright (c) 2023, TheWisker.

 This source code is licensed under the GNU license found in the
 LICENSE file in the root directory of this source tree.
'

pacman -Syyu --noconfirm --needed base-devel git openssh    
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
