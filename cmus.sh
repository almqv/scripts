#!/bin/bash

prepend_zero () {
        seq -f "%02g" $1 $1
}

artist=$(echo -n $(cmus-remote -C status | grep "tag artist" | cut -c 12-))

if [[ $artist = *[!\ ]* ]]; then
        song=$(echo -n $(cmus-remote -C status | grep title | cut -c 11-))
        position=$(cmus-remote -C status | grep position | cut -c 10-)
        duration=$(cmus-remote -C status | grep duration | cut -c 10-)
        echo -n "$artist - $song"
else
        echo
fi
