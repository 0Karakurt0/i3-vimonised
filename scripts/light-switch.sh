#! /bin/bash
if [ $(light -G | cut -d '.' -f 1) -gt 0 ]; then
    echo "off"
    light -O # Saving current value
    light -S 0
else
    echo "on"
    light -I
fi
