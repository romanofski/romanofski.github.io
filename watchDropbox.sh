#!/bin/bash
set -xe

filetowatch=~/Dropbox/blog.markdown

while true
do
    inotifywait -e close_write $filetowatch && $1
done
