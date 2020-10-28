#!/bin/bash
string=$1
length=${#string}
number=${string:0:$(($length -1))}
direction=${string:(-1)}
case $direction in
    h) i3-msg resize shrink width $number ;;
    j) i3-msg resize shrink height $number ;;
    k) i3-msg resize grow height $number ;;
    l) i3-msg resize grow width $number ;;
esac
