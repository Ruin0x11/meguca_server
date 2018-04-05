#!/bin/sh
mkfifo /tmp/inotifywait.fifo
mkdir -p /data/md /data/build /data/rendered

inotifywait -drq -o /tmp/inotifywait.fifo -e create -e modify /data/md

trap "true" PIPE
cat /tmp/inotifywait.fifo | 
    while read path op file; do 
        echo $path$file $op
    done
trap PIPE
