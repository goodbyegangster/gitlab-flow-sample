#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FILES_DIR=${SCRIPT_DIR}/../files

BRANCH="feature/$(openssl rand -hex 4)"
TIMESTAMP="$(date +"%Y-%m-%dT%H:%M:%S")"

git switch main
git pull origin main

git branch "$BRANCH"
git switch "$BRANCH"

FILE_NAME=${TIMESTAMP}_$(openssl rand -hex 6)
touch "${FILES_DIR}/${FILE_NAME}.txt"
git add "${FILES_DIR}/${FILE_NAME}.txt"
git commit -m "${FILE_NAME}"

FILE_NAME=${TIMESTAMP}_$(openssl rand -hex 6)
touch "${FILES_DIR}/${FILE_NAME}.txt"
git add "${FILES_DIR}/${FILE_NAME}.txt"
git commit -m "${FILE_NAME}"

git push -u origin "$BRANCH"
gh pr create --fill
gh pr merge --auto --squash --delete-branch

git switch main
git pull origin main
git fetch --prune
