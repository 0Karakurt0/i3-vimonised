#! /bin/bash
if [ $(light | sed 's/\..*//') -gt 0 ]; then
    echo "off"
    light -O
    light -S 0
else
    echo "on"
    light -I
fi
