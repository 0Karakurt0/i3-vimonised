#!/bin/bash
case $1 in
    h) i3-msg resize shrink width $number; unset $number ;;
    j) i3-msg resize shrink height $number; unset $number ;;
    k) i3-msg resize grow height $number; unset $number ;;
    l) i3-msg resize grow width $number; unset $number ;;
    [0-9]) number=$number$1; echo $number;
        export number=$number ;;
esac
