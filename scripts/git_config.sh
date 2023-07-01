#!/bin/bash

: '
 @license AUR Update
 git_config.sh

 Copyright (c) 2023, TheWisker.

 This source code is licensed under the GNU license found in the
 LICENSE file in the root directory of this source tree.
'

git config --global user.name $username
git config --global user.email $email
git config --global --add safe.directory /__w/$repo_name/$repo_name
echo "Configured Git Credentials"