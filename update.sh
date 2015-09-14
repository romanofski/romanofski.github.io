#!/bin/bash
set -xe
make
git add -A .
git commit -m "Updated"
git push origin master --force
