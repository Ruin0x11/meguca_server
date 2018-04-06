#!/bin/sh
mkfifo /tmp/inotifywait.fifo
mkdir -p /data/site /data/site/build /data/site/rendered
cp -r /data/Makefile /data/site
cp -r /data/template /data/site/md
cd /data/site

echo "Building site..."
make

echo "Starting nginx..."
nginx

inotifywait -drq -o /tmp/inotifywait.fifo -e create -e modify /data/site/md

trap "true" PIPE
cat /tmp/inotifywait.fifo | 
    while read path op file; do 
        echo "Rebuilding site..."
        make
    done
trap PIPE
