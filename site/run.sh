#!/bin/sh
mkfifo /tmp/inotifywait.fifo
mkdir -p /data/site/md /data/site/build /data/site/rendered
cp -r /data/Makefile /data/template /data/site
cd /data/site

echo "Building site..."
make

inotifywait -drq -o /tmp/inotifywait.fifo -e create -e modify /data/site/md

trap "true" PIPE
cat /tmp/inotifywait.fifo | 
    while read path op file; do 
        echo "Rebuilding site..."
        make
    done
trap PIPE
