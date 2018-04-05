#!/bin/sh
mkfifo /tmp/inotifywait.fifo
mkdir /srv/site/md /srv/site/build /srv/site/rendered

inotifywait -drq -o /tmp/inotifywait.fifo -e create -e modify /srv/site/md

trap "true" PIPE
cat /tmp/inotifywait.fifo | 
    while read path op file; do 
        echo $path$file $op
    done
trap PIPE
