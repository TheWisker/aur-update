#!/bin/bash

git config --global user.name $username
git config --global user.email $email
git config --global --add safe.directory /__w/$repo_name/$repo_name
echo "Configured Git Credentials"