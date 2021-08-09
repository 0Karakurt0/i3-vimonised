#! /bin/sh

if setxkbmap -query | grep ua; then
    setxkbmap us,ru
else
    setxkbmap us,ua
fi
