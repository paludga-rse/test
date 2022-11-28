#!/bin/sh

echo "get code from git repo"
cd $1
if [ -d .git ]; then
  echo .git;
  echo "git already present"
else
  echo "init git with remote"
  git init
  git remote add origin "${GIT_REMOTE}"
  git rev-parse --git-dir 2> /dev/null;
fi;

git reset --hard
git clean -fd
git pull origin main

echo "Exec Node app"
# tail -f /dev/null
node $1/app.js
