#!/bin/bash
echo "Running render actions"
cd /source/
git clone https://github.com/${gh_user}/${gh_repo}.git
cd /source/${gh_repo}
comply build
git config --global user.email ${gh_email}
git config --global user.name ${gh_user}
git remote set-url origin https://${gh_user}:${gh_token}@github.com/${gh_user}/${gh_repo}.git
git add --all
git commit -m'policy render job ran'
git push
