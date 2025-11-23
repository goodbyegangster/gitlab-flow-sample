#!/usr/bin/env bash

gh pr create \
  --base production \
  --head pre-production \
  --title "release $(date +"%Y-%m-%dT%H:%M:%S")"
