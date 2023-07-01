#!/bin/bash

: '
 @license AUR Update
 repo_push.sh

 Copyright (c) 2023, TheWisker.

 This source code is licensed under the GNU license found in the
 LICENSE file in the root directory of this source tree.
'

mv ./.not_git ./.git   
git add .
git commit -m "Release AUR Update"
git push
echo "Updated Repository"